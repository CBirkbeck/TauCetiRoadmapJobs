# Repair of red-team round 2 (reviews ~2a and ~2b) of LocallyAnalyticRepresentationsOfLocalGroups

Ten findings were read and each was checked against the sources. The reviews do not overlap, except that RT~2b/F01 and RT~2b/F02 both touch the route of 2.5: the rewrite made for F01 also settles F02's wording complaint about that route. Each finding has its own section below. Outcome: seven applied, three applied differently, none disputed.

Files changed: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` and `sources.toml` (locators and `cited_for` only). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No supplier gap was added or removed: the seven gaps still match between the README and `plan.json`.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2a/F01 (P2) — applied

§8.7: "unique subrepresentation with socle π_alg and cosocle ⊕C(w, s)" → PS_1 := preimage of soc(PS/π_alg). Its socle is π_alg, and its cosocle is ⊕C(w, s) for n ≥ 2 only (the route proves Hom(PS_1, π_alg) = 0). For n = 1, PS_1 = π_alg. Also: API, n = 1 Check, Source correction (DING25 lines 1525–1528).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2a/F02 (P3) — applied

Source corrections: "Ding, (3.28) and Remark 3.17" → "Ding, (3.32) and Remark 3.17, p. 49" (DING25 lines 1984 and 1989; (3.28) is the diagram at lines 1861–1868). Same bullet: the λ-indexed amalgams are located at lines 1531, 1949 and 1955. The label bullet gains p. 48 (line 1942).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2a/F03 (P2) — applied

§3.1 now defines trace-class, compact, and the three compact-type presentations (RJRC22 Def. 3.33–3.34; BCGP25 Def. 2.2.10, 2.2.12). (ii) now reads "Fréchet V … iff the LS space V^∨". A new item (v) compares the notions: LS ⇔ LB compact type, solid ⇔ classical compact (matrix route), Fréchet compact type = nuclear. Also: the API bullets and three Checks (E^ℕ/⊕E, c_0).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2a/F04 (P1) — applied differently

§9.3 "both have socle π_alg and multiplicity one" → construction: PS_1(w(φ), h) ⊆ X_w = Ind(⊗̂PS_1(blocks)), which embeds into both PS and (3.19). π_(F_P) is the quotient of the sub-amalgam of 8.7's amalgam, so it embeds into π_1. Whole PS_1's are used, not per-constituent extensions; 8.7 supplies the identifications. Also: Needs, the API, and two Checks (including the quiver).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2b/F01 (P2) — applied

§2.5 tensor clause: "H^•(B ⊗̂ M) = H^•(B) ⊗̂ M" → the argument is rerun under c_0(I, −). This works because c_0(I, −) commutes with the analytic vectors and the Mahler stages and keeps open surjections surjective, and c_0(I, P) is coinduced. New Check: the twisted module is not admissible.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2b/F02 (P2) — applied

§2.4 route rewritten as a different argument. Orthonormal bases give c_0(J, X); open mapping keeps the sequences exact; (2) and (3) go through cycle and boundary sequences and syzygies, with ind-systems modulo essentially zero ones. §2.5 is rewritten under F01. §8.12: "varying w covers the target" → "each label I equals w⁻¹({1, …, i}); the images together span".

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2b/F03 (P3) — applied differently

0.3 (v) deleted. The locally σ-analytic definition moves to 0.3 (Lie-action form kept), and D_σ to 0.4 (vi). 0.5 proves that x acts as x̃ and the D_σ-factorisation (Cauchy–Riemann). 10.1, 5.1 (vi), 1.8 Needs and the Scope now refer to these. Differently from the suggestion: its "by 0.3 (iv)" equivalence of the two definitions holds in one direction only.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2b/F04 (P3) — applied

§2.3 (ii) route: E[[H]] → D(H, E) flat (PadicLocalLanglandsForGL2Qp §0.1); D → D_(s_h) flat as a stage (LocallyAnalyticDistributionsPartII §§1.4–1.5); D_(s_h) → D_(<s_h) flat, proved here (ST03 Lemma 4.8 with Propositions 1.1–1.2). (v): PadicFunctionalAnalysis §4.4 for d = 1, d variables proved here. A new supplier contract is added; Needs and Dependencies are updated.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2b/F05 (P3) — applied differently

§4.2 (iii) "Jantzen's lifting criterion" → ReductiveGroups §9C (Dist = U in characteristic zero) and §10A ((Dist, 𝐓)-integration). Uniqueness comes from root-subgroup generation and x_α(t) ↦ Σ tⁿeⁿ/n!. The suggested repair relied on a char-0 stable-subspace fact that ReductiveGroups Layer 2 does not state (main, lines 1499–1531). Needs, the Layer 4 Dependencies and the ReductiveGroups contract are updated.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~2b/F06 (P3) — applied

(1) `Module.Basis.pbwBasis` added to "From Tau Ceti" and Layer 0 Dependencies (pin checked). (2) Layer 4 Dependencies now read "Layers 1, 2, 4, 7 and 8, §§9C and 10A". (3) 7.3 Check: "the Verma module M((0, 2)) of 7.3 is simple, pairing −1", with (1, 1) as the contrast. (4) 2.2 (ii) gains "p. 134" (EM17 line 6696).

## Checks run

- **Elaboration**: from the content checkout, `lake env lean packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean` gave exit 0 with no output. The file is unchanged and has no declarations, so the `#check @name` comparison of its own declarations has an empty domain.
- **Scratch `#check`** of the two library names newly cited in the README: one elaboration of a scratch file in the job directory.
  - `Module.Basis.pbwBasis : {R L ι} [CommRing R] [LieRing L] [LieAlgebra R L] [LinearOrder ι] → Basis ι R L → Basis (ι →₀ ℕ) R (UniversalEnvelopingAlgebra R L)`.
  - `TauCeti.AnalyticStage.amiceMap : (p) [Fact p.Prime] (h) {E} [NormedAddCommGroup E] [Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E] (S) … → C₀(ℕ, E) →L[S] AnalyticStage p h E`.
  - Both agree with the README text. The Amice file's docstring says that bijectivity is not proved there, which is why §4.4 of PadicFunctionalAnalysis is the supplier.
