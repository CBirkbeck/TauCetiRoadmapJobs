# Review of DerivedModuleAlgebra (pull request #1701 at 8dcba8a)

**Verdict:** accepted

This is an incremental re-review of the 62 lines that changed in the folder since db95654, which r25 read. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`. The pins are Mathlib 1b1ccf4 and Tau Ceti 2fd255d.

The diff has four parts:
- It repairs both r25 findings.
- It rewrites the opening paragraph of §0.2 and its *Needs:* line.
- It replaces the §0.2 law "filtered colimits, shifts and cones of K-flat complexes are K-flat", which Tau Ceti already proves, with Stacks Lemma 15.60.12 and a proof route. It also gives the totalization law a route.
- It widens the Tau Ceti supplier row, the scope sentence and the Layer 1 dependencies, and edits one Lean docstring.

This report has no findings. The gate passes.

## Previous findings

- R01 — repaired. README:798–801 now reads "The termwise tensor product with a fixed K-flat complex sends quasi-isomorphisms to quasi-isomorphisms ([StacksMA] Lemma 15.60.2, Tag 06Y0, p.144)" and gives Lemma 15.60.12 (Tag 064L, p.147) a separate clause. README:822 reads "Lemmas 15.60.2, 15.60.10 and 15.60.12". The Lean docstring at lines 127–136 cites "Lemmas 15.60.2, 15.60.10 and 15.60.12, Tags 06Y0, 06Y4 and 064L".
- R02 — repaired. README:2847–2848 reads "*Almost ring theory*, sixth release. arXiv:math/0201175v3, 22 July 2002; pages of that version. Published as Lecture Notes in Mathematics 1800 (2003)." The link at README:2878 is `https://arxiv.org/abs/math/0201175v3`.

Neither repair introduced a problem. The details follow below.

## Verified sound

### Gate, dependency check, build, signatures, padding

- **Gate.** My run at 8dcba8a exits 0:
  ```text
  gate DerivedModuleAlgebra: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  The worker's `gate.md` agrees and also records `build=0`.
- **Dependency check.** Full output:
  ```text
  depcheck: 239 roadmaps, 2335 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty, and the change set touches only README and Lean.
- **Elaboration.** `lake env lean` on Lean exits 0. Its only messages are 33 "declaration uses `sorry`" warnings.
- **Signatures.** I put Lean and a `#check @name` line for each of its 43 declarations into a single scratch file and elaborated it once: 0 errors.
  - The changed declaration `DerivedDeRham.hasLeftDerivedFunctor₂_tensor` still elaborates to `∀ (R : Type u_1) [CommRing R] [HasDerivedCategory (ModuleCat R)], (curriedTensor … ⋙ whiskeringRight.obj Q).HasLeftDerivedFunctor₂ (quasiIso …) (quasiIso …)`. That is the README §0.2 statement, at the same generality.
  - The worker's `signatures.md` lists an item "`,` (instance, line 108)" and a parse error at "line 691". Both are tool artifacts. Lean:108 is docstring prose ("instance, taken as a hypothesis"), and the file has only 689 lines.
- **Statements.** Only a docstring changed in Lean (`git diff db95654 HEAD`), so every statement is the one r25 elaborated and probed.
- **Padding.** r25's one-tactic probe failed on all 33 `sorry`s, and no statement has changed since.

### The changed passages against the pins

