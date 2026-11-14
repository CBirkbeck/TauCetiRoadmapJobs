<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6882588947 -->
Review (claude) of a528360

Verdict: accepted
Conditional on the announced gaps: `homological-low-degree`, `flat-kunneth`

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The acceptance is conditional on the two declared supplier gaps,
`gap:homological-low-degree` (DerivedModuleAlgebra §S.1) and `gap:flat-kunneth`
(SpectralSequencesAndConvergencePartII §4.3). No package file was edited; `sources.toml` is unchanged
(no new source was needed, and no `needs-references.toml` was written).

## Verified sound

### The previous finding (round 6, one finding)

| Previous finding | Repaired passage | Status |
|---|---|---|
| F01 (P2): InductionRestrictionPartII RS.6.8 already owns `Λ²A ≅ H₂(A, ℤ)` for every abelian group | `packages/CohomologyOfGroups/README.md` Scope: “for every abelian group `A : Type`, finite or not, the isomorphism `Λ²A ≅ H₂(A, ℤ)` … 5.4 consumes the exterior-square isomorphism and does not prove it”; §5.4: “is InductionRestrictionPartII RS.6.8's and is not proved here”. `Suggested.lean` no longer declares `nonempty_groupHomology_two_addEquiv_exteriorPower` (searched: no occurrence in either file). | Repaired |

Checked against the supplier at its open head: `TauCetiRoadmap/InductionRestrictionPartII/Suggested.lean:187`
states `abelian_multiplier_exteriorSquare (A : Type) [CommGroup A]` with no finiteness hypothesis and
the formula `a ∧ b ↦` class of `single (a, b) 1 − single (b, a) 1`; its README heading is
“6.8 The anti-diagonal model for abelian base groups (RS.6.8)” (line 1570), and “0.3 Hall
coinvariants of the multiplier (RS.0.3)” (line 424), “0.1 … (RS.0.1)” (line 326) resolve too.

The repaired pattern (a supplier described more narrowly than it is, and the difference planned
again) was searched in every supplier contract: K3BlochGroups §5.2 (its `finiteGroup_stableElements`
is for `ℤ_(r)` only; 7.2 is for every `M`), ArithmeticGaloisDuality §D7.2 (finite `G`, `k = ℤ`; its
text at README line 5015 read), MappingClassGroupsAndCanonicalRepresentations §1.1 (line 848),
IntegralIwasawaTheoryPartII §0.7 (line 272), SchemeKTheoryOperations §6.7 (integral hyperhomology,
line 2549; directed unions for any `k`, line 2583), K2SymbolsBrauer §1.1 (line 108),
ModularCurvesPartII §15.4 (line 3936). None is described more narrowly than it reads at its head.

The changed passages (Scope, RS.6.8 contract, §5.4 route, API and two Checks, §7.2 Check, Layer 5
and 7 Dependencies) are in the table below (rows “5.4”, “7.2 normal Sylow”).

### Principles, shape, elaboration

- All 41 numbered targets, the eight `### Dependencies` blocks, Conventions, contracts and the 20
  Lean declarations (7 definitions, 13 theorems) were read in full. No route-specific shortcut, no
  algorithm, no sorry'd data, no `set_option`, no `lemma`, no placeholder predicate.
- `lake env lean` on `packages/CohomologyOfGroups/Suggested.lean`, run from the content checkout:
  exit 0; the only diagnostics are 13 `declaration uses sorry` warnings (lines 112, 120, 136, 165,
  193, 217, 257, 316, 330, 350, 366, 380, 400). All seven `TauCeti.*` imports were available.
- One-tactic probe on **all 13** sorried theorems, on scratch copies with `sorry` replaced by
  `by simp`, `by rfl`, `by infer_instance`: 13 errors in each run (simp: 9 “unsolved goals”, 4 “made
  no progress”); none closes. Candidate one-lemma closers were opened at the pin:
  `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup` (`…/TateCohomology/Cup/TateTheorem.lean:209`,
  source `Ĥʳ(G, ℤ)` only), `cup_bijective_of_forall_isPGroup_of_lTensor_injective`
  (`…/Cup/TateNakayama.lean:360`, needs `H¹`-vanishing, generation and cardinality on every
  `p`-subgroup, which are the content of 8.4) and
  `cup_characterConnectingClass_eq_groupCohomologyπEven` (`…/Cup/Cyclic.lean:146`, degree 0 only);
  `TauCeti.isZero_groupHomology_freeGroup` (`AlgebraicTopology/ClassifyingSpace/WedgeCircles.lean:259`,
  trivial coefficients, `S k : Type`, homology only); `TauCeti.ContinuousCohomology.corestriction_mackey`
  (`…/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279`, continuous cohomology, profinite `G`).
  None states a headline. No padding.