- **Dependency check** (the command in the brief), exact output:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The new supplier, PadicFunctionalAnalysis, is on main.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name was found missing. The tool did not check names outside TauCetiRoadmap; those were checked at the pin by hand, as above.
- **TOML**: `sources.toml` parses. `plan.json` gaps are unchanged (seven slugs, the same as the README contracts).

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 8.7 PS_1 = preimage of soc(PS/π_alg) | n = 1; n = 2, L = ℚ_p; n = 3 | n = 1: PS/π_alg = 0, PS_1 = π_alg, cosocle dim 1 versus empty sum 0. n = 2: PS_1 = PS, length 2, cosocle C(w, s). n = 3: length 1 + 2d_L, cosocle of 2d_L summands | Cosocle stated for n ≥ 2 |
| 8.7 Hom(PS_1, π_alg) = 0 for n ≥ 2 | f iso on socle; f zero on socle | iso ⇒ PS_1 = π_alg ⊕ ker with ker ≠ 0 and ker ∩ soc = 0, a contradiction; zero ⇒ factors through ⊕C, but Hom(C, π_alg) = 0 | Holds; radical = π_alg |
| Source corrections, DING25 locators | lines 1861–1868, 1984, 1989, 1531, 1942, 1949, 1955 | (3.28) is a diagram; C(w(φ), s) at (3.32) and Rem. 3.17; π_alg(φ, λ) at 1531/1949/1955; w({1..i}) = I at 1942 | Locators corrected |
| 3.1 trace class / compact | c_0(J) → c_0(I), matrix (a_ij) | identity: sup_j \|a_ij\| = 1 for all i, not compact; diag(p^i): sup_j \|a_ij\| = p^(−i) → 0, compact in both senses and given by (p^i δ_ij) ∈ (⊕̂_I ∏_J O)[1/p] | Solid and classical compactness agree |
| 3.1 compact-type presentations | E; E^ℕ; ⊕_ℕE; c_0(ℕ, E) | E: identity transitions of rank 1. E^ℕ: projections of rank n, Fréchet compact type. ⊕E: inclusions of rank n, LS and LB compact type. c_0: identity not compact; not nuclear (RJRC22 Rem. 3.15, p. 16) | Three Checks added |
| 9.3 X_w, PS_1 ↪ π_(F_P) | n = 3, blocks (2, 1); P = B; P = G; n = 1 | Refinements {1, (12)}; labels {1}, {2} and {1, 2} for both; amalgam length 1 + 4d_L → 1 + 3d_L = 1 + #S. P = B: one refinement, π_(F_P) = PS_1. P = G: all w, π_(F_P) = π_1. n = 1: everything equals π_alg | Agrees with 9.2–9.4 counts (7 at d_L = 1) |
| 9.3 quiver non-example | Kronecker, (1, 0) versus (0, 1) | f_2·1 = 0·f_1 ⇒ f_2 = 0; f_2·0 = 1·f_1 ⇒ f_1 = 0 | Hom = 0; socle and multiplicities alone insufficient |
| 9.3 case (1) refinement choice | n = 3, I = {2}, i = 1 | w lists φ_2 first: w⁻¹({1}) = {2} | A suitable w exists |
| 2.4 orthonormal bases | d = 1, n = 1 | ‖x^k‖ = p^(−k); ‖p^(−k)x^k‖ = 1 | C^an(G_1) = c_0(ℕ) |
| 2.4 (1) with c_0(J, −) | G = 1; E² → E projection; x_n ↦ p^n x_n | G = 1: the sequence of (1) is the given sequence. A null (x_i) lifts to (x_i, 0). The non-strict map has dense non-closed image | Strictness needed (existing Check 3) |
| 2.4 (2) induction | complex in degrees a..b | B^a = 0, Z^a = H^a acyclic ⇒ B^(a+1) acyclic (between R^i(M^a) = 0 and R^(i+1)(Z^a) = 0) ⇒ Z^(a+1) acyclic | Holds |
| 2.5 degree one, tensor clause | B = E trivial, G_0 = ℤ_p, M = c_0(ℕ, ℚ_p) | P = C(ℤ_p, E), C = P/E. c_0(ℕ, P) = C(ℤ_p, c_0(ℕ, E)) coinduced. Mahler stage of ζ^a: (1) = 0, (2) = E, and the same for c_0(ℕ, −) of it | Holds; matches the 2.5 c_0 Check |
| 2.5 twisted module not admissible | B = C(G_0, E) | (B ⊗̂ C^an(G_n))^(G_n) = B^(G_n-an) ∋ 1, x, x², … (infinite-dimensional) versus B^(G_0) = E (dimension 1) | New Check |
| 2.3 (ii) flatness | p = 3, h = 1; p = 2, h = 1; d = 1 | s_1 = 3^(−1/2), needs e = 2 (ℚ_3(√3)); p = 2: κ = 2, s_1 = 2^(−1/2) ∈ (1/2, 1). Graded map k[u] → k[[u]] is flat | Route sound |
| 2.3 (v) Amice | d = 1, n = 0 and n = 1 | n = 0: v_p(a_k) − v_p(k!) → ∞ (analytic on ℤ_p); n = 1: ⌊k/p⌋! | Matches PadicFunctionalAnalysis §4.4 |
| 0.3 locally σ-analytic | L = ℚ_p(√p), χ = σ(x)^k; τ(x); N(z); L = ℚ_p; trivial representation | g_σ acts by k, g_τ by 0 ⇒ σ-analytic. τ(x): g_τ acts by 1, so not σ-analytic. N(z) = σ(z)τ(z) has ∂/∂τ(z) = σ(z) ≠ 0, so not σ-analytic. L = ℚ_p: every representation. Trivial: σ-analytic for every σ | Definition discriminates |
| 0.5 x̃ ∗ v = x·v | χ(a) = (1 + p)^a, x = 1 | λ(x̃ ∗ v) = d/dt λ(exp(tx)v) = log(1 + p)·λ(v) | Sign agrees with 0.4 (iv) |
| 4.2 (iii) integration | sl_2 with SL_2 and PGL_2; gl_2 Sym², x_α(t) | Weights ±ϖ ∈ ℤϖ lift; ∉ 2ℤϖ, so no rational 𝐓-action and no lift. Σ tⁿeⁿ/n! applied to e_2² gives e_2² + 2t e_1e_2 + t² e_1² = (e_2 + te_1)² | Lift and uniqueness consistent |
| 7.3 Check 2 | μ = (0, 2) and (1, 1), ρ = (1/2, −1/2) | (1/2, 3/2): pairing −1, simple; (3/2, 1/2): pairing 1, not simple | Corrected module named |
| 8.12 spanning | n = 2 | w = 1: w⁻¹({1}) = {1}; w = s: {2}; both summands hit | Holds |