| Claim in the diff | Pinned declaration (file:line) | What it says at the pin | Result |
| --- | --- | --- | --- |
| `CochainComplex.IsKFlat` (README:123, 866) | `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean`:89 | `tensorObj K A` is acyclic for every acyclic `A`. The K-flat factor sits on the left. | Matches Stacks Def 15.60.1 up to the Koszul symmetry, as README:856 says |
| `CochainComplex.quasiIso_id_tensorHom`, "for a K-flat `K` and a quasi-isomorphism `f`, the map `K ⊗ f` is a quasi-isomorphism" (README:805–806) | same file :222 | instance `QuasiIso (tensorHom (𝟙 K) f)` under `[K.IsKFlat] [QuasiIso f]` | Exact |
| `CochainComplex.isKFlat_shift` | :117 | instance `(K⟦n⟧).IsKFlat` | Exact |
| `CochainComplex.isKFlat_mappingCone`, "the cone of a map between K-flat complexes" | :185 | needs `[K.IsKFlat] [L.IsKFlat]` | Exact |
| `CochainComplex.isKFlat_of_isColimit`, "filtered colimits" | :268, section variables :262–263 | needs exact colimits of shape `S` and `tensorRight X` preserving them. Mathlib `Mathlib/Algebra/Category/ModuleCat/AB.lean`:30 gives `AB5 (ModuleCat.{u} R)`. | Holds for small filtered shapes |
| `CochainComplex.isKFlat_of_boundedAbove_flat`, "a bounded-above complex of flat modules" | :361 | `[K.IsStrictlyLE b]` and termwise `PreservesFiniteLimits (tensorLeft (K.X i))`, which is flatness by Mathlib `Module.Flat.iff_preservesFiniteLimits_tensorLeft` | Exact |
| `TauCeti.koszulSymmetricCategory`, "for commutative `R`" (README:123) | `TauCeti/Algebra/Homology/Monoidal/Braiding.lean`:411, variables :87 `(R : Type v) [CommRing R]` | `SymmetricCategory (CochainComplex (ModuleCat.{v} R) ℤ)` with Koszul sign `(−1)^(pq)` | Exact. The universe matches the headline's `ModuleCat.{u} R` with `R : Type u` |
| K-flat resolution used in the 15.60.12 route | `TauCeti/Algebra/Homology/ModuleCat/KFlat.lean`:39 | `∃ P π, QuasiIso π ∧ P.IsKFlat` for `[CommRing R]` | Exact |
| "Tau Ceti formalises all of these except Lemma 15.60.12" (README:803) | grep of the Tau Ceti pin for quasi-isomorphisms of `tensorHom`; grep of the Mathlib pin for `KFlat` | Tau Ceti has only `quasiIso_id_tensorHom` and `isKFlat_iff_quasiIso_id_tensorHom` in `KFlat/Basic.lean`, plus an unrelated cubical Künneth instance. Mathlib has no K-flat file. | True. Lemma 15.60.12 is correctly kept as a law here, and the dropped closure law was a Tau Ceti duplicate |

Three other changed passages agree with this table:
- the scope sentence at README:18–19;
- the supplier row at README:123, which names Lemmas 15.60.2, 15.60.5, 15.60.7 and 15.60.8;
- the Layer 1 dependencies at README:1260–1264.

The *Needs:* line at README:866 lists each new Tau Ceti input that §0.2 uses. The new law depends on the Koszul symmetry and the resolution, and both are listed.

**The 15.60.12 route (README:879–885).** In the square with top row `K⊗P → K⊗Q` and bottom row `L⊗P → L⊗Q`:
- the top map is `tensorHom (𝟙 K) α`;
- the vertical maps `π ⊗ 𝟙` become `tensorHom (𝟙 P) π` and `tensorHom (𝟙 Q) π` after conjugating by the braiding, which is natural;
- the bottom map then follows by two-out-of-three, Mathlib `Mathlib/Algebra/Homology/QuasiIso.lean`:181 `quasiIso_iff_comp_left`.

This is the route of StacksMA lines 6829–6837 in the README's own words.

**The totalization route (README:886–889).** The union of the first `n` columns is a degreewise split subcomplex of the union of the first `n+1`, with quotient the shifted new column, so it is a mapping cone up to isomorphism (`isKFlat_of_iso`, :99). The direct-sum totalization is the ℕ-indexed union, so the three cited declarations give the law.

### Seeded source sample

Only target 0.2 of the sample lies in the changed passages. The GR entry change also affects the GR locators of 0.6 and 0.25, so I re-checked those.

