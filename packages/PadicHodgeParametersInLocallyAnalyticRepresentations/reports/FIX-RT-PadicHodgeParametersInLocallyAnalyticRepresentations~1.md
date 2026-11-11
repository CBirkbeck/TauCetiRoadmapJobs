# FIX-RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1

Repair of red-team round 1 (passes a and b). All twelve findings were checked against DING25, the
supplier roadmaps at their current heads (TriangulineVarietyAndItsLocalModel, PhiGammaModulesAndIwasawaCohomology,
LocalGaloisDeformationRings, SmoothRepresentationsOfLocalGroups, PadicHodgeTheory as open pull
requests; LocallyAnalyticRepresentationsOfLocalGroups as the board package), and all twelve hold.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1a/F01 (P2) — applied

§3.6 (3): "`M_{i,σ}` = 𝔗_σ(M_i)" → `M_{i,σ}` is the graded piece of the saturated filtration of D_σ
(ambient cutoff `h_{n,τ}`, as TriangulineVarietyAndItsLocalModel §§10.5, 12.4), `t_{M_{i,σ}}` = T_σ ∘ `t_{M_i,σ}`;
it differs from M_i's own modification by `z^{k_i}`, kernels unchanged. Carried into §3.7, §4.1, the
§4.2 induction (twist exponents), the §10.5/§12.4/§12.7 contract lines; new API bullet and Check
(witness (3,1) → (0,0), not (1,1)).

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1a/F02 (P2) — applied

§5.5: "it is canonically π_min(D)" → `U[𝔪_{A_D}]` has the class of π_min(D), so is isomorphic to it as
an extension; the isomorphism is unique up to 1 + i∘f∘p, f ∈ Hom_G(𝒦_D ⊗ A, V) ≅ Hom_E(𝒦_D, E), unique
when 𝒦_D = 0. Sketch rewritten via LocallyAnalyticRepresentationsOfLocalGroups §§1.8–1.9; new Check
(n = 3: a line of isomorphisms). §2.1 now says π_min(D) is determined up to extension isomorphism.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1a/F03 (P2) — applied

Conventions now fix h as Hodge–Tate–Sen weights in Ding's normalisation (DING25 §2.1, p. 10; source
line 451: ε has weight 1), equal to PhiGamma §7.3 character weights and §7.2a Sen labels, negatives
of PhiGamma's standing Hodge–Tate weights; jump at −k; witness R(ε): +1 here, −1 there. Summary and
§10.5 contract say "Hodge–Tate–Sen weights".

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1a/F04 (P3) — applied

Conventions: F, G defined for n ≥ 2 only. §0.1: compatibility with F, G for n ≥ 2; n = 1 only the
families. §0.4: "neither inclusion follows" restricted to n ≥ 2 (values 2 + d_K, 26/27), both kernels
zero at n = 1. §3.6 third Check rewritten (content only for n ≥ 3, d_K ≥ 2). Worked examples: repeated
weights for d_K > 1 and n ≥ 2.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F01 (P2) — applied differently

New §5.1 target: R_δ = ⊗̂_i R_{δ_i} (rank-one rings of LocalGaloisDeformationRings §1.23) and
`R_{δ,g}` = ⊗̂_i R_{δ_i,g}, with pro-representability, formal smoothness, tangents H_T and
Hom_sm(T(K),E); API bullet, two Checks; "in rank one," deleted. Differently: §1.23 does not state the
locally algebraic quotient, and PhiGamma §7.4's de Rham criterion is field-only, so `R_{δ_i,g}` ≅ E⟦y_i⟧ is
derived here.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F02 (P3) — applied

PhiGamma contract gains §7.2 (rank-one H⁰/H¹/H² and submodules `∏_σ t_σ^{m_σ} R_{K,E}(δ)`, used in §5.1
for the Hom vanishing) and §7.2a (Sen modules and polynomials over affinoid coefficients, used over
E[ε]/ε² in §2.6). §7.4 entry now also names the rank-one classification over Artinian coefficients,
used by the new §5.1 target.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F03 (P3) — applied

