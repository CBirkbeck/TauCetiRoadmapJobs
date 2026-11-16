<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17628#issuecomment-6904751840 -->
Red team round 1 pass b (claude) of 6f5187e

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) headline bullet promises projectivity of the graph; the acceptance statement does not state it

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md:149`: "integrality, projectivity
     and the projection properties of the graph (§1.2);". `README.md:200` and
     `Suggested.lean:89–95` (`graph_isIntegral_and_projections`).
   - **Claim.** The headline list says `Suggested.lean` states projectivity of `Γ_f`.
   - **Witness.** The Lean conclusion is `IsIntegral ∧ topologicalKrullDim = ∧ IsProper (graphFst f) ∧
     IsIso (graphFst f ∣_ f.domain) ∧ (dominant → surjective)`: no `IsProjectiveOver`. README line 200
     describes the statement the same way, without projectivity.
   - **Repair.** Projectivity of a closed subscheme of `X ×_K Y` is not a headline; change the bullet,
     not the Lean. Replace line 149 by: "- integrality and dimension of the graph, and the properties of
     its two projections (§1.2);". The first item of §1.2 keeps "projective over `K`" as a target.

2. **F02** (P3) `algebraicEntropy_baseChange` is a one-step corollary of `dynamicalDegree_baseChange` (padding)

   - **Location.** `Suggested.lean:451–468`; `README.md:667` ("Invariance under extension of the field
     … is `algebraicEntropy_baseChange`").
   - **Claim.** It is stated as a headline acceptance theorem.
   - **Witness.** `algebraicEntropy` is `Real.log ((Finset.range (d + 1)).sup' _ fun k ↦ dynamicalDegree
     K d k f ω)` (`Suggested.lean:318–321`). With identical hypotheses, the statement is
     `congrArg Real.log (Finset.sup'_congr _ rfl fun k hk ↦ dynamicalDegree_baseChange … k _)`
     (Mathlib `Finset.sup'_congr`, `Mathlib/Data/Finset/Lattice/Fold.lean:609`). The file does not state
     the parallel corollary for birational conjugacy, which README §5.4 lists in the same item.
   - **Repair.** Delete `algebraicEntropy_baseChange` from `Suggested.lean`. In `README.md:667` replace
     the last sentence by: "Invariance under extension of the field and under birational conjugacy, in
     the second item, follow term by term over `0 ≤ k ≤ d` from `dynamicalDegree_baseChange` and
     `dynamicalDegree_birational_conj`." The README item of §5.4 stays.

3. **F03** (P3) "big and nef" is used with a private definition; the owner on main is not cited

   - **Location.** `README.md:45` ("A *big and nef* line bundle is a nef `L` with `(L^d) > 0`"),
     `README.md:18` (volume and bigness imported from ArakelovGeometryAndAbelianHeightsPartII §0.3),
     `README.md:391`.
   - **Claim.** Bigness is cited only to the open roadmap ArakelovGeometryAndAbelianHeightsPartII §0.3.
   - **Witness.** On main, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md:364–375`
     (§1.6): bigness by section growth on an integral proper `k`-scheme, and "For integral proper V and
     nef L, bigness is equivalent to (L^n·V)>0". A roadmap on main is the earlier owner.
   - **Repair.** In line 45 append after the first sentence: "By AlgebraicModuliForArithmeticGeometryPartII
     §1.6 (with §2.2 here to read its Chow degree as the numerical intersection) this is the same as `L`
     nef and big in the section-growth sense." In line 18 change "Volume, bigness, the Hilbert–Samuel
     formula" to "Bigness on integral proper schemes and its equivalence with `(L^d) > 0` for nef `L`:
     its §1.6. Volume, the Hilbert–Samuel formula"; add "§1.6: bigness of a line bundle on an integral
     proper `K`-scheme; for nef `L`, big if and only if `(L^d) > 0`." to the
     AlgebraicModuliForArithmeticGeometryPartII contract block (after the §1.5 bullet) and "§1.6" to the
     Layer 3 Dependencies line. In line 391 replace "is big, with `vol(A) = (A^r)`, by
     ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′)" by "is big by
     AlgebraicModuliForArithmeticGeometryPartII §1.6, with `vol(A) = (A^r)` by
     ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′)". The route of §3.3 uses only (2′) and is unchanged.

4. **F04** (P3) the pinned `TauCeti.AlgebraicGeometry.IsModification` is used but not cited at the pin

   - **Location.** `README.md:195` ("`π_1` is a modification in the sense of SchemeAndStackFoundations
     §4.11 with witness `U`"); "From Tau Ceti" block, `README.md:77–90`; `README.md:129`.
   - **Claim.** Modifications are imported from a roadmap section.
   - **Witness.** Pinned Tau Ceti, `TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`:
     `class IsModification (f : X ⟶ Y) : Prop extends IsProper f` with a dense open `U`, dense preimage
     and `IsIso (f ∣_ U)`. SchemeAndStackFoundations §4.11 itself says "Modifications are Tau Ceti's".
   - **Repair.** Add to "From Tau Ceti": "- `TauCeti.AlgebraicGeometry.IsModification`
     (TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53): a proper morphism that is an
     isomorphism over a dense open with dense preimage; no integrality is assumed. §1.2 proves it for
     `π_1`, with the domain of `f` as the open." In line 195 replace "a modification in the sense of
     SchemeAndStackFoundations §4.11 with witness `U`" by "a modification (Tau Ceti's
     `TauCeti.AlgebraicGeometry.IsModification`, the notion of SchemeAndStackFoundations §4.11) with
     witness `U`", and add the name to the §1.2 *Needs:* line. No change to `Suggested.lean`.

5. **F05** (P3) the de Jong contract is worded differently from the supplier section

   - **Location.** `README.md:129`: "It gives an alteration from an integral `X_1` that is open in a
     regular scheme projective over a finite extension of the base field."
   - **Claim.** This is what SchemeAndStackFoundations §4.19 provides.
   - **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7739–7742` (`alteration_theorem`):
     "an open immersion `j : X_1 → X̄_1` into a regular scheme `X̄_1` **projective** over `k`"; no finite
     extension occurs in the statement.
   - **Repair.** Replace the sentence by: "It gives an alteration from an integral `X_1` with an open
     immersion into a regular scheme projective over the base field." §3.4 applies it over the
     algebraically closed `Ω`, where the two wordings agree, so no route changes.

6. **F06** (P3) docstring of `exists_mixedDegree_comparison` cites a result that does not compare polarizations

   - **Location.** `Suggested.lean:253`: "Dang, Theorem 1 (ii); Dinh–Sibony, Corollaire 7."
   - **Claim.** Dinh–Sibony's Corollaire 7 supports the two-sided comparison of `deg_{k,ω}` and
     `deg_{k,ω'}`.
   - **Witness.** dinhsibony2005 lines 256–263: the corollary states convergence of the sequence and
     birational invariance of the dynamical degrees; its proof compares a map with its birational
     conjugate for one fixed Kähler form. dangfavre2021 lines 457–460 states the comparison of two
     classes.
   - **Repair.** Line 253: "… for every dominant `K`-rational self-map `f`. Dang, Theorem 1 (ii);
     Dang–Favre, Theorem 1.3 (second item). -/". Append to the docstring of
     `exists_mixedDegree_birational_comparison` (line 277): "Dinh–Sibony, Corollaire 7 (the estimate in
     its proof), over `ℂ`."