| Target | Locators checked (source line, page) | Result |
| --- | --- | --- |
| 0.2 | StacksMA 6709 (Def 15.60.1, 06XZ, p.144); 6711–6713 (Lemma 15.60.2, 06Y0, p.144: `L ↦ Tot(L⊗K)` preserves quasi-isomorphisms for K-flat `K`); 6725 (15.60.5, 06Y2, p.144: two out of three in triangles of `K(R)`, which gives shifts and cones); 6741 (15.60.7, 064K, p.145: bounded above flat); 6753–6755 (15.60.8, 06Y3, p.145: filtered colimits); 6781–6783 (15.60.10, 06Y4, p.146); 6824–6828 (15.60.12, 064L, p.147: `Tot(L⊗P) → Tot(L⊗Q)` for a quasi-isomorphism of K-flat complexes); 6846 (15.60.13, 064M). Page markers at 6685, 6727, 6771, 6818. | All locators, pages and hypotheses match README:796–802 and 879–881. "pp.144–146" covers 06XZ, 064K and 06Y4 |
| 0.6, 0.25, 0.5, 0.9 (the GR locators, against arXiv v3) | GR 1454 (2.5.4, p.30), 1480 (2.5.7, p.30), 1672 (Thm 2.5.30, p.34), 1946 (Lemma 3.2.1, p.41), 1949 ((3.2.2), p.41), 1685 (Thm 2.5.32, p.35), 1986 ((3.2.7), p.41), 2010 ((3.2.10), p.42), 2016 (Cor 3.2.11, p.42), 10619–10620 (Prop 8.1.7, pp.219–220). GR line 5: "arXiv:math/0201175v3 … 22 Jul 2002", line 8: "sixth (and final) release". | Every GR locator at README:1385, 1450, 1515 and 1825 resolves on the stated page of the version the entry names |

The other sample targets are untouched by the diff and were passed by r25. These are 0.3, 0.4, 0.8, 0.10, 0.12, 0.14, 0.16, 1.2, 1.3, 1.4, 1.5 and 1.7. In r25's table: 0.8, 0.10, 0.12, 0.14, 1.4, 1.5 and 1.7 have rows with locators; 0.3, 0.4, 0.16, 1.2 and 1.3 have adversarial rows. This incremental round does not re-read them. The README flags no locator as unverified.

### Adversarial pass

