# GATE-PotentialAutomorphyDworkMotivesPartII~2: answers to the review of `904d0f7`

One review comment was unanswered: CBirkbeck, 2026-11-15T14:41:37Z, findings F01–F09, numbered H01–H09 here. The quoted comment breaks off inside F09, after "Add the characteristic-two input to"; H09 answers the text that was received. Repairs are in commit `dbb37dc6` on the pull-request branch (not pushed). Line numbers are at that commit.

## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md` §0.9 (line 322) now states the symplectic case as (3): for `(m, q) ≠ (1, 3)`, `Sp_{2m}(k)` is perfect, its centre is `{±1}`, and `PSp_{2m}(k)` is simple. The old (3) on composition factors becomes (4) and covers `SL`, `SU` and `Sp`, and §§0.10 and 5.6 now cite §0.9(4). The simplicity of `PSU_n` and of `PSp_{2m}` (for `m ≥ 3`, and for `m = 2`, `q ≥ 5`) is imported from CFSGBasicProperties T1–T2, which has a new supplier contract (line 86), through the comparisons that exist at the Tau Ceti pin: `TauCeti.TypeALieIndex.specialUnitaryEquivFixedPoints` (BasicProperties/TwistedA.lean), `TauCeti.TypeCLieIndex.symplecticEquivFixedPoints`, `TauCeti.TypeB2LieIndex.projectiveSymplecticEquivGroup`, `TauCeti.DerivedCentralQuotient.congr` and `TauCeti.DerivedCentralQuotient.mulEquivQuotientCenter`. `PSp₄(𝔽₃)`, which the list omits as `B₂(3)`, is proved here by Iwasawa's criterion: the Iwasawa structure, centre, kernel and transitivity come from the pin, and primitivity, which is not at the pin, is proved here (point-stabiliser orbits of sizes `1, 12, 27` on the 40 points of `ℙ³(𝔽₃)`).

It is "applied differently" in three respects:
- The repair text credits F1 and T0 with the comparisons and with perfectness. CFSGBasicProperties requires a matrix comparison only "for every family whose simplicity proof uses a finite-field model" (its F0–F1 section), so the comparison is not part of that supplier's contract. It is, however, at the pin for `²A` (TwistedA.lean), which made the old Kept-variants sentence false; that sentence is now replaced (line 44).
- Perfectness and generation of `SU_n(ℓ)` are proved in §0.9(2), because neither the pin nor the supplier states them. The `TauCeti.ValidLieTypeIndex.unitaryTransvectionHom` file itself says generation is not proved there.
- For `m = 1` the import is Tau Ceti's `PSL₂` simplicity.

## H02 (CBirkbeck) — applied

A new paragraph "What ComplexComparisonPartII must provide (gap:griffiths-residue-hodge-filtration)" (line 106) states Griffiths' residue isomorphism: the Jacobian-ring piece of degree `(q + 1)d − m − 2` maps onto `gr_F^{m−q}H^m_prim`, intertwining `g*` with `P ↦ det(g)·(P ∘ g)`. It cites DMOS82 Proposition 7.6, proof, pp. 47–48 (DMOS82 lines 2176–2195). §2.1 (line 528) now uses this gap in its proof and its Needs line, and spells out how the grade `p = N − 1 − k` and the inversion under `(h⁻¹)*` follow from it. The `gaps` list of `design/plan.json` is outside the files this job may edit; the worker should add the same slug there.

## H03 (CBirkbeck) — applied

A new paragraph "What PadicDifferentialEquationsAndRigidCohomology must provide (gap:slopes-of-indecomposable-convergent-isocrystals)" (line 144) states DK17 Theorem 1.1.5 (DK17 lines 122–123). Following the round-2 shortening, it ends at the locator and leaves out the full-faithfulness clause. §7.12 (line 398 onwards) now names this requirement next to `gap:curve-crystalline-companions`. Supplier §§RD.3.34–RD.5.8 do not contain the theorem, and a search of main and of every open head for Drinfeld–Kedlaya or indecomposable slopes finds no owner. The `plan.json` gap entry is again left to the worker.

