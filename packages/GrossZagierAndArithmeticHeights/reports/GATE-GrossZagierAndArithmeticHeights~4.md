# GATE-GrossZagierAndArithmeticHeights~4: answers to human review

The review was made at `38fb730`. The four findings are answered by two commits on the PR branch. Commit `85ba553` makes the four repairs the review asks for. Commit `8c2b7e78` completes them after this round's verification: it adds the vanishing theorems for the vertical terms off S₁, corrects an "only" overclaim in §7.63, and adds supplier citations for the inert Euler factor. Both commits touch only the README. `Suggested.lean` is unchanged, because none of the points touch its single statement (`canonicalHeightRat_exists_unique`). The closing "Checks found sound" paragraph of the review makes no request and is not numbered.

## H01 (CBirkbeck) — applied

§9.15 (`TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` line 5517) now derives the inert factor from the Euler polynomial of the base change, using geometric Frobenius on inertia invariants (jsw line 436). It has two branches:

- **ℓ ∤ N:** the good-place expression (1−a_ℓℓ⁻¹+ℓ⁻¹)(1+a_ℓℓ⁻¹+ℓ⁻¹).
- **ℓ | N:** by (gen-H), ℓ | N⁻ and ℓ ∥ N, f is Steinberg up to an unramified quadratic twist, and Frob_w = Frob_ℓ² acts on the inertia-invariant line by a_ℓ² = 1. The factor is 1−ℓ⁻². The line 5529 API bullet records both branches.

The line 5546 Check computes the reviewer's counterexample: 33a1, K = ℚ(√−31), p = 5. The inert factors are 8/9 and 120/121, where the good-place expression gives 5/3 and 13/11.

§9.22 (line 5659) cites the §9.15 constant. It now also says that an inert prime divides neither p nor D, so the inert primes of S = {ℓ | pND} are exactly those of N⁻: Case I has none, and Case II uses only the Steinberg branch.

The local-factor supplier is AutomorphicLFunctionsAndLocalFactors `AL.4/local-parameter-comparison`, together with GL2AutomorphicRepresentationsAndTransfer `R17.4/local-compatibility`. These sit in the §9.15 *Needs* (line 5553), the Layer 9 dependencies and the supplier-table row. The suggested AL.1 is not the right section: it is the rank-one (Tate) layer. Weil–Deligne factors of GL₂ parameters, and the base-change restriction that keeps the Steinberg monodromy, live in AL.4 and R17.4.3.

## H02 (CBirkbeck) — applied

§7.47 (line 3748) now keeps the vertical kernel l_(φ_v) at every v ∈ S₁, whether 𝔅_v is division or split. Item 4 (line 3754) reads Φ″_v = −2Φ′_v + 2 log N_v · l_(φ_v) at every nonsplit v ∈ S′. The sign agrees with Yuan–Zhang's grouping D = Pr I′ − 2Z̃, which carries +2Σ j_v log N_v (yuan-zhang lines 4302–4317). The 𝔅-division-only sum is recovered only at maximal level under (Q′), through 7.14.

Following the same pattern, the j-terms that item 4 omits off S₁ now each cite a vanishing theorem:

- **Places split in E** (S₂ and every other split place of S′): Yuan–Zhang–Zhang's Theorem 7.8(1).
- **Nonsplit places outside S₁:** the integral model is smooth there, so the vertical correction is zero by definition.

Disegni, Proposition 8.3.1(1)–(2) and its proof (disegni lines 2828 and 2854), states both. The line 3775 Check shows why the deep-level split S₁ term cannot be dropped. On a fibre C₁+C₂ with C₁·C₂ = s, the divisor x−y needs V = (1/s)C₁, which gives a nonzero pairing 1/s.

## H03 (CBirkbeck) — applied

At line 3555 "the two agree only at s=1" was replaced by a Check of the symmetry s↦1−s:

- Substituting m/d for d shows m^sσ_(1−2s)(m) is invariant, so it equals σ₁(m) at both s=0 and s=1.
- For m=2 the values are 3 and 3, and 2^s+2^(1−s)=3 forces s∈{0,1} for real s.
- The specialization the argument uses is the one at s=1.

The s=2 Check at line 3554 (value 9/2 against σ₁(2)=3) is kept. In the outline at line 3550, "only after continuation to s=1" states the order of operations, not uniqueness, and is unchanged. The derivative formula at line 4527 keeps m^sσ_(1−2s)(m) inside the limit, as the pole of E_N requires.

## H04 (CBirkbeck) — applied

The §7.63 outline (line 4043) now begins by reducing to one cotangent. Replacing ω_x by cω_x lowers both sides by ord_v(c): the left side by the tangent law of 7.46, the right side because C_x gains c^(−r_x−k) (conrad line 2538). It then sets ω_x = dT_x (conrad line 2604) before using ord_(v,x)(θ) = ord_v(C_x u_x^k) + (r_x+k)ord_v(b_x) (conrad line 2611), and transports back.

This round also corrects the inserted sentence. "This equality holds only for ω_x=dT_x" became "This equality needs ω_x∈W^×·dT_x … it holds exactly when c is a unit of W". For ω_x = c·dT_x, ord_v C_x moves by −(r_x+k)ord_v(c), so every unit multiple of dT_x satisfies the identity too.