The first five rows are new, one for each changed statement. The rest are carried forward unchanged from r25's report (marked "(r25)"); r25's row for `hasLeftDerivedFunctor₂_tensor` is superseded by row 4.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1. §0.2 opening, Lemma 15.60.2 clause (README:798–799) | `R=ℤ`, K-flat `K=[ℤ --p→ ℤ]` in degrees −1, 0; quasi-isomorphism `K → F_p[0]` in the free variable | `Tot(K⊗K)`: `ℤ → ℤ² → ℤ`, `d(x)=(px,−px)`, `d(u,v)=pu+pv`, so `H⁻²=0`, `H⁻¹=ℤ/p`, `H⁰=ℤ/p`. `Tot(F_p⊗K)=[F_p --0→ F_p]`: `H⁻¹=H⁰=F_p`. The map is an isomorphism on `H`. | True | none |
| 2. Lemma 15.60.12 law (README:879–885) | `P=[ℤ --p→ ℤ] ↪ Q=P⊕[ℤ --1→ ℤ]`, `L=F_p[0]`. Negative: `P → F_p[0]`. Negative: `0 → C` with `C=(⋯ ℤ/4 --2→ ℤ/4 ⋯)`, `L=F₂[0]` | `L⊗P=[F_p --0→ F_p]`, `L⊗Q=[F_p² --diag(0,1)→ F_p²]`: both `H⁻¹=H⁰=F_p`, and the map is an isomorphism. `F_p⊗F_p[0]` has `H⁻¹=0` against `F_p`, so this map is not a quasi-isomorphism; excluded because `F_p[0]` is not K-flat. `0` against `H^i=F₂` for all `i`; excluded because `C` is not K-flat, which agrees with the §0.2 ℤ/4 Check (README:913–916). | True; both K-flat hypotheses are needed | none |
| 2a. Koszul sign used by the route | `K=P=[ℤ --p→ ℤ]`, summand `(−1,−1)` of `Tot(K⊗P)` | With sign `(−1)^(pq)`: `β(d(x⊗y)) = y⊗px − py⊗x = d(−y⊗x) = d(β(x⊗y))`. Unsigned swap gives `d∘β = −β∘d` on this summand, so it is not a chain map. | Convention pinned | none |
| 3. Totalization law (README:886–889) | one column `K`; two columns `φ: K₋₁ → K₀`; one column `C` (the ℤ/4 complex) | `Tot=K`. `Totᵏ = K₋₁^(k+1) ⊕ K₀^k = (mappingCone φ)^k`. `C⊗F₂` has `F₂` in every degree while `C` is acyclic, so `C` is termwise free but not K-flat. | True; column K-flatness, not termwise flatness, is the hypothesis | none |
| 4. `hasLeftDerivedFunctor₂_tensor` docstring (Lean:127–136) | `F_p ⊗^L F_p`; two K-flat models `K`, `K′=K⊕[ℤ --1→ ℤ]` of `F_p` | `H⁰=H⁻¹=F_p` against termwise `F_p[0]` (`H⁻¹=0`). `Tot(K⊗F_p)` and `Tot(K′⊗F_p)` both have `H⁻¹=H⁰=F_p`, which is model independence (15.60.12). The free variable is handled by 15.60.2. | True | none |
| 5. GR entry (README:2847–2848, 2878) | the 10 GR locators | Each resolves on its stated page of v3 (table above). PDF page equals printed page, for example GR line 1941 "ALMOST RING THEORY 41". | True | none |
| 0.1 Check (r25) | constant `A[t]` → `A[t]/(t²)` | Alternating face complex `A[t][0]` against `B = A[t]/t²`, so `H₀` differs and it is not a resolution | True | none |
| `hasLeftDerivedFunctor_extendScalars`, `nonempty_derivedExtendRestrictScalarsAdj` (r25) | `ℤ→F_p`, `Y=F_p[1]`; reversed adjunction | `Hom(F_p[0]⊕F_p[1], F_p[1]) = 0⊕F_p` against `Ext¹_ℤ(F_p,F_p)=F_p`. Reversed: `Hom_ℤ(F_p,ℤ)=0` against `F_p` | True | none |
| `nonempty_bicomplexSecondPageIso` (r25) | Tau Ceti `Bicomplex.lean`:446; single column; single row | Page-2 `d` has degree `(2,−1)`, the classical `d¹`. Page 3 has `(3,−2)`, the classical `d²`. Single column: `H_k(K.X 0)` at `(−k,0)` | True | none |
| S.1 sign Checks (r25) | gens `a,b,c,e` at `(0,1),(1,0),(1,1),(2,0)` | Total matrix `[[1,1],[0,1]]`, determinant 1, so `H(Tot)=0`. `D(a−b)=−e` gives `d₂[a]=[−e]` and `E₃=0` | True | none |
| `simplicialTensorComparison` (r25) | `a∈X₁`, `b∈Y₁` | `∂∇(a⊗b) = ∇(∂a⊗b − a⊗∂b)`. With the opposite sign, `∂∇ ≠ ∇∂` | True | none |
| `bisimplicialDiagonalComparison` (r25) | constant `P` | Both sides `P` in degree 0, zero above | True | none |
| `quasiIso_whiskering_of_projective` (r25) | `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `F(V)=V⊗V` | `H₁ = Tor₁(ℤ/2,ℤ/2) = ℤ/2` against `0`; excluded because the target is not projective | True | none |
| `exteriorPower_decalage` (r25) | `N=R`, `n=2`; `N=0`; `N=ℤ/2` over `ℤ` | `R` in degree 2 `= Γ²R`. `0=Γⁿ0`. `F₂` against `Γ²_ℤ(ℤ/2)=ℤ/4`, excluded by flatness | True | none |
| `symmetricPower_decalage` (r25) | `N=R`, `n=2`, bar model | `N₂ = ℤ(e₁e₂−e₂²)`, `d₀ ↦ −e²`, so it is acyclic `= ∧²R = 0` | True | none |
| 0.5 Checks (r25) | `ℤ/4→ℤ/2`; `ℤ/9→F₃`; Baer sum; `ℚ[X]⊕εℚ[X]` | Classes nonzero. `2·[ℤ/4] = 0`. `a+εb ↦ a+ε(b+a′)` | True | none |
| 0.6 Checks (r25) | `ℤ→ℤ/p`, `M=F_p`; `ℤ/9→F₃` | `Hom(F_p[1],F_p)=0`, `Exal = F_p`. Conormal `3 ↦ 1`, order 3 | True | none |
| 0.7 Check (r25) | `k[x,y]/(x,y)²` | `H⁻²(L)=k·y r₁ = k` | True | none |
| 0.8, 0.10 Checks (r25) | `ℤ→ℤ→ℤ/3`; `ℤ→F_p`, `A′=F_p` | Isomorphism on `H⁻¹=ℤ/3`. `L_(F_p/F_p)=0` against `F_p[1]` | True | none |
| 0.4/0.12/0.13 Checks (r25) | `k[ε]/ε²`, char ≠ 2 and char 2 | `x² ↦ 2ε dε`, kernel `εk ≠ 0`. In char 2, `H⁻¹=H⁰=B` | True | none |
| 0.14–0.16 Checks (r25) | `Be`; `F₂`; `F_p` | `L∧²(Be)=0`. `e·e=2γ₂(e)=0`. `e^p = p!γ_p = 0`, `γ_p ≠ 0` | True | none |
| 0.25 Checks (r25) | `F₂[ε]/ε²` over `ℤ/4`; `k[x]/(x³)→k[x]/(x²)→k` | not flat. The connecting map surjects onto `k` | True | none |
| `derivedLimit_isTriangulated`, §1.1 Checks (r25) | tails `⊕_(m≥n)k`; `ℤ` with ×p; ×3 square | `⊕k→∏k` is not onto. `lim¹A = ∏k/⊕k`. `Σ3^(2m) = −1/8 ∉ ℤ` | True | none |
| §1.1 cofinal Check (r25) | drop `r` levels of ×p | inverse of `p^r` on `ℤ_p/ℤ` | True | none |
| `nonempty_derivedTensorHomAdj` (r25) | `A=ℤ`, `K=L=F_p`, `M=ℤ[2]`; `L=ℤ[1/p]` | Both sides `F_p`; underived `0`. `Ext¹(ℤ[1/p],ℤ) = ℤ_p/ℤ` | True | none |
| `derivedCompleteness` family (r25) | `I=0`; `I=ℤ`; `(2,3)⊂ℤ`; `(p)` against `(p²)`; `ℚ_p` | All complete at `I=0`. `M=0` at `I=ℤ`. `ℤ_2` fails at 3. `ℚ_p` fails at `p` and `p²` | True | none |
| `derivedCompleteness_isRightAdjoint` (r25) | `I=0`, `I=A`; `·2` on `ℤ[0]` | identity, respectively zero; `End(ℤ[0])=ℤ` | True | none |
| `completeNakayama` (r25) | `[ℤ --p→ ℤ]`; `ℤ[1/p]`; `m⊂O_(ℂ_p)` | `P⊗F_p ≠ 0`. Excluded by `hc`. `m/m²=0`, excluded by `hI` | True | none |
| `ordinaryQuotientCompletion*` (r25) | `f=0`; `f=1`; `[p,1]`; `[0]`; `ℤ_p⋉ℚ_p/ℤ_p` | `Rlim=Λ₀`. `Λ_A=0`. `0`. not weakly regular. `T[pⁿ]` grows | True | none |
| `nonempty_ordinaryQuotientCompletionHomologyIso` (r25) | `F_p` via `[ℤ --p→ ℤ]`; `ℚ_p/ℤ_p` | `H⁻¹=0`, `H⁰=F_p`. Without finiteness, `ℤ_p` against `0` | True | none |
| §1.5 `R⋉T` Checks (r25) | `A=ℤ_p⋉ℚ_p/ℤ_p` | Koszul `H⁻¹=T[pⁿ]`; `Hom(C,R[1]) = 0`, so the triangle is nonsplit | True | none |
| `cohomologicalAmplitude_of_completeTorAmplitude` (r25) | `∏ℤ/pⁿ`; `ℤ[1/p][−1]`; `R⋉T` | `[0,0]`. Excluded by `hc`. Excluded by `hA` | True | none |
| `isAdicComplete_of_isCompletelyFlatModule`, converse (r25) | `A=ℤ/4`, `M=ℤ/4`, `ℤ/2` | `ℤ/2 ≅ 2ℤ/4`. `M=ℤ/2`: `Tor₁=ℤ/2` | True | none |
| `IsPerfect` family, `isPerfect_baseChange` (r25) | `⊕_ℕℤ`; `eA⊂k×k`; `[ℤ --2→ ℤ]`; `ℤ/2` over `ℤ/4` | `H⁰` not f.g. Ranks `(1,0)`. `[F₂ --0→ F₂]`. Excluded by `hK` | True | none |
| `ringTowerLimit_jacobson` (r25) | `k[t]/tⁿ⁺¹`; shifted | `1+t ↦ 1` is a unit. `A₀=0` is excluded | True | none |
| `pseudoCoherent_residueCriterion` (r25) | `[k[[t]] --t→ k[[t]]]` | Fibre `[k --0→ k]`; `[0,0]` fails at `i=−1` | True | none |
| `Matlis.biduality_of_finite/artinian` (r25) | `ℤ_p`, `E=ℚ_p/ℤ_p`; `ℤ_(p)` | `D(E)=ℤ_p`. `End E = ℤ_p ≠ ℤ_(p)`, excluded | True | none |
| §1.E.1 Checks (r25) | `[A_n --t→ A_n]`; `k[x_i]/(x_i²)` | `H⁻¹(M_n)=(tⁿ)` with zero transitions. `x₁⋯x_r ≠ 0` | True | none |

### Duplication, ownership, overlaps

- **The new law.** The changed passages state one new law, Stacks 15.60.12. Neither pin has it (table above). `roadmaps grep '064L|15\.60\.12'` over main and the 468 open heads finds two kinds of hit:
  - consumers of DerivedModuleAlgebra §0.2 that cite 064L as a locator: EnhancedDerivedSheaves on main (README:906, consuming §0.2 by its README:29, 152 and 451–453) and at its open heads (#1330, #1630);
  - ArithmeticGaloisDuality (#858, README:4718), again only as a locator.

  None is a second owner.
- **Overlaps.** `overlaps.md` is the same as in r25:
  - no other open pull request changes this roadmap, and no cited id is dropped elsewhere;
  - the dropped §1.T.1 and its anchor stay mapped at README:38–41.
- **Citations.** The diff adds no cross-roadmap citation. Every backticked name it adds is a Tau Ceti declaration, opened above.
- **Form.** The diff adds no process words, LaTeX or `lemma`.

### Remark on untouched text

README:886–887 says "columns sit in nonpositive simplicial degrees". Simplicial degrees are nonnegative, so this means nonpositive horizontal (cohomological) degrees. The meaning is clear, and this round asks for no change.

## Not verifiable

- **IllusieCC** is recorded as uncertified in the manifest, which settles it. The diff does not touch it.
- **LNM 1800 pagination.** The published volume is paywalled. The README now cites arXiv v3 pages only, so its numbering is not needed.

## Source issues

- none