Six P3 findings (R01–R06). No P1 or P2: no statement was refuted on any instance tried, every
cross-roadmap citation and every pinned declaration resolves where it is cited, and the dependency
check is clean. Nothing was edited in the package; no Lean was run (the brief gives no Lean command),
so the Lean side was read against the elaborated signatures in the job's scratch `signatures.md`.

## Dependency check

    depcheck: 235 roadmaps, 2234 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Suppliers named by the README and their places: on main
CyclotomicClassGroupsAndStickelberger, AlgebraicModuliForArithmeticGeometry,
AlgebraicModuliForArithmeticGeometryPartII, SchemeAndStackFoundations, StableReduction; earlier in the
merge order LefschetzPencilsAndVanishingCycles (75), ArithmeticDynamics (357),
ArakelovGeometryAndAbelianHeightsPartII (360); this roadmap is at 361. None is on the never-cite list.

## Verified sound

Counts: 33 declarations read (11 definitions, 2 proved instances, 20 `sorry` theorems); 27 targets
read (§§1.1–6.4); 70 source locators opened in 13 texts; about 75 Checks and witnesses recomputed
(every Check of §§1.1–6.4 that has a value, and the Conventions witnesses); 34 cited sibling sections
located, 22 of them read for the statement consumed; 103 pinned declarations (Mathlib 62, Tau Ceti
41) found at their cited file and line.

**Suggested.lean, statement by statement** (context: no `variable` block; every binder is in the
declaration's own signature; `signatures.md` reports 0 lost binders; its entry "`,` (class, line 24)"
and "line 474: unexpected token" are artefacts of the word "class," in the module docstring, not
declarations).