The line 4058 Check computes the failure. With u_x=1, r_x=0, k=6 and ord_v b_x=1, both sides equal 0 at dT_x and −1 at π dT_x. Applying the identity at π dT_x would give 0.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §9.15 inert factor, ℓ∤N | α+β=a, αβ=ℓ | (1−α²/ℓ²)(1−β²/ℓ²) = 1+2/ℓ+1/ℓ²−a²/ℓ² = (1−a/ℓ+1/ℓ)(1+a/ℓ+1/ℓ) | identity holds | none |
| §9.15 inert factor, ℓ∣N | 33a1, ℓ=3 (a=−1), ℓ=11 (a=+1), p=5 | Steinberg: 8/9 (v₅=0), 120/121 (v₅=1); good-place: 5/3 (v₅=1), 13/11 (v₅=0) | branch needed | none (in `85ba553`) |
| 33a1 data | point counts at 2, 3, 5, 7, 11; Δ, c₄ | #E(𝔽₃)=5, #E(𝔽₁₁)=11, #E(𝔽₅)=8, #E(𝔽₇)=4; Δ=88209=3⁶·11², c₄=553=7·79; (−31/3,−31/11,−31/5)=(−1,−1,+1) | a₃=−1, a₁₁=+1, a₅=−2, a₇=4 (agrees with LMFDB 33.a2) | none |
| §9.15 Frob_w trivial at inert w | c fixes w, acts by −1 on Γ≅ℤ_p, p odd | Frob_w = Frob_w⁻¹ ⇒ 2-torsion ⇒ 0 | constant factor | none |
| §9.17 ramified ℓ∤N factor | 11a1, ℓ=23, p=5 | (ℓ+1−a)/ℓ = 25/23, v₅=2 | consistent with the 9.15 Check | none |
| §9.22 inert primes of S | Case I (all ℓ∣N split or ramified); Case II (N⁻ inert) | inert ℓ∣pND ⇒ ℓ∤p (split), ℓ∤D ⇒ ℓ∣N⁻ | Case I: ∅; Case II: N⁻ | sentence added |
| §7.47 sign of the l-term | YZ D = Pr I′ − 2Z̃ | −2·(−Σ j_v log N_v) = +2Σ j_v log N_v; Φ″ = −2(k − m log N) + 2 log N · l | matches yuan-zhang 4302–4317 | none |
| §7.47 off-S₁ j-terms | split v (S₂ and deep split levels); nonsplit good v | Disegni 8.3.1(1): i_v = j_v = 0; 8.3.1(2): j_v = 0 by definition (smooth model) | vanishing cited | sentences added |
| §7.47 two-component Check | fibre C₁+C₂, C₁·C₂=s, C_i²=−s | (x−y+C₁/s)·C₁ = 1−1 = 0, ·C₂ = −1+1 = 0; V·(x′−y′) = 1/s | nonzero j | none |
| §7.36 eigenvalue symmetry | m=2, s=0,1,2; general m | 3, 3, 9/2; m^{1−s}Σd^{2s−1} = m^sΣd^{1−2s}; x+2/x=3 ⇒ x∈{1,2} | only s∈{0,1} real | none (in `85ba553`) |
| §7.63 cotangent reduction | ω ↦ cω | C ↦ c^{−r−k}C; left side −ord c; bracket/(r+k): −ord c | both sides shift equally | none |
| §7.63 leading-coefficient identity | ω = c·dT_x, c ∈ {1, unit, π} | ord C_x shifts by −(r+k)ord c; θ, b_x fixed | holds iff ord c = 0 | "only for dT_x" → "W^×·dT_x" |
| §7.63 automorphism sum | T_x = Π_g[g](T₀), c_g = constant term | ord b_x = Σ_{g∉G_W} ord c_g = Σ_{n≥0}(#Aut_{W/π^{n+1}} − #Aut_W)/2 | equals the ½Σ term | none |
| §7.63 Check | u=1, r=0, k=6, ord b=1 | dT_x: 1 + (−6)/6 = 0 = left; π dT_x: 1 + (−12)/6 = −1 = left | consistent | none |

## Ownership, citations and Lean

- **Ownership.** The added citations name existing owners: AutomorphicLFunctionsAndLocalFactors AL.4 `local-parameter-comparison`, and GL2AutomorphicRepresentationsAndTransfer R17.4.3 (anchor `r17-4-local-compatibility`, "All-place compatibility of cyclic base change"). Both are new-roadmap pull requests that precede this roadmap in the merge order, and both were read at their heads through `roadmaps show`. This roadmap owns only the anticyclotomic specialization of the inert factor.
- **Citation resolution.** `roadmaps resolve` on the edited README reports no unresolved cross-roadmap citation and no unresolved Lean name. The seven Lean-name leads in the worker's list are targets declared in their supplier roadmaps, checked by `roadmaps grep`:
  - `CanonicalModel.special_action` and `special_rational`: ShimuraVarieties.
  - `SerreTate.homCriterion`: AbelianSchemesAndArithmeticModuli.
  - `ringClassField`: ClassFieldTheory.
  - `idealAction.picardEquiv`, `idealAction.degree_eq_norm` and `idealLatticeCurve.automorphism_factors`: ComplexMultiplicationAndExplicitReciprocity.
- **Suggested.lean signature.** `Suggested.lean` is unchanged. Its one elaborated signature in the worker's `signatures.md` keeps every binder the statement needs: `Field K`, `Height.AdmissibleAbsValues K`, `DecidableEq K` and `W.toAffine.IsElliptic`. It agrees with README §0.2. No new `#check` file was elaborated, because the declaration did not change.
- **Sources.** No new source was needed. Every new locator is in a cached text: jsw 436/1345/1352, disegni 2828/2854, yuan-zhang 4302–4317/4363, conrad 2538/2604/2611 and skinner-published 609.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: `Build completed successfully (8981 jobs)`. The only warning is `Suggested.lean:38:8: declaration uses 'sorry'`.
- Gate at `8c2b7e78`: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
