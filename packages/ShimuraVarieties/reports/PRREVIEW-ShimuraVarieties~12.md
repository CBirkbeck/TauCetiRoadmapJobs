# Review of ShimuraVarieties (pull request #933 at 6ad2612)

**Verdict:** needs changes

This is a full review of the repaired head. Since `3cf174f` the folder changed by 573 lines. The Tau Ceti gluing module path was corrected. The roadmap now owns the general theory of o-minimal structures (§§3.4b–3.4e), which it previously imported from StratifiedSpacesAndTameTopology, and `Suggested.lean` grew from 5 to 55 declarations (44 new o-minimal theorems and 6 new definitions). The whole README was reviewed, with the changed sections line by line, and all fifteen sampled targets were checked at their locators. I ran the gate, the dependency check, the elaboration, a `#check` file and a one-tactic probe, and elaborated each repair on a scratch copy. Three findings: one P2 (a headline theorem that can be stated at the pins is missing) and two P3.

## Previous findings

- R01 (r11, P3: the gluing module `TauCeti.Geometry.Manifold.Gluing` does not exist at the pin). **Repaired** at `2c299563`. README line 53 now reads "`TauCeti.Geometry.Manifold.Gluing.Basic` supplies `TauCeti.chartedSpaceOfIsOpenEmbedding` and `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`". That module exists at the pinned Tau Ceti `2fd255d9` (`TauCeti/Geometry/Manifold/Gluing/Basic.lean`). The string `Geometry.Manifold.Gluing` occurs nowhere else in the folder.

## R01 (P2) — The o-minimality of `R_an,exp` (§3.5a) can be stated at the pins, but `Suggested.lean` omits it and its docstring lists it as missing

**Location.** `TauCetiRoadmap/ShimuraVarieties/Suggested.lean` lines 41–42: "The period-map and definable-Chow route also needs polarized variations, the specified analytic structures and the structure `R_an,exp` of Section 3.5a." The README's §3.5a target (line 914) asks to "Prove that every definable subset of `ℝ` is a finite union of points and intervals".

**Claim.** The docstring treats `R_an,exp` as a carrier the pins lack, so §3.5a's theorem is not stated.

**Witness.** The theorem can be stated with what the file and Mathlib already provide. The scratch file below elaborates with `sorry` as its only warning (`lake env lean`): `R_an,exp` becomes a Mathlib `FirstOrder.Language` (built from `MvPolynomial.eval`, `AnalyticOnNhd` and `Real.exp`), and the theorem uses the file's own `OMinimalStructure`. This is van den Dries–Miller's theorem, the one deep o-minimal input specific to the definable route. It is a headline of the same kind as the §§3.4c–3.4e theorems the file already states.

**Repair.**
- Insert the following after the §3.4e block (after line 487, before the §5.1 block).
  - Use `abbrev`, not `def`: under the module system a plain `def` fails with "locally inferred compilation type differs".
  - The instance must be `noncomputable`.

```lean
/-! ## The o-minimal structure R_an,exp (Section 3.5a) -/

/-- The function symbols of `ℝ_an,exp` in arity `n`: polynomial maps, restricted analytic
functions (analytic on `[−1,1]ⁿ`, zero outside it) and, in arity one, the exponential. -/
abbrev RanExpFunctions (n : ℕ) : Type :=
  {f : (Fin n → ℝ) → ℝ // (∃ p : MvPolynomial (Fin n) ℝ, ∀ x, f x = MvPolynomial.eval x p) ∨
    (∃ g : (Fin n → ℝ) → ℝ, AnalyticOnNhd ℝ g (Icc (-1) 1) ∧
      ∀ x, f x = if x ∈ Icc (-1 : Fin n → ℝ) 1 then g x else 0) ∨
    ∃ i : Fin n, n = 1 ∧ ∀ x, f x = Real.exp (x i)}

/-- The language of `ℝ_an,exp`, with the strict order as its only relation symbol. -/
abbrev ranExpLanguage : FirstOrder.Language :=
  ⟨RanExpFunctions, fun n => PLift (n = 2)⟩

/-- `ℝ` as a structure for `ranExpLanguage`. -/
noncomputable instance : ranExpLanguage.Structure ℝ where
  funMap f x := f.1 x
  RelMap {n} r x := x ⟨0, by have := r.down; omega⟩ < x ⟨1, by have := r.down; omega⟩

/-- Section 3.5a (van den Dries–Miller, 1994): `ℝ_an,exp` is o-minimal. -/
theorem exists_oMinimalStructure_ranExp :
    ∃ S : OMinimalStructure ℝ, ∀ (n : ℕ) (s : Set (Fin n → ℝ)),
      S.Definable n s ↔ (univ : Set ℝ).Definable ranExpLanguage s := by
  sorry
```

