# Review of PeriodsAndSpecialValues (pull request #1496 at 23c20c7)

**Verdict:** accepted

:robot: Independent AI incremental re-review of 28 changed README lines since fdd0c4d. The one blocking finding of the previous review is repaired at this head; the gate, the dependency check and the Lean elaboration pass; two P3 notes remain, both the author's to take or leave. This review changes no pull-request file.

## R01 (P3) — Name the level structure in the level-33 Check

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:585`: “For the level-11 weight-two newform viewed at auxiliary level 33, f(q) and f(q³) span the f-old cusp space, of dimension two, so the f-eigenspace … has dimension four.”

**Claim:** at auxiliary level 33 the f-old space has dimension two and its parabolic H¹ dimension four.

**Witness:** the construction two paragraphs above (README:571) works “over a fine auxiliary full level”. The fine full level Γ(33) is conjugate, by diag(33, 1), to Γ₀(33²) ∩ Γ₁(33). The f-old forms there are f(q^d) for d | 99, six of them (d = 1, 3, 9, 11, 33, 99), so the away-from-33 f-eigenspace in parabolic H¹ has dimension twelve, not four. The stated values two and four are those of Γ₁(33) or Γ₀(33), where the only divisors of 33/11 = 3 are 1 and 3.

The Check's point survives at either level (the newspace projector keeps dimension two in both cases), so nothing mathematical fails; the Check only computes at a level structure different from the one the target uses, without saying so.

**Exact repair:** write “viewed at level Γ₁(33)” (or Γ₀(33)), or keep the full level and replace the numbers: six oldforms f(q^d), d | 99, hence dimension twelve, while the newspace projector keeps two. Tested on the instance that raised it: Γ₁(33) gives σ₀(3) = 2 forms and 4 cohomological dimensions; Γ(33) gives σ₀(99) = 6 forms and 12 dimensions.

## R02 (P3) — Index the completed summands by the places of E, not of K_f

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:571`: “after ⊗_ℚ ℚ_ℓ it is the product over λ | ℓ of the primitive K_λ-summands of §6.1, each of dimension two.”

**Claim:** the f-component of the E-rational parabolic realization, tensored with ℚ_ℓ, is the product over λ | ℓ of the K_λ-summands of AlgebraicModularFormsAndSerreWeights §6.1.

**Witness:** E ⊗_ℚ ℚ_ℓ = ∏_{λ | ℓ} E_λ over the places λ of E, while §6.1 (`TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md` §6.1, open head) indexes its summands by places μ of the coefficient field K_f and gives dimension two over K_μ. For E = ℚ(√5) ⊋ K_f = ℚ and ℓ = 11 (split, since 4² ≡ 5 mod 11) there are two factors E_λ = ℚ₁₁ above the single K_μ = ℚ₁₁; for ℓ = 2 (inert) one factor E_λ = ℚ₄ above K_μ = ℚ₂. The factor is (primitive K_μ-summand) ⊗_{K_μ} E_λ with μ = λ|_{K_f}, of E_λ-dimension two; “K_λ” for a place λ of E is not defined.

**Exact repair:** “after ⊗_ℚ ℚ_ℓ it is the product over the places λ | ℓ of E of (primitive K_μ-summand of §6.1) ⊗_{K_μ} E_λ, μ the restriction of λ to K_f, each of E_λ-dimension two.” Tested on the instances above: both give total ℚ_ℓ-dimension 2·[E:ℚ] = 4 and E-rank two.

## Previous findings

- R01 — repaired: README:234 now says §§14.1–14.4a “do not select the primitive f-summand”; the primitive projector and rank-two multiplicity are cited from AlgebraicModularFormsAndSerreWeights §6.1 (README:128–130, 571, 605, 665), the compactification and Scholl correspondence from WeightsInEtaleCohomology §§5.2, 5.5 (README:122–124), and the weight-two quotient from ModularCurvesPartII §§16.1–16.4. The repair introduced the two P3 precision notes above and no new blocking problem.

## Verified sound

**Scope and evidence.** Head confirmed as 23c20c714b1d57cbc7d5cfea20fbe1229305f37e; the worktree is clean. The diff since fdd0c4d is 17 inserted and 11 deleted README lines in Scope (README:37–41), two new supplier contracts (README:122–130), the ModularCurvesPartII contract (README:234–236), PS.1.6 (README:563–605) and the Layer PS.1 Dependencies (README:665). `Suggested.lean` is unchanged (empty diff against fdd0c4d), and the pull request's diff outside the roadmap folder is empty. Review was confined to the changed passages, what cites them, and the full gate and elaboration; unchanged computations are carried forward below with their provenance.