- Signature check: the 20 elaborated types of `scratch/signatures.md` were compared with the README
  statements: `[R.Normal]` (Hopf), `[H.FiniteIndex]` (both double coset formulas and both summands),
  `[Finite G]`, `[Fact p.Prime]`, `n ≠ 0` (ordinary stable elements), `[Fintype G]`, `n : ℤ` (Tate),
  `[Module.Free ℤ M]` (integral duality), `hg`, `hχ` (cyclic periodicity) are all present. No binder
  lost; nothing changed.
- README ↔ Lean: each of the 20 Lean names occurs backticked in the README, and no other backticked
  name is presented as this roadmap's own.
- Process residue: searched the README and the Lean file for pull-request numbers, round or job
  labels, dates, machine paths, HTML anchors, LaTeX delimiters, “optional/deferred/removed”: none.
  Header: `module`, `import Mathlib`, then seven individual `TauCeti.*` modules, as the roadmaps on
  main (for example `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`) begin.

Remarks that need no change: the `*Needs:*` line of 8.5 lists 8.3, which its route does not call
(same layer, earlier section, so nobody is blocked); the 3.2 reflection Check says the vertex
classes survive “in odd degrees `q ≥ 3`”, and they also survive at `q = 1` (true as written).

### Headline theorems

| Headline (README Summary and layers) | In `Suggested.lean`, or named in its docstring |
|---|---|
| Free groups, free products (3.6) | `freeGroup_isZero_of_two_le`, `coprod_groupHomology_bijective` |
| Hopf's formula (6.8) | `nonempty_groupHomology_two_addEquiv_hopf` (the classical statement, Loh19 Thm. 1.5.1, is an isomorphism) |
| Double coset formula (7.1) | `res_comp_corestriction_eq_finsum`, `transfer_comp_cores_eq_finsum` |
| Stable element theorem (7.2) | `bijOn_res_sylow_isStableClass`, `bijOn_cores_sylow_isHomologyStableClass`, `bijOn_tateRes_sylow_isTateStableClass` |
| Tate duality (8.1) | `tate_duality`, `tate_duality_of_free` |
| Cyclic cup periodicity (8.4), periodicity theorem (8.5) | `cup_characterConnectingClass_bijective`, `tfae_periodic_cohomology`, `tfae_primary_periodic_cohomology` |
| Hochschild–Serre (6.2–6.7) | docstring: quotient action in positive degrees and the extension filtration are missing |
| Tree sequence, amalgams, HNN (3.5–3.6) | docstring: `G`-tree carrier and connecting maps |
| Künneth, universal coefficients (5.1–5.3) | docstring: the cross product is not at the pins (`SSet.shuffle` is on simplicial chains only: `AlgebraicTopology/SimplicialSet/Shuffle.lean:689`), nor the cup product of 4.1 |
| Periodicity from a resolution (8.3) | docstring: the iterated connecting class |

The Künneth theorem of 5.1 is an exact sequence whose first map is the cross product; an
existence-only isomorphism over a field would be a weakened substitute, so its absence is correct.

### Seeded source sample