- Update the docstring. Delete ", the structure `R_an,exp` of Section 3.5a" from lines 41–42, and add §3.5a to the paragraph at lines 13–24 that lists what is stated.
- Update the README:
  - Name `ranExpLanguage` and `exists_oMinimalStructure_ranExp` in §3.5a (line 914).
  - In the Summary (line 3) and How to read the build (line 147), change "§§3.4b–3.4e" to "§§3.4b–3.5a".

Tested: a scratch copy with this block (and the repairs of R02 and R03) elaborates with 27 `sorry` warnings and no error.

## R02 (P3) — Twenty o-minimal API lemmas in `Suggested.lean` are padding

**Location.** `Suggested.lean`:
- lines 118–196: the 13 calculus theorems `definable_preimage_comp` … `DefinableMapOn.exists_leftInvOn`;
- lines 266–269, 283–291 and 312–315: `IsCell.definable`, `IsCell.nonempty`, `IsCell.isLocallyClosed`, `IsCell.unique`;
- lines 363–366 and 379–385: `dim_mono`, `dim_le`, `dim_eq_bot_iff`.

**Claim.** These are headline theorems of the acceptance test.

**Witness.**
- The 13 calculus theorems restate, one per bullet, the elementary closure properties in the API bullets of README §3.4b (lines 806–808).
- `IsCell.definable`, `IsCell.nonempty`, `IsCell.isLocallyClosed` and `IsCell.unique` are inductions on the definition of `IsCell`. The r9 review flagged four of these and `dim_le` on the same grounds.
- `dim_le` and `dim_eq_bot_iff` are boundary facts.
- `dim_mono` is proved by the single term `iSup_mono fun _ => iSup_mono fun _ => iSup_le fun hC => le_iSup_of_le (hC.trans h) le_rfl`, which elaborates at the pin.

**Repair.**
- Delete these 20 declarations from `Suggested.lean`. The README keeps every statement as prose.
- In the README, delete the backticked names of exactly these 20 at lines 802 (`OMinimalStructure.DefinableMapOn.definable`), 806–808, 836 (`IsCell.definable`, `.nonempty`, `.isLocallyClosed`, `.unique`) and 857–858 (`dim_le`, `dim_eq_bot_iff`, `dim_mono`). A backticked name of the roadmap's own claims that `Suggested.lean` declares it.
- Keep everything else:
  - the definitions;
  - `monotonicity`, both parts of cell decomposition, `exists_ncard_le`, the two cell-structure theorems (`subset_or_subset`, `exists_isOpen_image_comp`) and the CAD comparison;
  - the three library bridges (`exists_oMinimalStructure_definable_iff`, `exists_oMinimalStructure_isSemialgebraic`, `definable_of_isSemialgebraic`);
  - the dimension invariance and laws, and the `semialgebraicDim` comparison;
  - density, divisibility, definable choice and curve selection.

Tested: removing exactly these 20 leaves 26 theorems (46 − 20), and the scratch copy elaborates with no error. No remaining declaration refers to a deleted one.

## R03 (P3) — The Lean section comments are not Layer headers

**Location.** `Suggested.lean` lines 66, 231, 352, 444 and 489: `/-! ## O-minimal structures and definable maps (Section 3.4b) -/` … `/-! ## CM types and reflex fields (Section 5.1) -/`.

**Claim.** The file's sections follow the README's layers in the required form.

**Witness.** The file now states targets of two layers, README "## Layer 3: Algebraicity and complex compactification functoriality" (line 706) and "## Layer 5: Complex multiplication and Siegel existence" (line 1395). The Lean form requires `/-! ## Layer k: <title> -/` section comments in README order, and the file has none.

**Repair.** Insert `/-! ## Layer 3: Algebraicity and complex compactification functoriality -/` before line 66 and `/-! ## Layer 5: Complex multiplication and Siegel existence -/` before line 489. The existing section comments may stay beneath them as sub-headings. Tested in the same scratch copy.