| declaration | instances tried, values on each side | result |
| --- | --- | --- |
| `graph`, `graphFst`, `graphSnd` | `id_X`: diagonal, both projections iso; constant `ℙ¹ → ℙ¹`: `ℙ¹ × pt`; absolute product versus `X ×_K Y`: same closed set, reduced image | determines `Γ_f` for `K`-maps |
| `topologicalDegree` | `z ↦ z²`: 2 (char 2 included); Frobenius of `ℙ^d`: `p^d`; projection `ℙ² ⤏ ℙ¹`: junk 0 | agrees with §1.1 |
| `graph_isIntegral_and_projections` | non-dominant constant map: surjectivity clause vacuous, other four hold; `d = 0`: `Spec L`, all trivial | true as typed |
| `numericalIntersection` | `r = 1`, `O(−2)` on `ℙ¹`: `(0−1) − (1−0) = −2`; `r = 0` on `Spec L`: `h⁰ = [L:K]`; `P = n₁² + n₁n₂`: `2−1−0+0 = 1` | mixed difference correct; exponent `r − |S|` |
| `realIntersection` | `[O(1,0)] + [O(0,1)]` on `ℙ¹×ℙ¹`: `0+1+1+0 = 2 = (O(1,1)²)`; `[O(1,0)]+[O(0,1)]−[O(1,1)]`: `0+0+2+2−2−2 = 0`; `r = 0`: one empty tuple, value `h⁰(O_X)` | depends only on the class |
| `IsNef` | single class with coefficient 1: the `IsNef` of AlgebraicModuliForArithmeticGeometryPartII (`Suggested.lean:116` there), whose curves are closed in a proper scheme, hence proper; `2[O(1,1)] − [O(1,0)]`: degrees 2, 1 | same notion, different namespace |
| `khovanskii_teissier` | `ℙ¹×ℙ¹`, `m = 0`: `A = O(2,1)`, `B = O(1,1)`: `4·2 = 8 ≤ 9`; `E×E`: `0·2 ≤ 9`; `ℙ²⊔ℙ²` (excluded by `IsIntegral`): `25 > 16` | true; integrality needed |
| `siu_inequality_products` | `(ℙ¹)³`, `i = 2`, `j = 1`: `6·1 ≤ 4·1·2`; `i = 0`: equality; `j = 0`: equality; `i = j = 0`: `h⁰·h⁰ ≤ h⁰·h⁰`; `ℙ¹×ℙ¹`, `i = j = 1`, `B = aF₁+bF₂`, `A = F₁`, `C = F₂`: `2ab·1 ≤ 2·b·a` | true, sharp |
| `mixedDegree` | `z ↦ z²`: `(1,0) ↦ 1`, `(0,1) ↦ 2`; index `q` counts target copies | matches Conventions |
| `mixedDegree_pos` | `d = 0`: `h⁰(O_Γ) = [L:K] > 0`; nef non-big `O(1,0)`, `id`: `0` (excluded by `hLd`) | true |
| `mixedDegree_boundary` | `z ↦ z²`: `1 = (H)`, `2 = 2·(H)`; `d = 0`: both `[L:K]`, `e = 1` | true for all real classes |
| `mixedDegree_baseChange` | `ℙ¹_ℂ/ℝ`, `id`, `O(1)`, `(p,q) = (0,1)`: `2` over `ℝ`, `1 + 1` on the two diagonals over `ℂ`; truncation `p + q + 1 = d + 1` on both sides | true without geometric integrality; `hY` and dominance are not needed for truth (note, not a finding) |
| `mixedDegree_comp_le` | `z²∘z²`, `d = 1`: `(1,0)`: `1·1 ≤ 2⁰·1·1`; `(0,1)`: `1·4 ≤ 1·2·2`; Cremona `(1,1)`: `1 ≤ 2·2·2`; `d = 0`: `[K₂:K][K₁:K] = [K₁:K][K₂:K]`; derivation on `W`: `e(f₁)` cancels | true; `f₁.comp f₂` is `f₂ ∘ f₁` |
| `exists_mixedDegree_comparison` | `ℙ¹×ℙ¹`, `ω = O(1,1)`, `ω' = O(2,1)`, swap: `2` and `5`, `C = 9` | true; `C` before `f` |
| `exists_mixedDegree_birational_comparison` | `φ` the identity partial isomorphism: reduces to the comparison; conjugate typed `Y ⤏ Y` | true |
| `isDominant_partialIso`, `isDominant_iterate` | proved; needed to type `comp` and `iterate` | kept |
| `iterate` | `n = 0`: `id`; `n + 1`: `f.comp (iterate f n) = f^n ∘ f` | matches Conventions |
| `dynamicalDegree` | `n = 0` term: exponent `1/0 = 0`, value 1, irrelevant to `atTop` | fine |
| `tendsto_dynamicalDegree` | morphism of degree `a` on `ℙ^d`: limit `a^k`, infimum of `((d−k+1)^k a^{nk})^{1/n}` is `a^k`; `d = 0`: `C₀·deg = 1`, both sides 1; Cremona `k = 1`: values `2,1,2,…` → 1, infimum of `(2·deg)^{1/n}` → 1 | true |
| `one_le_dynamicalDegree` | Cremona: 1; endpoints `λ₀ = 1`, `λ_d = e ≥ 1` with concavity | true |
| `dynamicalDegree_eq_of_polarizations` | `ℙ¹×ℙ¹` swap: both 1 | true |
| `dynamicalDegree_iterate` | `m = 0`: `λ_k(id) = 1 = λ^0`; `z²`, `m = 2`: `4 = 2²` | true |
| `dynamicalDegree_zero_and_top` | `d = 0`: both `1 = e`; Frobenius: `p^d` | true |
| `dynamicalDegree_log_concave` | Fibonacci map: `1·1 ≤ φ²`; range `1 ≤ k`, `k + 1 ≤ d` avoids `k − 1` junk | true |
| `dynamicalDegree_birational_conj` | Cremona conjugated by a linear map: 1 | true |
| `dynamicalDegree_baseChange` | `ℙ¹_ℝ`, `K' = ℂ`: conjugation satisfies `hf` but is not over `ℂ`, excluded by `[f'.IsOver]`; Frobenius over `𝔽_p(t)`: absolute Frobenius excluded the same way | `hf` with `IsOver` determines `f'` |
| `algebraicEntropy` | `d = 0`: `log λ₀ = 0` | fine |
| `algebraicEntropy_iterate` | `n = 0`: `log 1 = 0 = 0·h` | true |
| `algebraicEntropy_bounds` | `d = 0`: `0 ≤ 0 ≤ 0·log(junk) = 0`; `(x²,y)`: `log 2 ≤ log 2 ≤ 2 log 2` | true, also at `d = 0` |
| `algebraicEntropy_baseChange` | follows from `dynamicalDegree_baseChange` by `Finset.sup'_congr` | R02 |