## H04 (CBirkbeck) — applied

`Suggested.lean` line 250: "`g(0) = 1` when `ψ` is nontrivial" → "when `R` is a domain and `ψ` is nontrivial". The same defect in the README's Mathlib contract (line 72, `gaussSum 1 ψ = −1`) is repaired the same way. §6.2 gains the `R = 𝔽₂[ε]/(ε²)`, `ψ(x) = (1 + ε)^x` Check, which gives `g(0) = 1 + ε` (line 1127). The definition stays general and `zeroShaped_gauss_product` keeps `[IsDomain R]`.

## H05 (CBirkbeck) — applied

`Suggested.lean` gains a Layer 0 section with two statements (lines 79 and 112), named in README §0.11 (line 355) and in the module docstring:
- `exists_conj_classical_of_transvection_generated`: Zalesskii–Serezhkin for `n > 2`, odd `p`, with the alternatives `SL_n(k)`, `Sp` of an alternating form over `k`, and `SU` of a Hermitian form over `k` for an involution of `k`.
- `exists_conj_specialLinear_two_of_transvection_generated`: `SL₂(k)`, or `p = 3` and `G ≃* SL₂(ZMod 5)`.

Both use real carriers only: transvections are the matrices with `rank(g − 1) = 1` and `(g − 1)² = 0`; irreducibility is stated through submodules of `Fin n → AlgebraicClosure K`; the classical groups appear as matrices with entries in a `Subfield K`. §0.11(2) now says "conjugate in `GL₂(k′)`" to match the Lean statement, and its proof gains the descent from `k̄′` to `k′`.

## H06 (CBirkbeck) — applied

§8.1 (line 1442) now takes `λ` to be any finite place of `M` (of `M⁺` for the rational real form) with `l ∤ N`, `l = 2` included, and states (1) and (2) for `V^ℚ_{t,λ}`. For `λ ∤ 2N` this recovers `V_{λ,t}`. Supplier ModularityAndLanglandsExtensions §2.10 covers this case: it says "This includes p=2 for odd N", and its §2.11 is stated for "the actual `λ|p` fibre". The proof now notes the scalar extension for the real form, and the Check `N = 5`, `n = 2`, `F_v = ℚ₂(ζ₅)`, `t = 1/2` is added.

## H07 (CBirkbeck) — applied

The Conventions clause on `gcd(N, n) = 1` is deleted (line 48), and the hypotheses that depended on it are removed from §§5.5, 5.6, 5.8 and 9.4. §4.4 (line 829) is re-proved without coprimality:
- The Katz twist `L_θ` contributes `θ = ζ_N^s` at `t′ = 0` and `θ⁻¹` at `∞`.
- §4.2 forces `εB + s = B`.
- The new §1.5(3) (line 480) shows that this forces `s = 0`, for Qian's and for the self-dual index sets.

The `n = 3`, `N = 603` Check records why the determinant alone does not suffice (`θ = ζ^{201}` has `θ³ = 1`). That makes the existing §5.5 Check with `gcd = 3` consistent. The suggested sentence about §9.1 was not added: §9.1's "prime to `ln`" is Qian's own hypothesis (QIAN23 line 444) and needs no comment.

## H08 (CBirkbeck) — applied

§6.2 (line 1112): "by §5.9 this is the value of the character `det V[λ]`" → "an equality in the characteristic-zero coefficient field, and by §5.9 reducing this unit of `O_λ` modulo `λ` gives `det V[λ](Frob_v) ∈ k(λ)^×`". The Check `N = 5`, `n = 2`, `q = 11`, `λ | 3` is added: `1331 ≡ 2` in `𝔽₃ ⊂ 𝔽₈₁` (line 1126). §§6.4 and 6.7 already reduce explicitly.

## H09 (CBirkbeck) — disputed