§1.6 Needs + TriangulineVarietyAndItsLocalModel §11.4; §2.3 Needs → §§1.4, 1.6, 2.2;
LocallyAnalyticRepresentationsOfLocalGroups §8.8; TriangulineVarietyAndItsLocalModel §11.4; Layer 5
Dependencies + PadicHodgeTheory §4.5. Same pattern found by a mechanical scan and repaired: §1.4 (+
LocallyAnalyticReps §8.12 (3)), §1.5 (+ §8.12, TriangulineVariety §11.4), §5.5 (+ LocallyAnalyticReps
§§1.8–1.9), §4.1 and Layer 4 (+ TriangulineVariety §§10.5, 11.1), Layer 5 (+ §11.1, PhiGamma §§7.3–7.4).

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F04 (P3) — applied

§2.1 now states End_G(π(φ,h)) ≅ End_G(V) ≅ End_G(A) = E as a target with its argument (socle A from
LocallyAnalyticReps §8.13; A occurs once, from §§6.2, 8.3–8.4 (1); f − c then vanishes); Needs gains
§§6.2, 8.3–8.4. New API bullet and Check (n = 2 reduces to §8.7; a nonsplit self-extension Ã with
socle A has End ⊇ E[ε]/ε², showing multiplicity one is needed).

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F05 (P3) — applied differently

Rather than annotating an overlap, the gap now asks only for what is new: that 𝒥_w induces Ĥ_φ ≅
`R_{w(φ),g}` on the completion; the reordering-compatibility clause is dropped, and a sentence says the
maps 𝒥_w, their reordering identity and differentials are those LocallyAnalyticRepresentationsOfLocalGroups
requests from the same section for its §8.8 (2). `design/plan.json` gap `needs` updated to match (slug,
supplier, section unchanged).

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F06 (P3) — applied

Layer 3 Examples: "π_min(M_1) ⊠ M_2" → "π_min(M_1) ⊠ π_min(M_2), where π_min(M_2) is the character
`ψz^{h_4}` of K^× for the rank-one block M_2 = `R_{K,E}(ψz^{h_4})` (§2.6, first Check)".

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F07 (P3) — applied

"Layer 5 reformulates Theorem 3.21" → "Theorem 1.4 (DING25 Theorem 3.21)". Pattern: two bare
"Remark 3.7" (§2.6, §5.3) → "Ding Remark 3.7"; the `Suggested.lean` docstring's bare theorem numbers
now read "Ding Theorem 3.21" etc.; the Citations convention now says unqualified theorem numbers are
this roadmap's and bare parenthesised numbers are DING25 equation numbers.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b/F08 (P3) — applied

Summary: "The source is … §3.2" → "These results are located in … (DING25), §3.2, pp. 47–59; each target
gives its locator." Scope: "owns the comparison of §3.2 of DING25" → "owns the comparison between
`Ext¹_{GL_n(K)}(π_alg(φ,h), π_1(φ,h))` and the trianguline first-order deformations of D". Suggested.lean
docstring: "The headline theorems, located in Ding, … §3.2, are:".

## Checks run

- **Elaboration.** `lake env lean packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean`
  from the content checkout: exit 0, no messages (12 s). The file has no declarations (one module
  docstring, an empty namespace, `import Mathlib` only), so the `#check @name` comparison has no
  inputs; no binder or signature changed. The docstring was rewrapped to at most 100 characters per
  line.