**Gate and elaboration.** The worker's gate at this head passes every rule including `build=0`. The gate rerun here passes every text and dependency rule (`set_option=0 … outside-folder=0 source-material=0 OK`). Direct `lake env lean` elaboration of `TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean` ends with exactly 13 `declaration uses sorry` warnings and no other diagnostic. A scratch file with `#check @name` for all 38 declarations elaborates and prints 38 signatures agreeing with the worker's signature list; no binder is lost (the convergence-domain, positivity, admissibility and finite-dimensionality hypotheses are explicit). The file is unchanged, so the one-tactic probe of r2 (carried through r4 and r5) stands: none of the 13 headline theorems closes by `simp`, `rfl`, `infer_instance` or one library lemma.

The dependency check prints exactly:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Merge-order positions: ModularCurvesPartII 71, AlgebraicModularFormsAndSerreWeights 85, WeightsInEtaleCohomology 133, PeriodsAndSpecialValues 298; all three new suppliers precede this roadmap. ResolutionOfSingularitiesCharacteristicZero no longer occurs anywhere in the README (it was the previous compactification supplier; the compactification now comes from WeightsInEtaleCohomology §5.5), so the Scope list, the contracts, PS.1.6's Needs and the Layer PS.1 Dependencies agree.

**Changed citations resolved** (the three suppliers are open pull requests, read at their heads through the roadmaps tool; lines refer to those heads):