§9.1's hypothesis "`l` odd" is the generality of the source construction. Qian defines `V_λ` and `V[𝔫]` only for primes and ideals of `ℤ[1/2N, ζ_N]`, with 2 inverted (QIAN23 lines 526–535), and builds `T_W` on such ideals (line 719). The residual group is identified by Zalesskii–Serezhkin, an odd-characteristic theorem (lines 690–693). Lines 442–445 therefore do not show that the switch covers `l = 2`.

A characteristic-two switch would be new mathematics, not a restatement of a source: the classification of transvection groups in characteristic two includes orthogonal and symmetric-group cases that would have to be excluded, and the round-2 passes themselves accept a dihedral obstruction for `n = 2`. No consumer needs it either: the only roadmap citing this one, PotentialAutomorphyInfrastructurePartII, consumes §9.4 with odd `lᵢ`. No edit was made.

## Build and gate

- `lake build TauCetiRoadmap.PotentialAutomorphyDworkMotivesPartII.Suggested`: `Build completed successfully (18454 jobs).` The only warnings are the `declaration uses 'sorry'` warnings on the eleven theorems and the module-system import notice.
- Gate: `gate PotentialAutomorphyDworkMotivesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 244 roadmaps, 2232 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). The new supplier, CFSGBasicProperties, is on main.
- `roadmaps resolve`: no cross-roadmap citation or roadmap Lean name found nowhere. It could not check names outside TauCetiRoadmap on this host. Instead, `#check @…` was elaborated, through the permitted build with lines appended to `Suggested.lean` and then removed, for every Tau Ceti and Mathlib name the edits introduce. All exist at the pins with the quoted statements: the `TauCeti.GLSymplecticFin` family, `Matrix.unitaryTransvection`, `TauCeti.ValidLieTypeIndex.unitaryTransvectionHom`, `TauCeti.ValidLieTypeIndex.unitaryForm`, the three fixed-point comparisons, `TauCeti.DerivedCentralQuotient.congr` and `TauCeti.DerivedCentralQuotient.mulEquivQuotientCenter`, `MulAction.IwasawaStructure.commutator_le` and `MulAction.IwasawaStructure.isSimpleGroup`, and the `IsPretransitive` instance on `Projectivization K (Fin (m + m) → K)`.
- Elaborated signatures: `#check @` of the two new theorems and of `qianGauss` shows every hypothesis in the declarations' own binders (`p ≠ 2`, `2 < n`, the generation and irreducibility hypotheses), and the types agree with README §0.11. Nothing changed as a result. The other nine declarations are unchanged.

## Ownership and sources