## Verified sound

**Gate, dependency check, outside-folder diff.** My run of the brief's gate command passes every check except the build, which it does not run:

```
gate ShimuraVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's run adds `build=0`. The dependency check gives:

```
depcheck: 244 roadmaps, 2470 edges, 0 problem(s)
```

It reports no UPWARD, CYCLE or `moved:` line (ShimuraVarieties is merge-order line 100). `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. The pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the same as main. I changed nothing in the worktree.

**Lean.**
- **Elaboration.** `lake env lean` of `Suggested.lean` (544 lines) gives 46 `sorry` warnings and nothing else.
- **Form.** The file has `module`, `public import Mathlib` and one Tau Ceti import, `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Dimension.Basic`, which exists at the pin and is built. There is no `set_option`, `lemma`, `#eval`, `#print` or `True` placeholder, and no sorry'd data:
  - `OMinimalStructure` is a structure of predicates and propositional fields;
  - `DefinableMapOn` and `DefinableFunOn` have real bodies;
  - `IsCell` and `IsCellDecomposition` are inductive predicates;
  - `dim` is a real `⨆` into `WithBot ℕ∞`;
  - `CMType`, `typeTrace` and `reflexField` are unchanged.
- **`#check` file.** I elaborated `#check @` of all 55 declarations once. Each elaborated type matches its README statement and carries its needed binders: the cell, monotonicity and dimension theorems carry `[Nonempty R] [DenselyOrdered R] [NoMinOrder R] [NoMaxOrder R] [OrderTopology R]`, the §3.4e theorems carry `[AddCommGroup R] [LinearOrder R] [IsOrderedAddMonoid R]`, and curve selection adds `[Nontrivial R]`. The 56th entry in `signatures.md` (line 205) is the docstring word "structure." misread as a declaration.
- **One-tactic probe.** I made two scratch copies with every `sorry` replaced by `simp_all`, and by `aesop`. All 46 theorems fail under both. The only one-line closure I found is `dim_mono` (R02).

**Mathematics of the new o-minimal block.** I checked every axiom and theorem against an instance; the table below records the values. Points worth recording:
- **Coordinate convention.** Projection forgets coordinate 0. Permutations, and hence `definable_image_comp` and `definable_preimage_comp` for arbitrary `ι` (including `m = 0`), follow from `init`-cylinders, diagonals and repeated `Fin.tail` projection.
- **CAD comparison.** `TauCeti.IsCAD` uses the same convention ("The new coordinate is coordinate `0`", `CAD/Basic.lean` lines 22–23 and 145). A CAD built over the last coordinate would fail `IsCellDecomposition`: the five-cell CAD of `ℝ²` refining `{x₀>0}` by the sign of `x₁` has `Fin.tail`-images `ℝ, (−∞,0), {0}, (0,∞)`, which do not partition. So `isCellDecomposition_of_isCAD` is true only because the conventions agree, and they do.
- **Generality of `definable_of_isSemialgebraic`.** It is stated for `[CommRing R] [LinearOrder R]` with no compatibility between order and ring. It remains true, since positivity sets are preimages of the definable `(0,∞)` under polynomial maps built from the two graphs. This is the generality of Tau Ceti's `IsSemialgebraic` (`Semialgebraic/Basic.lean` line 70).

**Pinned declarations opened.**
- Tau Ceti:
  - `TauCeti.IsSemialgebraic` (`Geometry/RealAlgebraic/Semialgebraic/Basic.lean:75`), `.exists_eq_setOf_sign_eval` (:381) and `HasSemialgebraicProjections` (:412, projection by `Fin.tail`);
  - its instance on `ℝ` (`CAD/Existence.lean:102`);
  - `IsSemialgebraicStack` (`CAD/Basic.lean:94`), `IsCAD` (:147) and `IsCAD.finite` (:182);
  - `semialgebraicDim` (`Semialgebraic/Dimension/Basic.lean:76`, codomain `WithBot ℕ∞`, nonempty subsets openly embedded in `ℝᵈ`) and `IsSemialgebraic.semialgebraicDim_union` (:248);
  - `IsSemialgebraic.semialgebraicDim_closure` (`Closure.lean:47`), `IsSemialgebraic.semialgebraicDim_image_appendEquiv_prod` (`Product.lean:49`), `IsSemialgebraic.semialgebraicDim_image_comp_le` (`Projection.lean:89`);
  - `semialgebraicDim_eq_finrank_of_chartedSpace` (`Manifold.lean:40`) and `semialgebraicDim_eq_two_mul_finrank_of_complex_chartedSpace` (:72);
  - `isSemialgebraic_iff_definable_real` (`RingLanguage.lean:135`, language `ring.sum order`).