| Changed input | Resolved text and result |
|---|---|
| WeightsInEtaleCohomology §5.5 (README:124) | `TauCetiRoadmap/WeightsInEtaleCohomology/README.md` §5.5: for r ≥ 1 and full level M ≥ 3, a smooth projective equivariant compactification of the r-fold fibre power and the rational idempotent e_ε = |Γ_r|⁻¹ Σ ε(γ)[Graph(γ)], Γ_r = (((ℤ/M)² ⋊ {±1})^r) ⋊ S_r, ε trivial on translations, product of inversion signs and permutation sign; denominator divides M^(2r)·2^r·r!. Matches the README's description word for word in substance; the README's “k ≥ 3, r = k − 2” is the supplier's r ≥ 1. |
| WeightsInEtaleCohomology §5.2 (README:124) | §5.2: the image of the projector identifies, Hecke- and Galois-equivariantly, the parabolic Sym^r R¹ realization with the interior-image subquotient of H^(r+1)(W_r, ℚ_ℓ); weight two is the separate Jacobian target §5.3. The README claims exactly this, in degree r + 1, and asserts no integral or saturated image (the supplier's own caveat). |
| AlgebraicModularFormsAndSerreWeights §6.1 (README:128–130) | §6.1 “The classical rank-two cohomological summand”: k ≥ 2, neat full level m ≥ 3 with N | m, filtered logarithmic de Rham parabolic realization of Sym^(k−2) H¹_dR, comparison with the Betti image of H¹_c → H¹, Eichler–Shimura decomposition, exact-level newspace eigenprojector over every K_λ, primitive f-summand of dimension two, identification of multiplicities at two levels through a common multiple, extra oldvectors not enlarging the primitive multiplicity. Every clause of the README's contract is stated there. |
| ModularCurvesPartII §§16.1–16.4 (README:236, 571) | Layer 16 at its head: §16.1 Hecke prime and K_f; §16.2 A_f = J₁(N)/B_f for N ≥ 5 with K_f acting in End⁰ (the quotient itself is consumed by name from CyclotomicClassGroupsAndStickelberger §4.3, order position before this roadmap); §16.3 dim A_f = [K_f:ℚ] and V_ℓ(A_f) free of rank two over ℚ_ℓ ⊗ K_f; §16.4 differentials identified with the span of f^σ. The README's four claims are these four sections. WeightsInEtaleCohomology §5.3 cites the same sections for the same object, so the citation practice is shared. |
| ModularCurvesPartII §§14.1–14.4a disclaimer (README:234) | ModularCurvesPartII README line 36 assigns the primitive newspace projector and rank-two multiplicity to AlgebraicModularFormsAndSerreWeights; the README now says the same. |
| Scholl, Theorems 1.2.1 and 1.2.4, p.2, §1.3, p.3 (README:571) | Scholl line 103 (Theorem 1.2.1, Betti and ℓ-adic parabolic cohomology as the ε-part of the Kuga–Sato cohomology), Scholl line 118 (Theorem 1.2.4, the Grothendieck motive M(f) decomposed under the Hecke algebra), Scholl line 137 to Scholl line 191 (§1.3, boundary sequence; the argument uses k ≠ 0, so the Kuga–Sato branch is weight ≥ 3 and weight two is separate, as the README now scopes it). |

**Ownership.** The roadmaps tool was grepped over main and all 440 open heads for “Scholl projector/correspondence/motive”, “newform motive”, “Grothendieck motive” and “homological motive”. WeightsInEtaleCohomology §§5.2, 5.5 own the compactification and the correspondence; AlgebraicModularFormsAndSerreWeights §6.1 owns the primitive summand; AutomorphicGaloisRepresentations §§1.3–1.5 (open head) build the ℓ-adic rank-two Galois realization from the same supplied projector and summand; no roadmap other than this one assembles the homological motive with E-action and its marked Betti–de Rham comparison, which is what PS.1.6 keeps. No Lean declaration was added or renamed, so no fully qualified name can collide.

**Seeded sample.** The two sampled passages are unchanged (README:1926 and README:1939); their anchors were reopened: Park Definition 4.8 at Park line 1173 (page marker 23 = printed p.442), Theorem 4.11 at Park line 1233 (p.443, hypotheses v_p(γ) ≤ 1/(p−1) and v_p(ℏ) > 0), Corollary 4.12 at Park line 1345 (p.445, smooth complete intersection), Proposition 5.2 at Park line 1568 (p.449, the q-scaled Frobenius); SH Lemma 4.8 at SH line 271 (p.6) with its proof at SH line 278 (p.7); SG Lemma 5.6 at SG line 1082 (p.30, p > dim V). The README's locators and hypotheses agree. The residue matrix is recomputed below. No locator is flagged unverified in the README.

**Headline coverage.** Unchanged: the 13 statable headlines (Legendre substitution and midpoint error, quartic symmetric square and mirror integrality, two Dwork summabilities, MZV summability, all-two evaluation, shuffle, stuffle, Zagier evaluation, Hoffman numerical spanning, finite dimension bound) are in `Suggested.lean`; the docstring names the non-statable families and their missing carriers. The supplier change touches PS.1.6 only, which the docstring already lists as not statable (no motive carrier at the pins).

### Computed adversarial table

Rows for the changed statements, with values; finite instances test scope, signs and wrong models, not general proofs.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
|---|---|---|---|---|
| WEC §5.5 contract: Γ_r and e_ε | r = 1, M = 3; r = 2, M = 3 | r=1: |Γ_1| = 2·9 = 18, inversion acts +1 on H⁰, H² and −1 on H¹ of a fibre, so e_ε keeps rank 2 of the fibre's 4; r=2: |Γ_2| = 18²·2 = 648 = M⁴·2²·2!, permutation sign turns the graded-commutative Λ² (rank 1) into Sym² (rank 3). Wrong model without the sign gives rank 1 | Matches §5.5's Checks | Retain |
| WEC §5.2 contract: degree r + 1 | k = 3, 4, 12 | degrees 2, 3, 11 on W_1 (surface), W_2 (threefold), W_10; the CM-product degree 2r+1 would be 3, 5, 21 | Matches; README states r + 1 | Retain |
| §6.1 contract: primitive multiplicity | k = 2 at N = 11 and m = 11, 33; k = 12, N = 1 | k=2, m=11: X₁(11) genus 1, parabolic H¹ dimension 2 = primitive multiplicity; m=33: ambient larger, primitive still 2; k=12: Sym¹⁰ fibre rank 11, primitive summand rank 2 | Matches §6.1's own Checks | Retain |
| MCII §§16.1–16.4 contract | N = 11; N = 23 trivial character; N = 1,…,4 | N=11: K_f = ℚ, dim A_f = 1, V_ℓ rank 2 over ℚ_ℓ; N=23: K_f = ℚ(√5), dim 2, V_ℓ of ℚ_ℓ-dimension 4 = 2·2; N ≤ 4: genus 0, no newform, so N ≥ 5 excludes nothing | Matches | Retain |
| PS.1.6 k ≥ 3 branch, E-rank via completions | E = ℚ(√5), ℓ = 11 (split) and ℓ = 2 (inert) | ℓ=11: two factors E_λ = ℚ₁₁, each dimension 2, total 4 = 2[E:ℚ]; ℓ=2: one factor ℚ₄ of dimension 2, total ℚ₂-dimension 4. Both give E-rank 2 | Mathematics sound; indexing wording imprecise | R02 (P3) |
| PS.1.6 weight-two branch M_f = h¹(A_f) | 11a1, p = 2 (a₂ = −2) | Euler factor det(1 − Frob·2^(−s) | H¹)⁻¹ = (1 + 2·2^(−s) + 2^(1−2s))⁻¹ = L(f, s)'s factor; Hodge types (0,1), (1,0), critical m = 1 only | Matches L(M_f, s) = L(f, s) and the Check | Retain |
| New Check: level 33 oldforms | Γ₁(33); Γ(33) ≅ Γ₀(1089) ∩ Γ₁(33) | Γ₁(33): σ₀(3) = 2 oldforms, parabolic dimension 4, newspace 2; Γ(33): σ₀(99) = 6 oldforms (d = 1,3,9,11,33,99), dimension 12, newspace 2 | Values hold at Γ₁(33), not at the fine full level the target uses | R01 (P3) |
| New Check: non-primitive U₃-eigenform | 11a1, a₃ = −1; roots α, β of X² + X + 3 | U₃ f = a₃ f − 3 f(q³), U₃ f(q³) = f; U₃(f − βf(q³)) = αf − 3f(q³) = α(f − βf(q³)) since αβ = 3; Euler factor (1 − α3^(−s))⁻¹ of degree 1 versus degree 2 for good reduction at 3 | Correct; discriminates the primitive hypothesis | Retain |
| PS.1.6 scope k ≥ 3 versus Scholl | k = 2 (r = 0) | Scholl line 191 uses k ≠ 0 to kill σ; at r = 0 the weight argument fails and the Jacobian branch is used | README's split at k = 3 matches the source | Retain |
| Scope/contract/Needs/Dependencies mirror | the three new suppliers; the removed supplier | AlgebraicModularFormsAndSerreWeights §6.1, WeightsInEtaleCohomology §§5.2, 5.5 and ModularCurvesPartII §§16.1–16.4 each occur in all four places (README:37, 122–130/234, 605, 665); ResolutionOfSingularitiesCharacteristicZero occurs 0 times | Consistent | Retain |
| Sample: residue coordinates (README:1939) | R = diag(1,−1,2,−6)·D | R upper triangular with diagonal (1,1,2,6), det R = 12, det D = 1; v₃(12) = 1, v_p(12) = 0 for p ≥ 5 | Consistent with Park/SH anchors | Retain |
| Sample: fixed-fibre map (README:1926) | s = 0,1,2,3 | ρ̃_S(u_s) carries (−1)^s s! = 1, −1, 2, −6, the diagonal of R above; charge-zero relation |u|+|α| = 5(s+|β|) gives total degree 6s on top forms | Consistent | Retain |

### Carried-forward adversarial evidence

The 15 computed rows of `packages/PeriodsAndSpecialValues/reports/PRREVIEW-PeriodsAndSpecialValues~5.md` for the previous head's changed contracts (AlgebraicTopology Stage 6; ModularCurvesPartII §§14.1–14.4a coefficient systems, parabolic image, finite/adic comparison and Borel–Serre pair; AG2.P and PotentialModularity §§1.6–1.7, 1.15; ModularSymbols §§1.1–1.2 sign pairs; R07.P3/P5; GeneralAlgebraicKTheory and determinants; K3 and crystalline cup form; MotivicEtaleKTheory; reference deduplication) stand with their values, except its row on §§14.1–14.4a supplying the rank-two summand, which is now resolved as recorded under Previous findings; its SNC-compactification row is retired with the removed supplier. Its 119 carried rows ([r4] and [r4 via r2], from `packages/PeriodsAndSpecialValues/reports/PRREVIEW-PeriodsAndSpecialValues~4.md` and `…~2.md`) for every untouched statement of Layers PS.0–PS.9 and all 38 Lean declarations retain their computed values and are not repeated here; the Lean file and those README passages are byte-identical to the heads they were computed on.

## Not verifiable

- BG remains settled as uncertified and Tate-legal as waived; neither was requested and neither unseen text is certified here.
- The three new suppliers are open pull requests; they were read at their current heads through the roadmaps tool, not on main, and their contents may move before merge.
- The unchanged full mathematical and one-tactic audits are inherited from r5/r4/r2 as labelled; this incremental review does not claim a fresh audit of every untouched target.

## Source issues

- **Misprint** in Scholl at Theorem 1.2.4, author-copy p.2 (Scholl line 123): the source says the motive has coefficients in E although the coefficient field just defined is L; it should be L; affects nothing.
- **Misprint** in Park at Corollary 4.12, printed p.445 (Park line 1345): the source says its hypotheses come from Proposition 4.11; it should be Theorem 4.11; affects nothing.