**README targets.** Recomputed and found correct: the `E × E` matrix model (`2·det` is the square;
`A` has matrix `[[1,√2],[√2,2]]`, eigenvalues 0 and 3; the four-term decomposition of `A + F₁ + F₂`
coefficient by coefficient; `m = 3`, tolerance `1/90`, determinants `−0.0463`, `0.5897`, `5897`);
the ample approximation estimate `(β_j·C) ≥ 0`; the Siu telescoping `x_j ≤ (r−i+1)(y_j/y_{j+1})x_{j+1}`
with `dim Z_j = r−i+1`; the Hodge computation `(D''²) = (H'²)((H'²)(D'²) − (D'·H')²)`; the three
identifications on `W_{f₁,f₂}` in §4.4; the constant `C = (d−k+1)^{2k} max(c, c')` of §4.5 on both
worked examples (`9` and `25`, with `(ω'·τ^*ω') = 9`); subadditivity at `m = 0`
(`u_0 = k·log(d−k+1) ≥ 0`); the Fibonacci coordinate formula for `n = 1, 2, 3` and its failure at
`n = 0`; the Cremona chart overlap; the section of `aA − B` in §6.2; the normalization of
`x² + ty²` over `𝔽₂(t)`; the blow-up Euler characteristic `1 + (b − b²)/2`; every row of the
worked-examples table. Every definition has at least three Checks, none vacuous or a restatement.

**Suppliers resolved** (section exists; read for what is consumed, except SchemeAndStackFoundations
§§0.3, 0.7, 0.11, 0.20, 0.30, 3.3, 4.12, 4.16, 5.1–5.3 and StableReduction Layer 2, located by heading
only): CyclotomicClassGroupsAndStickelberger
§4.3 (definition, polynomiality, symmetry, additivity, projection formula, Cartier restriction, ample
positivity, field extension); AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.1, 1.5, 1.7 (ii),
(iii), (v) and the Checks of §§1.2, 1.4; AlgebraicModuliForArithmeticGeometry §1.4
(`amplePowersAndFixedTwists`), §5.4 (schematic image, flat base change, agreement with
`Scheme.Hom.image`), §9.10 (`nefMixedIntersectionBound`); ArakelovGeometryAndAbelianHeightsPartII §0.1
(geometric nefness) and §0.3 (1′), (2′) with `d ≥ 1`; LefschetzPencilsAndVanishingCycles §5.1
(Bertini irreducibility with `dim g(X) > s`); SchemeAndStackFoundations §§0.3, 0.7, 0.11, 0.20, 0.30,
2.6 (`proper_fibreDimension_vanishing`), 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1–5.3, 5.9
(`Chow.intersectionNumber`), 5.10 (`hodge_index` with only `H² > 0`); StableReduction Layer 2;
ArithmeticDynamics §§0.18, 0.26.