| Target | Locator, read at | Result |
|---|---|---|
| 1.1 | HS53 line 154–160 (corollary to Prop. 2, printed p. 113); used at HS53 line 345–354; Loh19 line 5322–5334 (Prop. 3.2.13, PDF 132 = p. 124) | Supported. Löh's pairs are `(x ↦ gxg⁻¹, x ↦ gx)` in homology and `(x ↦ g⁻¹xg, x ↦ gx)` in cohomology: the README's convention. |
| 2.2 | CE56 Ch. XVII | Not readable (uncertified). |
| 3.1 | Brown82 Ch. VII | Not readable (uncertified). |
| 3.6 | SerreArbres line 5190–5196 (example after Prop. 13, printed p. 169); Prop. 13 at line 5170; signs at line 5178–5184 | Supported: amalgam sequences in both variances, with arbitrary `M`; induced at `t(y)`, opposite at `o(y)`. Brown82 II §7 not readable. |
| 4.3 | MilneCFT line 3485–3496 (Prop. 1.39(a), (b), (c), (e); PDF 82–83 = pp. 73–74) | Supported; the sign `(−1)^{rs}` is as stated. |
| 4.5 | MilneCFT line 3492 (Prop. 1.39(d), p. 74) | Supported. |
| 5.1 | Loh19 line 5854–5866 (Thm. 3.2.22, p. 135: PID, `P` flat, split not naturally), line 5877–5900 (Cor. 3.2.23 and proof, p. 136) | Supported for a PID; the README says so and attributes the wider generality to its route. Brown82 V not readable. |
| 5.3 | Loh19 line 5985–5994 (Outlook 3.2.26, p. 138); HS53 line 368–379 | Supported: the source only mentions the statement, as the README says. |
| 6.1 | HS53 line 368–385 (normalized cochains, `A_j`, p. 118), line 401–411 (`A*_j`, Prop. 1, p. 119) | Supported, including “`n − j + 1` of the arguments”. |
| 6.4 | HS53 line 702–719 (Ch. III §1, p. 126) | Supported: restriction and inflation edge maps. |
| 6.5 | HS53 line 397–400; line 686–700 (Thm. 3 and remark, p. 126); line 654–657 (Thm. 2) | Supported. HS write `E^{j,i}` with `j` the base degree; their sign `(−1)^{i′j}` is the README's `(−1)^{pq′}`, and `d₁ = (−1)^i d` is `(−1)^q d`. |
| 6.6 | HS53 line 792–799 (Prop. 1, pp. 128–129); line 984–990 (Thm. 4, p. 133), proof line 1003–1011 | Supported: `d₂u = −c ∪ u`, with `a′ ∪ f = f(a)`. |
| 6.8 | Loh19 line 1460–1468 (Thm. 1.5.1, PDF 38 = p. 30); line 5568 (Thm. 3.2.18, p. 129) | Supported; no map is fixed there, as the README says. |
| 7.1 | Brown82 III §§8–9 | Not readable (uncertified). |
| 8.2 | Loh19 line 2399–2419 (Cor. 1.6.18, 1.6.19, PDF 61 = p. 53, both for odd `p`); line 2437 (Outlook 1.6.20, p. 54) | Supported for odd `p`; `p = 2` rests on Brown82 IV §4, not readable. |

Also read: HS53 line 825–830 and 854–856 (6.7), line 355–362 (homological transcription);
MilneCFT line 3357–3389 (7.2), line 3459–3470 (4.2), line 3793–3796 (8.4); Hutchinson13 line
482–504 (7.2, 8.4); SerreArbres line 5127–5165 (3.4); Loh19 line 7012 (Thm. 4.3.7, PDF 173 =
p. 165). The author flagged no locator as unverified. All eight cited works are in the manifest.

### Adversarial table