## Ownership and overlaps

I searched by object with `roadmaps grep` over main and the open heads:
- flatness of D_r → D_(<r) (`D_(<`, `Lemma 4.8`);
- the solid trace-class notion;
- the several-variable fixed-level Amice criterion.

No other roadmap owns them. LocallyAnalyticDistributionsPartII §1.5 (open head) defines D_(<r) without flatness, and states Amice's theorem in d variables only for "some radius". VStackSheavesAndLisseCategories §VS2.2 hands the classical comparison to its consumer, which is this roadmap. So these statements stay here as parts of targets 2.3 and 3.1. The new citations (PadicFunctionalAnalysis §4.4, ReductiveGroups §§9C and 10A) are roadmaps on main. The overlap file lists only this roadmap's own pull request, with no dropped ids. Sections cited by other roadmaps (§§8.7, 9.3, 10.2, 3.10 and 4.2, by PadicHodgeParametersInLocallyAnalyticRepresentations and PadicFamiliesPartII) keep their numbers and content. 0.3 (v) was deleted; no other roadmap cites it (checked by grep).

## For the maintainer

- §§8.7, 9.3 and 10.2 keep their ids and statements. 9.3 gains one API bullet (PS_1(w(φ), h) ↪ π_(F_P) for refinements w), which consumers may cite.
- "Locally σ-analytic" and D_σ(G, E) are now defined in Layer 0 (§§0.3, 0.4 (vi), 0.5); 10.1 refers to them.
- No untrusted text contained instructions. No source text was copied; locators only.