- **Dependency check.** Output, verbatim:

  ```text
  depcheck: 237 roadmaps, 2145 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the edited README lists only "LocallyAnalyticRepresentationsOfLocalGroups
  §4.1: no roadmap … on main or in an open pull request"; that roadmap is the board package earlier
  in the merge order (all its cited sections, including §4.1, exist there), so the lead is false.
  No Lean name is reported missing.
- **Format.** No `_{`/`^{` outside backticks, no LaTeX delimiters, no process words, no machine paths
  in the changed files.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| Weight normalisation (Conventions) | n = 1, K = ℚ_p, φ_1 = abs, h_1 = 1 | D = R(x·abs) = R(ε): weight +1 (DING25 line 451); PhiGamma §7.2a Check: Sen label +1, HT weight −1; D_dR(ℚ_p(1)) jumps at −1; TriangulineVariety §12.4 one-jump filtration at −h_{n,τ} ↔ weight h_{n,τ} | consistent; the opposite reading would make the graded parameter R(abs·x⁻¹) ≠ R(ε) |
| F, G only for n ≥ 2 | n = 1, 2 | n = 1: P_{n−1} = P_0 does not exist, S_end = S_start = {id}; n = 2: both ranks (1,1), parabolic P_1, S_end = {id}, S_start = {(12)} | restriction added |
| §0.4 kernel dimensions | n = 1; n = 2, d = 1; n = 3, d = 1, 2 | (0, 0); (3, 3) = 2 + d both; (26, 27); (37, 39), difference c_3·d = 2 | "neither inclusion follows" true exactly for n ≥ 2 |
| §2.1 End_G(π(φ,h)) = E | n = 1; n = 2, ℚ_p; n = 3; control Ã | n = 1: π = A; n = 2: π = V of length 3, §8.7; n = 3: π ⊋ V, A once; Ã: soc A, A twice, ε ≠ 0 with ε² = 0, End ⊇ E[ε]/ε² (dim 2) | holds with multiplicity one; control shows soc = A alone is insufficient |
| §3.6 (3) ambient blocks | n = 3, d = 2, h_τ = (3,1,0), F and G; n = 4, (3,1); K = ℚ_p | F: D_1 (3,1) → (0,0), own (1,1), k_τ = −1; R(φ_3z^{h_3}) 0 → 0, k = 0. G: R(φ_3z^{h_1}) 3 → 0, k = −3; C_1 (1,0) → (0,0), k = 0. n = 4: dim Ker t_{M_1,σ} = c_3 = 1 = dim of the σ-parabolic kernel. ℚ_p: no τ | kernels independent of cutoff; targets Q_σ of equal dimension m + m(m+1)/2 either way |
| §3.6 third Check | n = 1, 2, 3; d = 1, 2 | n = 1: one jump, no flag; d = 1: no τ; n = 2: both kernels 0; n = 3, d = 2: equal σ-kernel lines | content only for n ≥ 3, d ≥ 2, as stated |
| §4.2 induction twist | n = 3, h_τ = (3,1,0) | D_1 exponent h_{3,τ} − h_{2,τ} = −1 (matches §3.6 Check); C_1 exponent 0 | twist is an isomorphism, so iso of own modifications ⇔ iso of ambient blocks |
| §5.1 R_δ, R_{δ,g} | n = 1; n = 2, ℚ_p; n = 3, d = 1; product-character control; δ_1 = z^k; p = 2 | n = 1: tangent 1 + d (§1.23 Check), R_{δ,g} = E⟦y⟧ dim 1; n = 2: 4 and 2; n = 3, d = 1: dim R_δ/𝔪² = 7 = 8 + 4 − 5 (Cartesian square (3.55): R_{D,w}/𝔪² dim 8, R_{δ,g}/𝔪² 4, R_{D,g}/𝔪² 5); product character: tangent 2 ≠ 4; z^k(1 + ε v_p) weight k, z^k(1 + ε log_p) weight k + ε; 1 + 𝔪_A torsion-free also at p = 2 (lowest term of (1+x)^m − 1 is mx) | holds; locator corrected to DING25 p. 57 (source line 2541–2549) |
| §5.5 annihilator up to isomorphism | n ≤ 2; n = 3, ℚ_p; n = 3, d = 2 | Hom_G(𝒦_D ⊗ A, V) = Hom_E(𝒦_D, E): 0, E, E²; (i∘j∘p)² = 0 since p∘i = 0 | uniqueness only for 𝒦_D = 0; "canonically" removed |
| Gap trimmed | — | §5.1 independence of w uses TriangulineVariety §11.3 and LocallyAnalyticReps §8.8 (2), whose reordering identity is that roadmap's request | nothing in this roadmap used the dropped tangent clause |
| Layer 3 example | n = 4, (3,1) | θ^P = (0,0,0,−3), ε⁻¹∘θ^P = 1 ⊠ ε³; π_min of the rank-one block = its character (§2.6 n = 1) | object now a representation |

## Notes for the maintainer

- No section, target or Lean name of this roadmap was renumbered, renamed or deleted; citing roadmaps
  are unaffected. The new §5.1 target (deformation rings of characters of T(K)) is owned here: no
  roadmap on main, open pull request or board package states it (searched by object;
  LocalGaloisDeformationRings §1.19 is the integral ring of a residual Galois character, a different
  object).
- The gap `principal-series-bernstein-completion` now relies on LocallyAnalyticRepresentationsOfLocalGroups'
  ordered-character request to SmoothRepresentationsOfLocalGroups for the maps 𝒥_w; the supplier
  should serve both from one construction.
- No `needs-references.toml` entry: every text used is already recorded (DING25, CEGGPS16).
- Review b's "Source issues" list is errata of DING25, not findings; the README's Source corrections
  already record all twelve.
- Nothing in the reviews or fetched texts asked for actions outside this job.