`C_m` is the cyclic group of order `m`. Values are computed here, not taken from the build.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 `conjRes`, `conjCores` | `S₃`, `A = ⟨(12)⟩`, `β` = inclusion of `⟨(23)⟩`, `g = (13), (123), (132)` | `g⁻¹(23)g = (12), (12), (13)`: defined, defined, undefined. Wrong coefficient map `g⁻¹`: needs `g⁻²xg = xg⁻¹`; `gxg` fixes 1, `xg⁻¹` sends `1 ↦ 2`. Homology wrong map `g`: `g²x: 1 ↦ 3`, `xg²: 1 ↦ 2` | true; wrong models excluded |
| 1.1 non-injective `β` | `C₄ → C₂`, `𝔽₂`, degree 2, `f = ⌊a/2⌋` | `df` on all 16 pairs is 1 exactly on odd–odd pairs = pulled-back carry; so the map `H² → H²` is 0 | true |
| 2.2 | `G = 1`, `0 → ℤ[0] → (ℤ →id ℤ) → ℤ[1] → 0`; `S₃` complex of 2.1 | `δ: H₁ = ℤ → H₀ = ℤ` is an isomorphism, middle acyclic. `H₁(S₃, ℤ_sgn)`: from `0 = H₂(S₃) → H₁(sgn) → H₁(A₃) = C₃ → H₁(S₃) = C₂`, it is `C₃` | true |
| 3.1 | `k = ℤ/4`, `M = C₂`, `C = k ⊕ (C₂ → ℤ/4 → C₂)`; flat terms | `(1 ↦ 2) ⊗ C₂ = 0`, so `H₂ = C₂ ≠ 0`. With flat terms the cycles of the cone are flat by induction, so exactness survives | true; flatness needed |
| 3.5/3.6 trees | `ℤ` on the line; `C₄ ∗_{C₂} C₆`; `BS(1,2)`; `ℤ ∗ ℤ` with `M = ℤ`, generators `−1`; `C₂ ∗ C₃` | `m ↦ t⁻¹m − m`: `H₁ = M^ℤ`. Cokernel of `1 ↦ (−2, 3)`: order 12, cyclic (`(1,0)` has order 4 modulo `(2,1)`). `1 − 2 = −1`, `1 − 1 = 0`: `H₁ = ℤ`; sum model gives `C₃`. `ker(−2, −2) ≅ ℤ` against `0 ⊕ 0`, missing term `2ℤ`. `H₂ = 0`, `H₃ = C₂ ⊕ C₃` | true |
| `freeGroup_isZero_of_two_le` | `S = ∅`, one letter, `M` twisted | 0 in degrees `≥ 1`; `0 → M →(t−1) M`, nothing above degree 1 | true |
| `coprod_groupHomology_bijective` | `n = 1` (excluded), `n = 2` | at `n = 1` twisted coefficients give the extra `2ℤ` above; for `n ≥ 2`, `Hₙ(1, M) = H_{n−1}(1, M) = 0` | true; bound needed |
| 4.3 | `ℤ²`, `C₂` over `𝔽₂`, 4.2's twisted family | `(x ∪ y)(e₁, e₂) = 1`, `(e₂, e₁) = 0`; `−y ∪ x` gives `0, 1`; both pair to `+1` with `[e₁|e₂] − [e₂|e₁]`. `x²(g, g) = 1`. `(−1)^{pq}x ∪ y`: `δx ∪′ y = (−1)^q δ(x ∪′ y)`, fails the left rule | true |
| 4.5 | `H = 1 < C₃`, degree 0; `x = res z` | `cor(x · res y) = 3xy = cor(x) y`; `[G:H] zy` both sides | true |
| 4.6 finite index | degree 0, `x ∈ M^H`, `z = [n]` | both sides `Σ_{gH} [μ(gx ⊗ n)]` (`g = t⁻¹`, `t ∈ H\G`) | true |
| 5.1 | `C₂ × C₂` over `ℤ`, degrees 2, 3; `M = 𝔽₂`, `N = ℤ[1/3]`; `G = H = 1`, `M = N = C₂` | `C₂`; `C₂³`. Tensor terms `0 ⊕ 𝔽₂ ⊕ 𝔽₂`, Tor terms `𝔽₂ ⊕ 0`, total `𝔽₂³ = H₂(C₂², 𝔽₂)`. Underived: `H₁ = 0` against `Tor₁ = C₂` | true; one flat factor needed |
| 5.3 | `ℤ × ℤ` over `ℚ`; `ℤ^{(ℕ)}` | `(x × y)(e₁, e₂) − (x × y)(e₂, e₁) = 1 − 0`; Koszul sign gives `−1`. `(V ⊗ V)^* ⊋ V^* ⊗ V^*` for `dim V = ℵ₀` | true; finiteness needed |
| 5.4 (repaired) | `A = 1, C_m, C₂², C₃², ℤ², ℚ`; degree 3 | `Λ²` and `H₂`: `0, 0, C₂, C₃, ℤ, 0`. `d([e₁|e₂] − [e₂|e₁]) = 0`. `x² = Σ λᵢ²[aᵢ]² = 0` as `[a]² = [a|a] − [a|a]`. `Λ³C₂ = 0 ≠ H₃ = C₂` | true; no second owner left |
| 6.1 | `C₄ ⊃ C₂`, `n = 1`; `N = G`; `N ≠ G`, `M ≠ 0` | `A₁`: `f(2) = 0` (dim 2); `A*₁`: also `f(1) = f(3)` (dim 1). `A_j = 0` for `j > 0`. Cochain `m` at `(g, …, g)`, `g ∉ N`: in `A_j`, nonzero for every `j` | true |
| 6.2 indexing, convergence | `(p, q) ↦ (2p + q + 1, −p − 1)` | from the contract `s = −q′ − 1`, `t = p′ + 2q′ + 1`: `q′ = −p − 1`, `p′ = 2p + q + 1`, total `p + q`. `A_{p+r−1}` is 0 in degree `p + q + 1` iff `r ≥ q + 3`; `C̄/A_{p+2−r} = 0` iff `r ≥ p + 2` | true |
| 6.4 | `C₂ < C₄`, `𝔽₂`; `ℤ²`, `M = k[N]` | inflation `H¹` iso, restriction 0. Both sides `k, k, 0`; with `M = k`, `H₂(ℤ², k) = k → 0` | true |
| 6.5 | `ℤ × ℤ ⊃ 0 × ℤ` | `(ỹ ∪ x̃)(σ, γ) = y(σ)x(γ)`, in `A*₁`: `y ∪ x ↦ +x·y`, `(−1)^{0·0}`; then `x ∪ y ↦ −x·y`, `(−1)^{1·1}`; `(−1)^{qp′}` gives the opposite | true; agrees with HS53 Thm. 3 |
| 6.6 | `C₃ < C₉`, `𝔽₃`; `C₉ < C₂₇`; `C₄ < Q₈`, `𝔽₂` | `df(2, 1) = f(1) − f(3) + f(2) = −1`, carry `= +1`: `τ = −c ∪ u`. General: `df(s(x), s(y)) = −c(x, y)`. `2 ⊗ 1 = 0` in `ℤ/4 ⊗ 𝔽₂`: `d₂ = 0`, `dim H¹(Q₈, 𝔽₂) = 2` | true |
| 6.8 Hopf | `ℤ/n`, `ℤ²`, `R = ⊤`, `S = ∅`, `A₅` | `R ∩ [F, F] = 0`; `d([a|b] − [b|a]) = [ba] − [ab] ↦ ba(ab)⁻¹ = ⁅a, b⁆⁻¹`; `[F,F]/[F,F] = 0 = H₂(1)`; 0; `C₂`. `d(K₂) ↦ r₁r₂(r₁x′r₂x′⁻¹)⁻¹ ≡ ⁅r₂, x′⁆` | true |
| 7.1 both formulas | `H = K = C₂ < S₃`; `K = 1`; `H = G` | degree 0: `1 + 2 = 3 = [S₃ : C₂]`. Homology: `Hg⁻¹s = Hg⁻¹s′` iff `ss′⁻¹ ∈ K ∩ gHg⁻¹`, so the terms sum to `Σ_{Ht}[tm]`. One term, `cor` | true |
| 7.2 three theorems | `S₃`, `p = 3`, degrees 2, 4, 0, `M = ℤ, ℤ_sgn`; `C₂ × S₃`, `M = 𝔽₂³`; `p ∤ |G|`; `k = ℚ` | `−1` on `H²(A₃)`: 0; `+1` on `H⁴`: `C₃`. `H₁`: `z = −z` gives 0 = `H₁(S₃)(3)`. Tate degree 0: `{0, 2, 4} → ℤ/3` bijective; `ℤ_sgn`: 0 = 0. Stable dimension 2 of 3. `P = 1`: `0 ↔ 0`. All groups 0 | true; `n ≠ 0` needed (`H⁰(S₃, ℤ)(3) = 0`, stable `= ℤ`) |
| 7.2 homology route | stable `z`, any `g` | `c_{g⁻¹} tr^P_{P ∩ gPg⁻¹} z = tr^P_{P ∩ g⁻¹Pg} z`, `cor` of it `= [P : P ∩ g⁻¹Pg] z`, sum `= [G : P] z` | true |
| 7.2 normal Sylow (repaired) | `C₃² ⋊ C₂`, inversion | `⟨−a, −b⟩ = ⟨a, b⟩`: `+1` on `Λ² = C₃`; `H₂(G)(3) = C₃` | true |
| `tate_duality` | `C₂`, `M = ℤ`, `i = 0, 1`; `G = 1` | `0 = 0`; `C₂ = Hom(C₂, ℚ/ℤ)`. Target `Ĥ⁻¹(G, ℚ/ℤ) = (ℚ/ℤ)[|G|]`, and `Ĥ^{−1−i}(M)` is killed by `|G|`, so maps into it are all of `Hom(−, ℚ/ℤ)`. Everything 0 | true |
| `tate_duality_of_free` | `C₃`, `M = ℤ`, `i = 0, 1, 2`; `M = C₂` for `C₂`; `M = ℤ^{(ℕ)}` | `ab mod 3`, three maps ↔ `0, 1, 2`; `0, 0`; `C₃, C₃`. `Ĥ⁰(Hom(C₂, ℤ)) = 0` but a nonzero map `C₂ → C₂` exists. `∏C₂ = Hom(⊕C₂, C₂)` | true; freeness needed, finite rank not |
| `cup_characterConnectingClass_bijective` | `m = 1`, `C_m` | `orderOf 1 = 1`, `1/1 = 0` in `ℚ/ℤ`, both groups 0. `χ` generates `Hom(G, ℚ/ℤ)`, so `δχ` generates `Ĥ² = ℤ/m` | true |
| `tfae_periodic_cohomology` | `1`, `S₃`, `A₄`, `Q₈`, `SL₂(𝔽₉)` | all four hold (`card 1 = 1`); hold, `Ĥ⁴ = ℤ/6`; fail via `V₄`; hold, `QuaternionGroup (2^1)` of order 8, `Ĥ² = C₂²`, `Ĥ⁴ = ℤ/8`; fail, `9 ∣ 720` and `C₃²` | true |
| `tfae_primary_periodic_cohomology` | `A₄`, `p = 3, 2`; `C₂`, `p = 3`; `e_p` for `|G| = 6`, `p = 3` | hold (`Ĥ² = C₃`, `|A₄|₃ = 3`); fail. All hold with order `3⁰ = 1`. `e₃ = 4`: `4² ≡ 4`, `4 ≡ 1 (3)`, `4 ≡ 0 (2)`, and `e_p` generates the `|G|_p`-torsion of `ℤ/|G|`, so `v` with `u ∪ v = e_p` exists | true |
| 8.2 | `Q₈`, `D₈`, `C_p²`, `p = 21` on `C₇ ⋊ C₃` | cyclic abelian subgroups; `C₂² ≤ D₈`; itself; 6 elements of order 7, 14 of order 3, `(1,0)(0,1) = (1,1) ≠ (2,1)` | true; primality needed |
| 8.3 existence clause | bounded free complex, homology `ℤ`, `ℤ_χ` | `0 → ℤ_χ → F_n/B_n → F_{n−1} → ⋯`; `F_n/B_n` is an extension of `B_{n−1} ⊂ F_{n−1}` by `ℤ_χ`, so `ℤ`-free, and `B_n` has a finite free resolution | true |
| Zero module, zero ring | `M = 0`; `k = 0` | every group and map is 0; no denominator in `k` | true |