- Mathlib:
  - `Set.Definable` (`ModelTheory/Definability.lean:54`), `Set.DefinableFun` (:446, definability of the graph) and `Set.DefinableMap` (:450, coordinatewise);
  - `Fin.appendEquiv` (`Logic/Equiv/Fin/Basic.lean:401`, `(a,b) ↦ Fin.append a b`);
  - `MeasureTheory.IsSetAlgebra` (`MeasureTheory/SetAlgebra.lean:60`: empty, complement, union);
  - `FirstOrder.Language.orderStructure` (`ModelTheory/Order.lean:209`) and `sumStructure` (`ModelTheory/Basic.lean:734`).
- Neither pin contains "o-minimal", cells or an o-minimal dimension: `grep -ril` over both libraries finds nothing.
- The previous review's 41 `#check`s of the other contracts (orbit relation, scheme predicates, CM-field API, `Over.pullback`, `Limits.span`, restricted products, affine invariant quotients) concern unchanged text and were not repeated.

**Ownership of the o-minimal theory.** The general theory moves down into this roadmap from StratifiedSpacesAndTameTopology, which is on the list of roadmaps this roadmap may not cite. I record the move here.
- No earlier owner exists:
  - Completed/RealAlgebraicGeometry on main (README line 80) excludes general o-minimal structures;
  - RealAnalyticGeometry on main has no o-minimal content;
  - AffineMorseLefschetz on main owns only the semialgebraic CAD dimension laws of A4.1 (line 965), which README line 863 names as the special case;
  - ComplexComparisonPartII (line 356) excludes o-minimal algebraization;
  - Mathlib and Tau Ceti have none.