**Ownership.** Searched main and the open heads by object (graph of a rational map, topological
degree, dynamical degree, algebraic entropy, Khovanskii–Teissier, Siu): no other roadmap states them
over a general projective variety. `IsNef` on main is in another namespace and agrees on single
classes. No fully qualified name of `Suggested.lean` is declared by a roadmap that could be read.
Neither pinned library has a graph of a rational map, a degree of a rational map, or intersection
numbers of several line bundles.

**Policy.** The pull request changes only the package folder (README, Suggested.lean, metadata,
sources.toml, three reports). No pull-request number or process word in README or docstrings; no
`lemma`, `set_option`, `#eval`, `#check`; imports are `import Mathlib` and five `TauCeti.*` modules,
each used; no sorry'd data; no algorithm; every target has a locator.

**Copyright.** Wording compared on 22 passages (the 15 cited sources' statements at their locators,
and the routes of §§3.3, 3.5, 3.6, 4.4, 5.1, the correspondence paragraph of the scope section and the
Fibonacci item): none shares a run of words beyond formulas and standard names. The Fibonacci formula
and the Cremona forms coincide with silverman2014 line 365 and russakovskiishiffman1997 line 545 as
formulas only. Arrangement: the six layers do not map onto the sections of dangfavre2021 (1 positive
cycles and degrees, 2 b-classes, 3 b-divisors, 4 spectral interpretation, 5 spectral gap, 6 affine
maps) or of dang2020 (1 Chow groups, 2 numerical cycles, 3 positivity, 4 relative classes, 5 dynamics,
6–7 semi-conjugation and mixed degrees). No table, figure or exercise list is taken over.

Source independence: 22 passages compared with 13 sources, none shared; largest share dangfavre2021,
17 of 116 locators; contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- lazarsfeld2004 (Theorems 1.4.9, 1.6.1, 2.2.15, Corollaries 1.4.10, 1.6.3) and fulton1998 (Theorem
  1.4, Proposition 2.5): settled as uncertified, cited by locator; the texts were not read. dang2020
  line 842 cites the bigness criterion as Theorem 2.2.13 of the same book where the README has 2.2.15;
  which number is right could not be checked.
- The truth of the `Suggested.lean` statements under elaboration: no Lean command is given to this
  pass, so the comparison used the supplied elaborated signatures only.
- truong2020 Theorem 5.3: the README's description of its standing hypotheses (smooth projective,
  any algebraically closed field) was checked only against lines 1101–1106, not against the whole of
  its §5.
- Ownership against open pull requests whose files the brief does not list was not checked beyond
  what `roadmaps grep` reads.

## Source issues

- **Misprint** in silverman2014 at Example 6, printed page 9 (line 376): the source says the degree of the n-th iterate of the affine map is the n-th Fibonacci number; it should be the (n+2)-th, since the first three iterates have degrees 2, 3, 5; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a) (line 1180): the source says the log-concavity inequality holds for every index from 1 to k; it should be from 1 to k−1, since the degree of index k+1 is not defined; affects a stated result.
- **Misprint** in dang2020 at the proof of Theorem 3.4.4, printed page 18 (line 883): the source says the final constant is a power of n−i+1; it should be a power of r−i+1, as in the statement and in each step; affects nothing.
- **Misprint** in dang2020 at Theorem 5.2.1, printed page 25 (lines 1275–1279): the source says both maps of the bases are called g with index 2; it should be index 1 for the first map, as in the proof; affects nothing.

## For the human reviewers

- **Licence.** `cutkosky2015` and `kleiman2005` are cited from arXiv preprints (1304.1218v1, math/0504020v1) in `README.md:810–811`, without the published versions; the numbering was checked against the preprints only.
- **Not tested.** `lazarsfeld2004` and `fulton1998` are uncertified (`README.md:813–814`): wording and locators were not compared with their texts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6f5187e7eeb12825ee2824fa868cc8b1f54a5549", "job": "RT-DynamicalDegreesOfRationalMaps~1b", "model": "fable", "worker": "chris-x80"} -->