Library conventions opened for these rows: `MulAut.conj_apply : conj g h = g * h * g⁻¹`
(`Mathlib/Algebra/Group/End.lean:732`), so `H.comap (conj g⁻¹) = gHg⁻¹`;
`DoubleCoset.Quotient H K` is `H \ G / K` (`Mathlib/GroupTheory/DoubleCoset.lean:79`), so the Lean
index set is `K\G/H`; `HNNExtension`: `of (φ a) = t * of a * t⁻¹` (`Mathlib/GroupTheory/HNNExtension.lean:80`);
`QuaternionGroup.card = 4 * n` (`Mathlib/GroupTheory/SpecificGroups/Quaternion.lean:174`);
`TauCeti.TateCohomology.characterConnectingClass (G : Type) [Group G] [Fintype G]`
(`…/TateCohomology/Character.lean:65`).

### Library names at the pins

About 130 declaration names cited by the README (some 85 of Tau Ceti, 45 of Mathlib) were looked
up by declaration line at the pinned libraries; every one exists. The file was confirmed for those
listed here and in the rows above, not for each of the others. Those whose first match was a
homonym were opened in the cited namespace: `TauCeti.ChainComplex.cup`, `cap`
(`Algebra/Homology/Monoidal/Cup.lean:278`, `Cap.lean:271`), `TauCeti.FactorSet.cohomologyClass`
(`GroupTheory/GroupExtension/Cohomology.lean:120`), `TauCeti.groupCohomology.corestriction`
(`…/GroupCohomology/Corestriction.lean:136`), `TauCeti.groupHomology.transfer`
(`…/GroupHomology/Transfer/Basic.lean:79`), `SSet.shuffle`, `SSet.shuffle_naturality`,
`SSet.ιChainComplex_tensorHom_ιChainComplex_shuffle_f_zero`, `…_f_one_one`
(`AlgebraicTopology/SimplicialSet/Shuffle.lean:689, 753, 716, 731`), `SSet.eilenbergZilberHomotopyEquiv`
(`…/SimplicialSet/EilenbergZilber.lean:761`), `TauCeti.TateCohomology.cup_assoc`
(`…/Cup/Associativity.lean:214`), `cup_projection` (`…/Cup/Corestriction.lean:178`), `cup_res`
(`…/Cup/Restriction/AllDegrees.lean:141`), `mapIso` (`…/TateCohomology/Functoriality.lean:262`),
`δ_comp_res` (`…/Restriction/Delta.lean:248`), `TauCeti.groupCohomology.corestriction_trans`
(`…/GroupCohomology/Corestriction.lean:399`), `Rep.mackeyDecompositionNatIso`
(`…/Induction/Mackey/Decomposition.lean:425`), `groupHomology.exists_map_subtype_eq` and
`isZero_groupHomology_of_directed` (`…/GroupHomology/DirectedUnion.lean:113, 132`),
`groupHomology.inhomogeneousChains.d_single` (`Mathlib/…/GroupHomology/Basic.lean:132`),
`SSet.chainComplex` (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:67`). The three
“lacks” claims hold: Mathlib `…/ContCohomology/Basic.lean:38–39` lists the comparison with
`groupCohomology` as a TODO; the Tau Ceti `DirectedUnion` docstring (line 31) says the colimit is
not identified; no edge map or five-term sequence is declared under
`TauCeti/Algebra/Homology/SpectralSequence`.

### Duplication and ownership

No second copy: main has no `CohomologyOfGroups` folder, and the board index lists this package
only. `roadmaps grep` for the Lean names of this file found no other declaration of them. Searched
by object, in the open roadmaps and on main: Hopf's formula, stable elements, periodic cohomology
and quaternion Sylow subgroups, amalgam sequences, the Pontryagin ring, group hypercohomology. Every
other statement of these objects is a special case already cited in Scope and ownership, with one
exception recorded for the humans: LocalFiniteGroupTheory, L4 (open), states that a `p`-group of
`p`-rank one is cyclic or generalised quaternion, which is 8.2 in other words. That roadmap is not in
the merge order and is on this job's list of roadmaps never to cite, so 8.2 stays a target here.

Cross-roadmap citations resolved now, at main or at the open head: DerivedModuleAlgebra §S.1
(README line 955); ProfiniteCohomology §§3.1, 3.2, 5.5, 6.4, 10.1, 10.5, Layers 8 and 12;
ClassFieldTheory Layer 0, §0.1; FreeGroupsAndLimitGroups §§2.2, 4.1, 4.2, 4.5–4.8; AlgebraicTopology
§§4.1–4.3, 5.3, 5.4; StableHomotopyKTheory §3.29; SpectralSequencesAndConvergencePartII Layers 2, 3,
§§3.2–3.4, 4.2, 4.3, 5.2; K3BlochGroups §§4.1, 5.2 with `quaternionPeriodicHomology` and
`finiteGroup_period_fromSylow` (lines 1870–1871); and those listed above. `scratch/overlaps.md`
lists no dropped id, no revision-only id, no conflicting head and no second copy.

Overlap check: read SpectralSequencesAndConvergencePartII, K3BlochGroups, ArithmeticGaloisDuality, InductionRestrictionPartII, SpectralSequencesAndConvergence, ProfiniteCohomology, DerivedModuleAlgebra, InductionRestriction; generic spectral sequences, Künneth and filtered pairings are owned by the first, fifth and seventh; `ℤ_(r)` stable elements, the quaternion resolution and Swan periods by K3BlochGroups; finite integral universal coefficients by ArithmeticGaloisDuality; the exterior square and degree-two Künneth by InductionRestrictionPartII; continuous theory by ProfiniteCohomology; induction and Mackey decomposition by InductionRestriction and the pins; nothing is owned twice.

### Supplier order and gaps

```text
depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every `*Needs:*` line was read; each item is a section here, a
pinned declaration, a section of an earlier roadmap, or a declared gap.

- `gap:homological-low-degree`: same slug in `design/plan.json` and under “From
  TauCetiRoadmap.DerivedModuleAlgebra”. §S.1 on main (lines 1004–1017) lists the edge maps and the
  five-term sequence in cohomological indexing only. Precise and minimal.
- `gap:flat-kunneth`: same slug in both places. §4.3 at the open head states the spectral sequence
  natural from page 2 and the two-column sequence, not the naturality of that sequence. Precise
  and minimal.

### Copyright and arrangement

25 passages were set beside the sources at their locators (HS53 11, Loh19 5, MilneCFT 4,
Hutchinson13 3, SerreArbres 2), among them three Lean docstrings (`conjRes`, Hopf, cyclic
periodicity), the definition of the two filtrations, the tree complex and the stable-class
definitions. No run of shared prose; what coincides is formulas and standard names. HS53 has the
largest share. Its plan is Ch. I (general spectral sequence), Ch. II (direct method), Ch. III
(applications); only Layer 6 draws on it, and §6.1–6.7 take II §1, then I §7 with II §§2–4, III §1,
II §5, III §3, III §4 in an order the *Needs:* lines force (6.2 needs 6.1; 6.5 needs 6.2; 6.6 needs
6.5; 6.7 needs 6.6). Brown82's chapter titles (public) were also compared: Layers 2–3 use its
Ch. VII before Layer 5 uses Ch. V, and Layer 7 uses Ch. III after both. No table, figure or
exercise list is reused.

Source independence: 25 passages compared with 5 sources, none shared; largest share HS53, 42 of 115 locators; contents compared with HS53: independent. Brown82 (14 locators) and CE56 (3) could not be read: wording not tested against them.

## Not verifiable

- Brown82 (uncertified, text not available): its locators in the sample (3.1, 3.6, 5.1, 7.1, 8.2)
  and elsewhere (1.3, 3.2, 4.4, 4.6, 5.4, 7.2, 8.1, 8.3, 8.5). In particular, that additivity (1.3)
  is stated in Ch. III, and the `p = 2` case of 8.2 in Ch. IV §4, was not checked. The mathematics
  of these targets was tested independently (table).
- CE56 (uncertified): Ch. XVII for 2.2, Ch. XII for 8.1 and 8.5.
- SwanPPeriod60 (waived): read only through Hutchinson13 line 499–504.
- An `exact?` probe was not run (the earlier round found it times out); the candidate lemmas were
  compared by reading them at the pin instead.

## Source issues

- **Misprint** in Hutchinson13 at proof of Corollary 3.3, printed p. 12: the source says the degrees with nonzero `2`-local homology are those congruent to three modulo three; it should be three modulo four, as its own statement says; affects nothing.

## For the human reviewers

- **Not tested.** Brown82 and CE56 are cited by chapter and section without the text (`uncertified` in `packages/CohomologyOfGroups/sources.toml`); wording and arrangement were not compared with them.
- **Licence.** Loh19 and MilneCFT are course notes on their authors' pages (`author-page`, `open-repository` in the manifest); only locators are used.
- **Scope.** LocalFiniteGroupTheory, L4 (open, not in the merge order, on the never-cite list) also plans the classification of `p`-groups of `p`-rank one, the content of §8.2 here (`packages/CohomologyOfGroups/README.md`, §8.2). Which roadmap keeps it is a maintainer's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a528360e18dd3af043951b8b7a7579b3c43ef777", "job": "REV-PKG-CohomologyOfGroups~7", "model": "fable", "worker": "chris-x26"} -->