- Griffiths' residue theorem and DK17 Theorem 1.1.5: searched by object (`griffiths|pole order|jacobian ring|poincaré residue`; `drinfeld.kedlaya|slopes of indecomposable|generic slopes|indecomposable convergent`) on main and at the open heads. No owner was found, so each is placed as a requirement on the earlier, natural supplier: ComplexComparisonPartII §C5.3 and PadicDifferentialEquationsAndRigidCohomology §RD.3.34.
- The simplicity of `²A`, `C` and `B₂` belongs to CFSGBasicProperties on main and is now imported, not planned again here.
- No new sources were fetched, and `needs-references.toml` was not needed.
- No text in the review asked for anything outside the job.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result / change |
|---|---|---|---|
| §0.9(3) `Sp_{2m}(k)` perfect for `(m,q) ≠ (1,3)` | `(1,3)`, `(1,5)`, `(2,3)` | `Sp₂(𝔽₃)` abelianisation of order 3; `𝔽₅` has `a = 2`, `a² = 4 ≠ 1` (pin `commutator_eq_top`); `Sp₄(𝔽₃)` perfect by `commutator_eq_top_of_two_ne_zero` | Exclusion exactly `(1,3)`; added as a Check |
| §0.9(3) `PSp₄(𝔽₃)` primitive action | 40 points, orbits `1, 12, 27` | Block sizes `1, 13, 28, 40`; `40 mod 13 = 1`, `40 mod 28 = 12` | Primitive; Check added |
| §0.9(3) order | `q = 3`, `m = 2` | `3⁴·8·80 = 51840`, `/2 = 25920` | Check added |
| §0.9(2) centre of `SU_n` | `SU₃(𝔽₄₉)`, `SU₃(𝔽₂₅)` | `gcd(3, 8) = 1` (trivial), `gcd(3, 6) = 3` | Divides `n`; Check added |
| §0.9(2) commutator step | `t = diag(λ, c(λ)⁻¹, c(λ)/λ)` on hyperbolic `e, f`, anisotropic `w` | `det = 1`, `N(c(λ)/λ) = 1`, `[t, τ_{e,a}] = τ_{e,(N(λ)−1)a}` (pin `unitaryTransvection_smul`) | Needs `N(λ) ≠ 1`, available for `q ≥ 3` |
| CFSG valid range | `²A₂(3)`, `²A₃(q)`, `C₃(q)` odd, `B₂(3)` | Pin `InStandardRange`: twistedA `r ≥ 2`, `r = 2 → q ≥ 3`; C `r ≥ 3`, odd; `B₂(3)` duplicate | Contract states exactly these |
| ZS headline (`n > 2`) | `SL₃(𝔽₃)`; `Sp₄(𝔽₃)`; `SU₃(𝔽₉)` with `σ = x³`, `H = 1`; trivial `G`; unitriangular `G` | Disjuncts 1, 2, 3 hold respectively; trivial and unitriangular `G` fail `hirr` (a line is invariant) | Statement consistent |
| Rank-two headline | `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)`; `SL₂(𝔽₃)`; `SL₂(𝔽₅)` in characteristic 5 | Orders `120 ∉ {24, 720}` (exception, `p = 3`); subfield cases | Consistent; descent to `GL₂(k′)` added to the proof |
| §1.5(3) affine stabiliser | Qian `n = 3..12`, `N ∈ [100n+101, 100n+160]` odd (includes `gcd > 1`); self-dual even `n ≤ 20`, `N ≤ n+79` | Computed stabilisers: exactly `{(1,0)}` (Qian), `{(1,0), (−1,0)}` (self-dual) | Lemma holds; first draft's `N/h > n` was false for `n > 100` and was replaced by `3 < 1 + N/h < (N − n + 4)/2` |
| §1.5(3) Checks | `N = 401`, `B = {1,2,398}`; `N = 9`, `{1,4,7}` | `3 − B = {1,2,6}`, `−6 − B = {393,394,398}`; `{1,4,7} + 3 = {4,7,1}` | Added |
| §4.4 without gcd | `n = 3`, `N = 603`, `B = {1,2,600}` | `B + 201 = {198,202,203}`, `−B + 201 = {199,200,204}`; `θ³ = 1` | Determinant alone insufficient; comparison excludes `θ ≠ 1`; Check replaced |
| §6.2 reduction | `N = 5`, `n = 2`, `q = 11`, `λ | 3` | `11·11² = 1331`, `1331 mod 3 = 2` | Clause repaired; Check added |
| `qianGauss` normalisation | `F = 𝔽₂`, `R = 𝔽₂[ε]/(ε²)`, `ψ(1) = 1 + ε`; `R = ℂ` | `(1+ε)² = 1`; `g(0) = −(1+ε) = 1+ε`; over `ℂ`, `ψ(1) = −1`, `g(0) = 1` | Domain hypothesis added (Lean docstring and Mathlib contract) |
| §8.1 at `l = 2` | `N = 5`, `n = 2`, `F_v = ℚ₂(ζ₅)`, `t = 1/2` | `v(t) = −1`; `5 ≡ 5 (mod 8)` so 2 is inert in `ℚ(√5)`; weights `{1,2}` twisted to `{0,1}`; `N ≠ 0`, `N² = 0` | Statement extended; Check added |
| §2.1 Griffiths grading | Fermat cubic, `b = (1,1,1)` | `k = 1`, `gr_F^{3−1−1} = H^{1,0}`; `(h⁻¹)*` exponent `(2,2,2)`, `p = 3 − 1 − 1 = 1` | Agrees with the Conventions witness |