- StratifiedSpacesAndTameTopology (#1519, another author) still claims the same objects: its README line 34 ("general o-minimal structures, monotonicity, cell decomposition, dimension, definable choice, curve selection") and its Suggested.lean line 220 (`structure OMinimalStructure`, in its own namespace, so no fully qualified name collides). Since that roadmap is not in the merge order and may not be a supplier here, the single owner is this roadmap, and #1519's Layer 4 is the one that must import §§3.4b–3.4e.
- AbelianSchemesAndArithmeticModuliPartII (#1405) already consumes "ShimuraVarieties §3.5a, o-minimal definable sets, dimension and cell decomposition" (its line 1539). That citation still resolves, because §3.5a applies §§3.4c–3.4e.
- `CMType`, `typeTrace` and `reflexField` are declared by no other roadmap (`roadmaps grep --lean-only`).

**Cross-roadmap citations.** The worker's resolver finds no cross-roadmap citation missing. Its 173 leads are the roadmap's own target names, the `OMinimalStructure.*` names (declared in `Suggested.lean`), the AdelicAlgebraicGroups carriers at that roadmap's head, and `…Semialgebraic.RingLanguage`, which does exist at the pin (`Semialgebraic/RingLanguage.lean`). The four new in-document anchors (`#34b-…`, `#34c-…`, `#34d-…`, `#34e-…`) match their headings. The removed StratifiedSpacesAndTameTopology link occurs nowhere. The dependency check confirms that every `This uses` and `*Needs:*` roadmap is on main or earlier in the order.

**Sources: the seeded sample.** All fifteen sampled targets check out at their locators. Page offsets (printed page against the extraction's page marker):

| Source | Printed page |
|---|---|
| milne-svi, milne-2007c, milne-1999, milne-1984t | marker |
| milne-1983a | marker + 238 |
| Deligne 1971 | marker + 121 |
| Pink | marker − 1 |
| milne-shih-1982c | marker + 228 |

- **0.6** — milne-svi:
  - lines 2579–2586: Theorem 5.17, p.59, `π₀ ≅ T(ℚ)^†∖T(𝔸_f)/ν(K)`;
  - 2604: Lemma 5.18;
  - 2617–2621: Lemma 5.19, local `H¹` and the Hasse principle;
  - 2623–2639: Lemma 5.20, `ν(G(ℚ)₊) = T(ℚ)^†`;
  - 2658–2659: Lemma 5.21, pp.60–61;
  - 2577–2578: `T(ℚ)^† = ℚ_{>0}` for `GL₂`.
  - The README's component formula, its restriction of strong approximation to `G^der`, and its noncompactness from SV3 are the source's.
- **1.5** — milne-svi lines 2517–2525 (p.58: the level maps and `T(g)`, `[x,a]↦[x,ag]`, a right action). These supply the two legs of the span. The double-coset normalization comparison is the roadmap's own argument, as its parenthetical says. Stacks Tag 035Q (cached Stacks book, Lemma 29.55.5, lines 121954–121965) supplies the normalization universal property it cites.
- **4.9a** — Deligne 1971 lines 742–759 (Théorème 5.1, printed p.153: `W` of tori with a cocharacter in the Galois orbit `Y₀ = Spec E(G,h)` and a regular `v`, `W → V` finite étale surjective) and 761–769 (Lemme 5.1.2, p.154: `W` irreducible with geometrically irreducible fibres over `Y₀`, by the irreducible conjugacy class and conjugacy of maximal tori in the connected centralizer). These are the README's statement and route.
- **5.5** — milne-svi lines 4349–4367 (Proposition 10.3, pp.100–101: a model over `ℚ^a` via full faithfulness on torsion and specialization). The extra polarization and level data follow from the same full faithfulness.
- **5.8** — milne-svi lines 4454–4458 (Theorem 10.10, p.103: `ord_v(π)/ord_v(q) = |Φ∩H_v|/|H_v|`, with `k` Galois containing the conjugates of `E`) and 4534–4554 ((57), `(π) = ∏_{φ∈Φ} φ⁻¹(Nm_{k/φE}P)`, and the unramified derivation, p.105).
- **5.11** — milne-2007c lines 947–950 (Theorem 3.10: `α(N_Φ(s)x) = σx`) and 957–972 (Remark 3.11(c), pp.22–23: `c·ψ = (σψ)(αx,αy)` with `c = χ_cyc(σ)/N_{E*/ℚ}(s) ∈ ℚ_{>0}`).
- **6.7** — milne-svi lines 5493–5521 (14.15–14.16 and the abelian-type deduction, p.127). See Source issues for a second misprint there.
- **7.0a** — milne-shih-1982c (an OCR'd author scan, fetched through the sources service without editing the manifest):
  - lines 37–51: (1.1), `(σ−1)(ι+1)χ = 0 = (ι+1)(σ−1)χ`, p.230;
  - 61–77: universality for tori split by `L` with a cocharacter satisfying (1.1), and `S = lim S^L`, p.231;
  - 83–91: (1.3), pp.231–232.
  - For CM `L`, `ι` is central, so the README's single relation is equivalent to (1.1).
- **7.0c** — milne-1999 lines 169–179 (Lemma 2.2 and its normalizer proof, p.4: `N` countable and closed, hence discrete, and finite covolume gives finite index). The README's "torsion-free" in place of "neat" is covered by that proof, which does not use neatness.
- **7.0g** — milne-1984t lines 434–447 (Theorem 2.4, pp.10–11) and 498–508 (Remark 2.7, p.12: Yau's metric quoted with `Ric(g) = g` in Milne's sign). The README's sign remark and its Kähler class `2πc₁(K_V) = −[Ric]` agree.
- **7.6** — milne-1983a lines 228–243 (Theorem 3.2, p.246: (a) the universal cover is a Hermitian symmetric domain; (b) `Γ′` is a lattice). The case split (symplectic, compact via Yau, remaining `E₆/E₇/D^ℍ` via Kazhdan) is the source's.
- **7.7** — milne-1983a lines 216–220 (Proposition 3.1, p.245) and 363–374 (Lemma 3.8, p.250: centre `H¹` injectivity away from type `Aₙ`, `n ≥ 4`), as the README's corrected reading says. platonov-rapinchuk-1979 Theorem 1 (p.279) was checked in the previous review, and its text is unchanged.
- **8.1** — milne-svi lines 2837–2840 (5.29(a), p.65), 4981–4986 (12.10, p.115) and 5149–5161 (13.7, p.119).
- **8.16a** — Pink:
  - 2.9, line 1140, p.32;
  - 2.13, line 1206, p.33;
  - 2.26(a), lines 1436–1444, p.39: for `V = 1`, an embedding into `(T,Y)×(G,H)×∏_{i≤n}(P₀,h(X₀))` with `n = dim Hom(U,ℚ)`, which is `0` for pure data, exactly as the README says;
  - 11.4–11.12, lines 7452–7614, pp.187–191;
  - 11.17–11.18, lines 7784–7795, pp.194–195.
- **8.19** — Pink lines 7868–7877 (12.3(a),(b), p.197: extension to `E(P,X)`, morphisms over the source reflex field) and 7903–7911 (12.6, p.198: descent on a dense open with normal schemes). This is the README's route.

**Adversarial table.** One row per sampled target, per headline theorem and per statement a finding touches.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `OMinimalStructure` condition 5 | `{1/n}⊂ℝ`; `{x∈ℚ : x²<2}`; "all subsets" | `{1/n}` contains no interval and is infinite, so no finite presentation exists; the cut at `√2∉ℚ` admits no rational endpoint; the power set fails via `{1/n}` | excludes both wrong models | — |
| `definable_preimage_comp` / `image_comp` | `m = 0`; non-injective `ι` | `R⁰` is a point, so `A ∈ {∅, univ}` and the preimage is `∅` or `univ`; the general case is a projection of `{(x,y) : x∈A, y_j = x_{ι j}}` by repeated `Fin.tail` | holds | R02 (delete) |
| `definableMapOn_iff_forall_definableFunOn` | `k = 0`, `A = ℕ ⊂ ℝ` (semialgebraic) | the right side is vacuous; the left side holds iff `A` is definable, false for `ℕ`; `hA` is needed and present | holds | R02 |
| `IsCell.unique` / `.nonempty` | `R = ℤ` (no density); `R = ℚ` | on `ℤ`, band `(0,1) = ∅` and band `(0,2) = {1}` equals the graph of `1`, so the set has dims 0 and 1; on `ℚ` the band `(l,u)` is infinite against one point for a graph | binders needed and present | R02 |
| `monotonicity` | `f = 1/x` on `ℝ∖{0}`; on `ℝ` with `f(0)=0` | `F = ∅` works because order-connected sets lie in one half-line; on `ℝ`, `(−1,1)` is neither continuous nor monotone, so `0 ∈ F` | holds | — |
| Cell decomposition (I) | hyperbola `xy=1` | 3 cells over each of `(−∞,0)` and `(0,∞)`, 1 over `{0}`: 7 | holds | — |
| `exists_ncard_le` | `{(t,x) : t,x∈ℕ, t≤x}` | fibre sizes `x+1` are finite but unbounded, so the set is not definable | consistent | — |
| `isCellDecomposition_of_isCAD` | Tau Ceti convention; last-coordinate CAD | both use coordinate 0, so the statement holds; a last-coordinate 5-cell CAD would give `Fin.tail`-images `{ℝ,(−∞,0),{0},(0,∞)}`, not a partition | holds at the pin | — |
| `definable_of_isSemialgebraic` | order unrelated to the ring | `{p>0} = {x : ∃y, y = p(x) ∧ 0<y}` uses only the graphs, constants and `<` | holds | — |
| `exists_oMinimalStructure_isSemialgebraic` | `ℝ` against `ℚ` | `ℝ`: sign conditions, finitely many roots, a finite union; `ℚ`: the image of the parabola is not semialgebraic (Tau Ceti docstring, `Basic.lean:405`) | stated for `ℝ` only | — |
| `dim_eq_bot_iff` / `dim_le` | `A = {a}`; `A = ∅` | a point is a 0-cell (graphs of constants), so `dim = 0 ≠ ⊥`; `∅` gives `⊥` | holds | R02 |
| `dim_eq_iff_nonempty_interior` | `n = 0`, `A = univ, ∅` | `dim univ = 0 = n` with interior a point; `dim ∅ = ⊥ ≠ 0` with empty interior | holds | — |
| `dim_image_appendEquiv_prod` | `A × ∅` | `⊥ = dim A + ⊥` in `WithBot ℕ∞`; with `dim ∅ = 0` instead, `0 ≠ dim A > 0` | holds | — |
| Fibre laws | `y² = x` over `x`; `d = ⊤` | `A(⊥) = (−∞,0)`, `A(0) = [0,∞)`, giving `max(⊥, 1+0) = 1 = dim A`; `A(⊤) = ∅`, so both sides are `⊥` | holds | — |
| `dim_closure_diff_lt` | upper half-plane; hyperbola | `1 < 2`; `⊥ < 1` | holds | — |
| `dim_eq_semialgebraicDim` | `[0,1]²`; a finite set; `∅` | `2 = 2` (open square inside); `0 = 0`; `⊥ = ⊥` | holds | — |
| `denselyOrdered_` / `exists_nsmul_eq_of_definable_add` | `ℤ`; `{0}`; `(ℚ,<,+)`; `k = 0` | `ℤ`: `2ℤ` is infinite but every interval inside it has ≤ 1 point, so the hypothesis fails; `{0}`: dense vacuously; `ℚ`: divisible; `k = 0`: `0•y = 0 ≠ x`, so `hk` is needed | holds | — |
| Definable choice / curve selection | `{x≤y≤x+1}`; topologist's sine; `n = 0`; `a∈A` | `f = id`; no curve reaches `(0,0)` (it hits second coordinate `1` arbitrarily close), so the set is not definable; `n = 0`: constant curve, `ε` exists in a nontrivial divisible group; `a∈A`: constant curve | holds | — |
| §3.5a `R_an,exp` (R01) | `exp`, `log`; `sin(πx)` on `ℝ` | `exp` is a symbol and `log`'s graph is its transpose; `sin(πx)` is not a symbol (only restricted sine), otherwise `ℤ` would be definable | scratch statement elaborates | R01 (add) |
| Headline `reflexField_isCMField` | `ℚ(i)×ℚ(√−3)`; `ℚ(ζ₈)`, `{1,3}` | ring maps factor through one factor and `|Φ| = 2`, `E* = ℚ(i,√−3)` (CM); `ζ₈+ζ₈³ = i√2` under both embeddings of `Φ`, so `E* = ℚ(√−2)` of degree 2 | holds | — |
| Headline `reflexField_representation` | `E = ℚ(i)`, `k = ℚ` and `k = ℚ(i)`; `n = 0` | `tr ρ(i) = i ∉ ℚ`, so no `ρ`, and `ℚ(i) ≰ ℚ`; `k = ℚ(i)`: `ρ = φ` on `k¹`; `n = 0` has trace `0 ≠ |Φ|` at `a = 1` | holds | — |
| 0.6 component formula | `GL₂`, `K(N)` | `ℚ_{>0}∖𝔸_f^×/(1+Nℤ̂)^× = (ℤ/N)^×`; at `N = 3`, 2 components | holds | — |
| 1.5 coarse `Y₀(2)` apex | `t = a²/b − 3` | `j = 256t³/(t−1)` (from `c₄ = 16b t`, `Δ = 16b³(t−1)`); `Q = s²(t−1)+s(t²−t)−t²` has discriminant `t²(t−1)(t+3)`, a nonsquare; at `(0,0)` the quadratic part `−(t²+ts+s²)` has discriminant `−3 ≠ 0`, a node | holds | — |
| 4.9a incidence cover | `Res_{ℚ(i)/ℚ}G_m` | the Galois orbit `{μ, μ̄}` gives `W = V × Spec ℚ(i)`, with 2 geometric components | holds | — |
| 5.5 number-field model | CM elliptic curve `ℂ/ℤ[i]` | `j = 1728 ∈ ℚ`; a model over `ℚ` with CM by `ℤ[i]` over `ℚ(i)` | holds | — |
| 5.8 Shimura–Taniyama | imaginary quadratic `E`, `Φ = {φ}` | inert: `H_v = {φ,φ̄}`, slope `1/2`; split: `H_v = {φ}` or `{φ̄}`, slopes `1, 0` | holds | — |
| 5.11 multiplier | `s = 2` finite principal, `σ = id` | the archimedean part of `E*` is connected, so `art(2_f) = 1`; `N(s) = 4`, `α = 1/2`, `ψ(αx,αy) = ψ/4 = c ψ` | holds | — |
| 6.7 abelian type | dependence on Layer 7 | the route is 14.15 + 14.16 from the Hodge type (milne-svi 5498–5521) with no conjugation | holds | — |
| 7.0a Serre torus | `L = ℚ(i)` | `(c+1)χ = (n₁+n₂)([1]+[c])` is Galois-invariant, so every `χ` qualifies and `S^L = Res G_m`, rank 2 | holds | — |
| 7.0c normalizer index | `ℤ² ⊂ Aut(ℂ)` | all translations normalize it, so the normalizer is not discrete; Euclidean factors must be excluded | holds | — |
| 7.0g Kähler class | `Ric(ω) = −ω` | `[ω] = −[Ric] = −2πc₁(X) = 2πc₁(K_V)`; abelian variety: `K` trivial, not ample | holds | — |
| 7.6 / 7.7 conjugation | compact against `E₆/E₇` cases; `SL₁(D)` | Theorem 3.2's proof splits symplectic / compact (Yau) / Kazhdan; PR 1979 gives perfection only, and a reductive rank-one group with positive-dimensional centre has a proper noncentral normal derived group | holds | — |
| 8.1 tower degree | `N = 3` | `|GL₂(𝔽₃)| = 48`, `−1` acts trivially, degree 24; `φ(3) = 2` components against 1 | holds | — |
| 8.16a pure reduction | Pink 2.26(a), `U = 0` | `n = dim Hom(U,ℚ) = 0`, so the embedding lands in `(T,Y)×(G,H)` | holds | — |
| 8.19 boundary | `K(9) → K(3)` | both levels are neat and étale on the open; cusp widths 9 and 3 give ramification index 3 | holds | — |

**Shape.**
- **README.** It has the required sections in order: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Prerequisites, Layers 0–8 each ending with Examples and Dependencies, Downstream consumers and References.
- **New o-minimal sections.** The definitions in §§3.4b–3.4e carry API bullets and at least three Checks each (3, 4, 3 and 3). The References entry for van den Dries names exactly the chapters cited. The gate's text scanners are all 0.

**Headline theorems.**
- **README headlines:**
  - canonical towers for every pure datum (§§7.14, 8.22);
  - Baily–Borel algebraization (§2.7);
  - Borel algebraicity (§§3.2, 3.7);
  - uniqueness (§4.12);
  - the main CM theorem (§5.10);
  - the Siegel and abelian-type models (§§5.13, 6.7);
  - arithmetic minimal compactifications (§§8.18–8.23);
  - the `GL₂` comparisons (§§8.10–8.16);
  - the reflex-field theorems (§5.1);
  - the o-minimal foundations (§§3.4b–3.4e) and `R_an,exp` (§3.5a).
- **Statable at the pins:** §5.1 (stated), §§3.4b–3.4e (stated) and §3.5a (absent; R01).
- **Not statable:** the rest need data, analytic-space, realization and canonical-model carriers, which the docstring names layer by layer.

## Not verifiable

- **van den Dries, *Tame Topology and o-minimal Structures* (1998).** Cited for §§3.4b–3.4e: Ch. 1 §§2–3, Ch. 2, Ch. 3 (1.2), (2.11) and §2, Ch. 4 §1, Ch. 6 (1.2) and (1.5). There is no legal open copy, and `sources.toml` has no key for it, so it should be recorded as `uncertified` with these locators. I checked the mathematics (table above), not the numbering.
- **Yau 1978** (§7.0g, Wiley), **Kazhdan 1983** (§7.6, Springer) and **Margulis's book** (§7.0c): paywalled. Milne's summaries (milne-1984t 498–508, milne-1999 169–179) were read instead.
- **Settled `uncertified`:** van den Dries–Miller 1994 (§3.5a), Clozel 1986 (§7.0h) and Platonov–Rapinchuk 1994 (§7.0e).
- **Baily–Borel 1966** (Layer 2): Annals paywall, cited by locator.
- **Ownership against open pull requests** that the brief lists without files was checked only through the `roadmaps grep` and `roadmaps show` index.

## Source issues

- **Misprint** in milne-svi at Proposition 14.16(b), printed page 127: the source says the canonical model for the target connected variety is a quotient of the canonical model for that same target; it should be a quotient of the canonical model for the source `Sh°(G₁,X₁)` by the kernel of the map of completions; affects nothing.
- **Misprint** in milne-svi at the abelian-type existence paragraph after 14.16, printed page 127: the source cites 14.16 both for connected and for full Shimura varieties of abelian type; the passage from connected to full varieties is 14.15; affects nothing.
