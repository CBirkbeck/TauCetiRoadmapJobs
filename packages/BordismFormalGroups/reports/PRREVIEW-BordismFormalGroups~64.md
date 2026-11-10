# Review of BordismFormalGroups (pull request #1807 at 27be4b9)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/BordismFormalGroups/README.md` (3692 lines) and `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` (131 lines) at `27be4b9`. Since `8f64f53` the folder changed by 151 lines.

- **Gate.** The worker's gate passes every check, the targeted build included. My rerun differs only in `outside-folder=26`. Those 26 files are the README and `Suggested.lean` of the 13 sibling folders that the brief names as this pull request's own, so the count is not a finding. `git diff --stat origin/main...HEAD` shows no change outside the 14 folders.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2146 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Lean.** `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 75, 90 and 116) and nothing else.
- **Findings.** There are three, all P3; none is blocking.
  - R01: F6.3–F6.4 state their Bousfield-class identities and the chromatic fracture square with no locator.
  - R02: F1.5's route to Lazard's classification uses F3.2's standard law F_h.
  - R03: the spectra and finite localizations that F6.3 constructs have no Checks.

## Previous findings (review of 8f64f53)

| Id | Status | Evidence at 27be4b9 |
|---|---|---|
| R01 (P2), F1.5 drops commutativity | repaired | Conventions, lines 133–135: "Ravenel's formal group laws are commutative by definition (Definition A2.1.1(ii), p. 352), so a statement taken from his Appendix 2 is read with `FormalGroup.IsComm` on every law it mentions". F1.5 adds "Every law in this paragraph is commutative" (533–534) and "commutative" in the definitions, in Cartier's theorem, in the V-universality bullet and in the strict-isomorphism bullet (537–571). The new Check (602–611) has the noncommutative example X+Y+εXY^p. I checked both bracketings and the commutator, and the reduced-ring remark is at `ravenel-green` line 19855. |
| R02 (P3), three stale sentences | repaired | README 306–310: "Everything in this layer except F1.5's algebraic theory of p-typical laws and the height classification…". `Suggested.lean` 26–29: "F1.5's algebraic theory of `p`-typical laws … is a README target …, not a headline". README 1289–1291: "F1.5's p-typical theory, used by F3.1 and F3.2; F3.2 needs nothing from F2". |
| R03 (P3), sampled sections without locators | repaired | F4.3 (1408–1427) cites Hovey Proposition 1.3.4, p. 10, Proposition 1.4.4 and Lemma 1.4.6, p. 12, Theorem 1.4.7 and Proposition 1.4.8, p. 13 (`hovey-comodules` lines 501–520 and 593–637), and Ravenel Theorems 2.2.3, p. 50, and 4.4.1(i), p. 132. F6.5 (3147–3149, 3314–3315, 3325–3326) cites Clausen–Mathew Theorem 1.1, Kuhn Theorem 1.5, and Hovey–Sadofsky Lemma 2.1, Corollary 3.2 (p. 3581) and §4, inequality (4) (p. 3582); `hovey-sadofsky` lines 116, 128 and 153 match. F6.6 (3436–3443) and F6.7 (3592–3594) now say that these are this roadmap's own arguments. |

## R01 (P3) — F6.3–F6.4 state the Bousfield-class identities and the chromatic fracture square with no locator

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- line 2253: "`⟨Z⟩∧⟨K(j)⟩∈{0,⟨K(j)⟩}`";
- lines 2331–2332: "Use this to prove `⟨P(n)⟩=⟨K(n)⟩∨⟨P(n+1)⟩` and `⟨B(n)⟩=⟨K(n)⟩`";
- lines 2365–2366: "This proves `⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩=⟨v_n⁻¹BP⟩`";
- line 2846: "Prove K(i)∧K(j)≃0 for distinct finite heights";
- lines 3106–3107: "For every p-local spectrum X and n≥1 prove this square homotopy cartesian."

**Claim.**
- These are theorems with no source at the claim. Two of them are endpoints the roadmap names itself: Scope (line 47) lists "the Bousfield classes of the Johnson–Wilson theories", and the Summary (line 19) lists "the chromatic fracture square".
- The only nearby citation is Johnson–Wilson and Würgler, at line 2258, and it covers the homology comparison Λ_X, not the class identities. The References cite *Nilpotence and Periodicity* §7.3 only in a general clause.

**Witness.**
- `ravenel-orange` lines 3120–3128 give Theorem 7.3.2, p. 82, whose parts (a)–(f) are F6.3's identities:
  - (a) and (c): ⟨B(n)⟩=⟨K(n)⟩ and ⟨P(n)⟩=⟨K(n)⟩∨⟨P(n+1)⟩;
  - (b) and (d): ⟨v_n⁻¹BP⟩=⟨E(n)⟩=⋁⟨K(i)⟩;
  - (e): K(m)∧K(n) is contractible for m≠n;
  - (f): minimality.
- A grep of both Ravenel books for the fracture square finds nothing.

**Repair.**
- Add the locators at the claims:
  - line 2253: "(Ravenel, *Nilpotence and Periodicity*, Theorem 7.3.2(f), p. 82)";
  - line 2332: "(Theorem 7.3.2(c) and (a), p. 82)";
  - lines 2359 and 2366: "(Theorem 7.3.2(b) and (d), p. 82)";
  - line 2846: "(Theorem 7.3.2(e), p. 82)".
- List Theorem 7.3.2 in that book's References entry.
- For the fracture square, either cite a source whose number you have checked, or say at the claim that the two-step proof given at lines 3107–3110 is this roadmap's own argument, as F6.6–F6.7 now do. Hovey, *Bousfield localization functors and Hopkins' chromatic splitting conjecture* (1995), is a candidate source; I did not read it. The two steps are: the pullback is E(n)-local, then the map from X is an E(n)-equivalence after L_(n−1) and L_(K(n)).
- Tested: each cited part states the README's identity as written, and parts (a)–(f) all lie on printed p. 82 (`ravenel-orange` lines 3104–3128).

## R02 (P3) — F1.5's route to Lazard's classification uses F3.2's standard law F_h

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- lines 619–621: "isomorphic to Ravenel's standard law F_n of Definition A2.2.11, F3.2's height-n Honda law";
- lines 627–630: "seek the isomorphism in the form of a formal sum Σ^F t_i x^(p^i); the coefficient equations (A2.2.13) … begin with t₀·θ(v_h)=t₀^(p^h)".

Against these, line 581 says "nothing here uses F2 or F3", and lines 686–687 say "no section of F1 uses a later layer".

**Claim.**
- The displayed first equation is (A2.2.13) for the source law F_h, which is classified by v_h↦1 and v_i↦0 for i≠h.
- For an isomorphism between the two given laws F and G, the equation is wrong as written. Read as Ravenel's comparison with F_h, the route needs F3.2's definition two layers later.

**Witness.**
- `ravenel-green` lines 20798–20812: the proof sets F=F_n and equates the coefficients of x^(p^n) to get t₀θ(v_n)=t₀^(p^n).
- If F is classified by φ with φ(v_h)=a≠1, the x^(p^h) coefficient of Theorem A2.2.6's identity gives t₀θ(v_h)=a·t₀^(p^h) instead.

**Repair.** Replace the clause from "seek the isomorphism" to "has a root in k" with:

> for F and G classified by φ and θ, with φ(v_i)=θ(v_i)=0 for i<h, seek f:F→G with f⁻¹(x)=Σ^F t_i x^(p^i) and t₀ a unit (Lemma A2.1.26 allows t₀≠1); the coefficients of x^(p^(h+i)) in Theorem A2.2.6's identity give t₀·θ(v_h)=φ(v_h)·t₀^(p^h), then t_i·θ(v_h)^(p^i)+c_i=φ(v_h)·t_i^(p^h) with c_i depending on t₀,…,t_(i−1); each is separable because θ(v_h)≠0, so it has a root in k.

Alternatively, define the law classified by v_h↦1, v_i↦0 in F1.5 and let F3.2 consume it.

Tested: with φ(v_h)=1 the first form is Ravenel's (A2.2.13). For a≠1 it gives t₀^(p^h−1)=θ(v_h)/a, which is solvable over a separably closed k.

## R03 (P3) — The spectra and finite localizations that F6.3 constructs have no Checks

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- lines 2242–2245: "construct P(n) and B(n) … with P(0)=BP, P(n)=BP/(p,v₁,…,v_(n−1)), B(n)=v_n⁻¹P(n) for n≥1, and P(∞)=hocolim_nP(n)";
- lines 2735–2740: the telescopes T(n) and the finite localization L_n^f;
- lines 2787–2788: "Γ_k^fS=fib(S_(p)→L_(k−1)^fS)".

**Claim.**
- These are definitions without a Checks block. F6.3's only Checks (lines 2487, 2510 and 2561) test type, v_n self-maps and strong type.
- The most plausible wrong models are not excluded.

**Witness.**
- P(1) and the Eilenberg–MacLane spectrum H(BP_*/p) have the same π_*.
- K(1)∧H(BP_*/p)≃0, because it is an H𝔽_p-module and F3.3 checks K(1)∧H𝔽_p≃0.
- K(1)∧P(1)≠0, because ⟨P(1)⟩=⟨K(1)⟩∨⟨P(2)⟩.

**Repair.** Add three Checks blocks. Each bullet below is computed.

For P(n) and B(n):
- π_*B(1)=𝔽_p[v₁^(±1),v₂,…], while π_*K(1)=𝔽_p[v₁^(±1)]. So B(1) is not K(1), although ⟨B(1)⟩=⟨K(1)⟩.
- P(1) is not H(BP_*/p), as in the witness.
- π_*P(∞)=colim_n BP_*/I_n=𝔽_p in degree 0, consistent with P(∞)≃H𝔽_p.

For T(n) and L_n^f:
- T(0)=S_(p)[1/p] has π_*=ℚ in degree 0. So L_0^f is rationalization, and L_0^f(S/p)=0 since S/p has type 1.
- Replacing v by a power v^a leaves the telescope unchanged, because the sequence along v^a is cofinal in the one along v. This is the class independence the section claims.
- L_1^f kills the type-2 cofiber of a v₁ self-map of S/p, while L_1^f(S/p)≃v₁⁻¹S/p≠0 by the finite-source telescope comparison at line 2757.

For Γ_k^fS:
- Γ_0^fS=S_(p).
- Γ_1^fS=fib(S_(p)→S_(p)[1/p])≃Σ^(−1)S/p^∞, with π_(−1)=ℚ/ℤ_(p)≅ℤ/p^∞ and π_0=0. After the colimit this agrees with line 2801's BP∧D(M_a)≃Σ^(−1)BP/p^(a₀) at k=1 (|v₀|=0).
- Taking the cofiber instead of the fiber would put ℤ/p^∞ in degree 0.

## Verified sound

**Headline theorems.**
- From the Summary and Scope, stated in `Suggested.lean`:
  - Lazard's classification (F1.5), `nonempty_formalGroupIso_iff_height_eq`;
  - the homogeneous invariant primes of L (F5.3), `isPrime_and_invariant_iff_eq_heightIdeal`;
  - the Lubin–Tate universal deformation (F5.5), `lubinTate_universal_deformation`, with the one definition `IsStarIso`, which has a real body.
- Named in the docstring as not statable, each with its missing carrier: Quillen's theorem and π_*MO; L_E; the Conner–Floyd and graded Eilenberg–MacLane comparisons; the exact functor theorem; nilpotence; thick subcategories and periodicity; smashing, fracture and the K(n)-local completion; Tate vanishing; F6.6; F6.7.
- F1.5's p-typical theory is declared a target, not a headline. The pins have comodule algebras over bialgebras (`TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean`) but no comodules over a Hopf algebroid, which bears out the exact-functor exclusion.

**Lean form.**
- The file has `module`, `public import Mathlib` and four existing `TauCeti.*` modules. There is no `set_option`, no `variable` block and no sorry'd data, and it uses only `theorem`.
- `#check @name` on all four declarations, in one scratch file, matches the README binder for binder (lines 613–618, 1722–1731, 1833–1835, 1873–1883).
- One-tactic probe on a scratch copy:
  - `simp`: "made no progress" twice, unsolved goals on the third;
  - `rfl`: fails three times;
  - `aesop`: fails three times;
  - `infer_instance`: "type class instance expected" three times;
  - `exact?`, run alone so that it cannot use other probes: "could not close the goal" three times.
- None of the three theorems is padding.

**Pinned declarations opened.**
- Mathlib:
  - `FormalGroup` (`RingTheory/FormalGroup/Basic.lean`:57; fields: zero constant term, the two linear coefficients and associativity, with no commutativity);
  - `FormalGroup.IsComm` (75);
  - `IsAdicComplete` (`RingTheory/AdicCompletion/Basic.lean`:57, which extends `IsHausdorff`);
  - `IsIdempotentComplete` and its criteria (`CategoryTheory/Idempotents/Basic.lean`:64–185), with no triangulated splitting result.
- Tau Ceti, `RingTheory/FormalGroup/`:
  - `NSMul/Basic.lean`: `nsmulSeries` 93, `nsmulSeries_mul` 139, `nsmulHom` 195, `natCast_dvd_coeff_nsmulSeries` 310 (for k coprime to n, more general than the README's prime case), `exists_nsmulSeries_eq_of_prime` 327;
  - `Height/Basic.lean`: `exists_order_nsmulSeries_eq_pow` 180, `height` 200, `height_eq_top_iff` 205, `height_eq_natCast_iff` 211, `one_le_height` 228, `height_eq_one_iff` 237;
  - `Height/Ideal.lean`: `heightIdeal` 74 (the span of the coefficients of [p] below degree pⁿ), `heightIdeal_zero` 104, `heightIdeal_mono` 110, `heightIdeal_smul` 138, `heightIdeal_one` 190, `heightIdeal_eq_span` 195, `heightIdeal_eq_bot_iff_le_height` 218;
  - `Frobenius/Factorization.lean`: `existsUnique_iso_comp_iterateFrobeniusHom_of_order` 125, `exists_iso_comp_iterateFrobeniusHom` 139, `existsUnique_iso_comp_iterateFrobeniusHom_eq_nsmulHom_of_height_eq`;
  - `Obstruction.lean`: `exists_homogeneousComponent_homDefect_eq_smul_lazardCocycle`, `homogeneousComponent_homDefect_eq_smul_lazardCocycle` (the README's [p]_G(f)−f([p]_F) reading is the Lean `subst` order);
  - `LeadingDifference.lean`: `succ_le_order_sub_of_lt_height`;
  - `Logarithm/InfiniteHeight.lean`: `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`;
  - `Rigidity.lean`: `FormalGroupHom.eq_of_map_residue_eq` 186 and `FormalGroupIso.eq_of_map_residue_eq` 229 (local, 𝔪-adically Hausdorff, residue characteristic p, source of finite height);
  - `LazardRing/Basic.lean`: `formalGroup` 253, `lift` 311, `grading` 390;
  - `CoordinateChange/Lazard.lean`: `rightUnit` 130;
  - `CoordinateChange/HopfAlgebroid.lean`: `map_rightUnit_heightIdeal` 390;
  - `Hom.lean`: `FormalGroupHom` 137, `FormalGroupIso` 351.
- Tau Ceti `RingTheory/PowerSeries/Substitution.lean`: `order_subst`.
- All 36 F1.1 names exist in the modules the README names.
- Neither pin has a p-typical theory or a ⋆-isomorphism notion. `PowerSeries/Cartier.lean` is the residue-type Cartier operator.

**Cross-roadmap citations resolved at this head.**
- GeneralizedCohomology: G2.3 (844), G2.4 (877), G2.5 (935), G2.6 (1090), G2.7 (1122), G2.8 (1169), G2.9 (1235), G2.11 (1354), G3.1 (2267), G3.3 (2363), G3.4 (2403; "the actual cofiber of 1−shift on the wedge", used by F3.1), G3.8 (2585), G3.9 (2714), G4.3 (3189), G4.5 (3255), G5.1 (3660), G5.3 (3732), G5.4 (3785), G5.5 (3940), G5.7 (4585).
- The five G2.11 headings named by Scope's F6.5 mapping are at lines 1365, 1410, 1642, 1766 and 1829, and the A/B refinement categories are at 2126.
- AlgebraicTopology: Stage 5 item 5 (1456, Serre fibrations, with the cohomological Serre spectral sequence at 1555); Stage 8 items 3, 7 (2760, `compactManifoldFiniteCWType`), 8 (2784) and 10 (3072).
- CharacteristicClasses: C3.2 (1689) and `H*(BO(n);F2)=F2[w₁,…,w_n]` (1761).
- TopologicalKTheory: T2 item 5 (952), with ψᵏ(β_n)=kⁿβ_n (1000), and the Conventions' β=[L]−1 with L=O(−1) (255–257).
- On main:
  - ProfiniteCohomology: continuous carrier and cohomological dimension, items 8 and 10;
  - RepresentationTheory/SchurWeyl Layers 0 (309), 2 (340) and 5 (522);
  - CompactGroups Layers 1 (226) and 2 (248), with the circle Fourier engine (443);
  - DGAInfinity Layer 8 (520, matric and higher Massey products);
  - consumers EllipticCohomology E4.A (996) and SymplecticGeometry ConvexityToric T2.
- Every citation of a BordismFormalGroups id on main and at the open heads (F1–F6 and F6.1–F6.5) resolves at this head.

**Overlap and ownership.**
- The dropped anchor `#f65-local-group-actions-and-completion-comparisons` is cited on main by GeneralizedCohomology line 46, through a link pinned to commit `d525554`. This pull request's own GeneralizedCohomology no longer cites it, and Scope (96–126) maps F6.5's former items to G2.11. No change is needed.
- #1808 and #1854 change this folder. The description orders them "this pull request → #1808 → #1854".
- TangentialBordism (#942, `README.md` lines 76–77) still says it owns "the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes".
  - This roadmap is on main and cannot consume an open one, so it owns F2.2. Its Scope (74–83) gives TangentialBordism the one-line mapping.
  - The repair is TangentialBordism's, under its own review. The description says so.
- The same holds for HomotopySpheres' James construction and Toda brackets. HomotopySpheres is on the never-cite list.
- `roadmaps grep` for Cartier's theorem, p-typicalization, Araki, idempotent splitting, the James construction and Toda brackets found no other owner. The Cartier hits elsewhere are smoothness of group schemes; the idempotent hits are perfect complexes.
- GeneralAlgebraicKTheoryPartII §4.24 owns Kuhn's telescopic Tate vanishing. F6.5 owns the K(n)-local statement and cites Kuhn only as the stronger form (`kuhn-tate` lines 229–232).

**Sources read at the text, with their locators checked (printed pages).**
- `ravenel-green`:
  - Appendix 2: Definition A2.1.1 and the remark after it, p. 352 (19847–19856); Definition A2.1.17 (20159); Theorem A2.1.18, Proposition A2.1.20 and (A2.1.21), p. 358 (20167–20203); Definition A2.1.22, p. 359 (20229); (A2.1.24) (20294); Theorem A2.1.25 and Lemma A2.1.26, p. 360 (20299, 20326); Theorem A2.1.27, p. 361 (20395); (A2.2.1) and (A2.2.2), p. 363; Theorem A2.2.3 and (A2.2.4), p. 364 (20556–20571); Theorem A2.2.6, p. 365 (20682); Lemma A2.2.7, Definition A2.2.8 and Example A2.2.10, p. 366; Definition A2.2.11, Theorem A2.2.12 and (A2.2.13), p. 367 (20786–20817).
  - Chapter 4: Definition 4.1.1, p. 106; Lemma 4.1.4, p. 107; Theorem 4.1.12, p. 110; Lemma 4.1.13, p. 111; Lemma 4.1.15, p. 112; Theorems 4.1.18 and 4.1.19, p. 113; §4.2, pp. 116–118; Theorem 4.3.2 and its proof, pp. 120–121 (the j=1 case of line 6830 gives F5.1's η_R(v₂) congruence); Theorem 4.4.1, p. 132.
  - Chapters 1–3 and 6: Theorem 1.3.16, p. 17; §1.5, p. 33; Theorems 2.1.1 and 2.2.3, pp. 42 and 50; Theorem 3.1.1, pp. 61–62; Lemmas 3.1.3, 3.1.4, 3.1.6, 3.1.7 and 3.1.8 and Theorem 3.1.5, pp. 62–64; Corollary 3.1.10, p. 64; §3.1, p. 66; Theorem 6.2.10(ii), p. 204.
- `ravenel-orange`: Theorem 1.5.4, p. 9; Theorem 3.3.7, p. 33; Theorem 3.4.3, p. 37; §6.2, p. 63; Definition 6.2.3 and Theorem 6.2.4, pp. 64–65; Theorem 7.1.3, p. 76; Theorem 7.3.2, p. 82; Theorem 7.5.6, p. 87; (B.5.19), p. 182; Theorem B.6.2, p. 183.
- Other cached texts:
  - `hatcher-at`: Theorems 4L.12, 4L.13 and 4L.16, and the unnumbered theorem on p. 500 (21565);
  - `guillou-weibel`: Definition 6.1, Theorem 6.2, Proposition 6.4 and Theorem 6.5 (748–788);
  - `miller-cobordism`: Proposition 10.4, Theorem 11.2 (mod 2 only; the odd prime is Ravenel 3.1.1) and Theorems 12.1–12.4;
  - `quillen-fgl-bulletin`: Theorems 2, 3 and 4 (72, 110, 143);
  - `bokstedt-neeman`: Proposition 3.2 and Remark 3.3, pp. 221–222;
  - `hovey-comodules`: Propositions 1.3.4, 1.4.4 and 1.4.8, Lemma 1.4.6 and Theorem 1.4.7 (stated without grading);
  - `hovey-mstring`: Theorem 1.2, Corollary 1.6 and Theorem 1.7;
  - `hovey-sadofsky`: pp. 3580–3582;
  - `clausen-mathew`: Theorem 1.1 (21);
  - `kuhn-tate`: Theorem 1.5 (151);
  - `cdvn-toda`: Definitions 3.3 and 3.7;
  - `bauer-tmf`: 8.6 Lemma and 8.7 Corollary (921, 929);
  - `lubin-tate-1966`: p. 49 (⋆-isomorphisms), Proposition 1.1 (any ring R with R/J≅k), Proposition 2.4, Theorem 3.1, §3.2 and Proposition 3.3.

**Adversarial pass.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1. `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ against 𝔾ₘ over 𝔽̄_p | heights ⊤ and 1 | both sides false | — |
| 2. same | X+Y+uXY against 𝔾ₘ | x↦ux: u(X+Y+uXY)=uX+uY+(uX)(uY); [p]=u^(p−1)x^p, so height 1 | both sides true | — |
| 3. same, without `IsSepClosed` | 𝔾ₘ and a Galois twist over 𝔽_p | heights 1=1; X^p is p in one ℤ_p and pu, u≠1, in the other | right side true, left side false, so the hypothesis is needed (present) | — |
| 4. same, imperfect k | separable closure of 𝔽_p(t) | t₀^(p^h−1)=θ(v_h)/φ(v_h); derivative of each later equation is θ(v_h)^(p^i)≠0 | separable, roots in k, as A2.2.12 states | — |
| 5. F1.5 route | source with φ(v_h)=a≠1 | x^(p^h) coefficient: t₀θ(v_h)=a·t₀^(p^h), against the README's t₀θ(v_h)=t₀^(p^h) | the README's equation holds only for F_h (F3.2) | R02 |
| 6. `isPrime_and_invariant_iff_eq_heightIdeal` | I=⊥ | `heightIdeal p 0`=⊥ (Ideal.lean:104); L is a domain | true/true | — |
| 7. same | I=(4) | η_R(4)=4, invariant; 2·2∈I with 2∉I, not prime; (4)≠(p) | false/false | — |
| 8. same | I=(a₁₁) | XY coefficient of φ•F: a₁₁+2b₁; 2b₁∉(a₁₁)L[b] | false/false | — |
| 9. same, without homogeneity | I=(2,a₁₁−1) | L/I≅𝔽₂[x₂,…]; η_R(a₁₁−1)=a₁₁−1+2b₁∈IL[b] | an invariant prime outside the list, so `hI` is needed (present) | — |
| 10. same | I=⊤ | L/I_(p,n) is a nonzero 𝔽_p-algebra for n≥1; a chain of proper ideals has a proper union | false/false | — |
| 11. same | p=2, n=1 and 2 | [2]=2X+a₁₁X²+2a₁₂X³+⋯; `heightIdeal_one`=(2); (2,a₁₁) with L/(2,a₁₁)≅𝔽₂[x₂,…] | true/true | — |
| 12. `IsStarIso` | [1+p] on 𝔾ₘ over ℤ_p; x↦ux with u≡1 | (1+x)^(1+p)−1 reduces to x+x^p+x^(p+1)≠X; ux reduces to x | not ⋆; ⋆ | — |
| 13. `lubinTate_universal_deformation` | h=1 | `Fin 0`: θ is the structure map; G=X+Y+uXY with u≡1 has the unique ⋆-isomorphism x↦u⁻¹x from 𝔾ₘ | holds | — |
| 14. same | F₀=𝔾ₐ over 𝔽_p[ε] | X+Y+εC_(p^j): d_(p^j)=p=0 gives infinitely many classes, against p^(h−1) maps | `hF₀` (finite height) needed and present | — |
| 15. same | uniqueness of θ | (t)ⁿR[[t]] is finitely generated by monomials, so θ((t)ⁿ)⊆𝔪ⁿ; `IsAdicComplete` extends `IsHausdorff` | θ is determined by θ(t_i); h≥1 by `one_le_height` | — |
| 16. same | R=ℤ, k=𝔽_p; direction of e | Lubin–Tate Proposition 1.1 takes any R with R/J≅k; ⋆-isomorphisms are closed under inverses | holds | — |
| 17. F1.1 `nsmulSeries_mul`, `natCast_dvd_coeff_nsmulSeries` | noncommutative F; [p] mod p | power associativity gives [a]+[b]=[a+b]; [p] mod p is a series in x^p (A2.2.7) | holds | — |
| 18. F1.5 noncommutative Check | X+Y+εXY^p over 𝔽_p[ε]/(ε²) | both bracketings X+Y+Z+ε(XY^p+XZ^p+YZ^p); commutator ε(XY^p−X^pY)≠0 | correct | — |
| 19. F1.5 p-typicalization of 𝔾ₘ | p=3, p=2 | m_(p^i−1)=(−1)^(p^i+1)/p^i: ℓ₁=1/3 and v₁=1; ℓ₁=−1/2 and v₁=−1 | units, as height 1 requires | — |
| 20. F1.5 generators | n=1 | Araki v₁=(1−p^(p−1))·Hazewinkel v₁: −1 at p=2, −8≡1 (mod 3) at p=3 | congruent mod p (A2.2.3) | — |
| 21. F1.5 right unit | x^p coefficient of A2.2.6 | η_R(v₁)+p^p t₁=v₁+pt₁, so η_R(v₁)=(p−p^p)(ℓ₁+t₁) | agrees with A2.1.27(iv) | — |
| 22. F2.1 | K-theory law | u⁻¹((1+ux)(1+uy)−1)=x+y+uxy; restriction u⁻¹β=1, and the variant gives −1; inverse −x/(1+ux) | holds | — |
| 23. F2.2 | Poincaré series; d₂; Moore spectrum of ℤ/2^∞ | ∏(1−t^(2d))⁻¹(1+t^d)=∏(1−t^d)⁻¹; (1,2)↦(3,3); derived completion has π₁=ℤ₂ | holds | — |
| 24. F2.6 | R=MO_* | π₂H(MO_*)=𝔽₂x₂, against 0 for the ungraded model; MO_*(RP²) ranks 1, 1, 1 | holds | — |
| 25. F3.1 | p=2; S[1/2]∨S[1/2] | a₁₁+2m₁=0 gives v₁=2m₁=−a₁₁; e=(1+τ)/2 with e²=(2+2τ)/4=e; cofib e=(1−e)X∨Σ(1−e)X | holds | — |
| 26. F3.2 | n=1; v_n↦u | Araki with v₀=p=0: [p]=x^p, equal to (1+x)^p−1 over 𝔽_p; u·x^(pⁿ) has height n | holds | — |
| 27. F3.3 | p=3 | p−1=2 summands, |v₁|=4: ku_(3)=BP⟨1⟩∨Σ²BP⟨1⟩; (p−3)/2=0, so ko_(3)=BP⟨1⟩ in degrees 0, 4, 8 | holds | — |
| 28. F4.2 | ⟨2,η,2,η⟩ | 0∉⟨2,η,2⟩={η²}; degree Σ\|a_i\|+r−2 gives +1 at r=3 | no defining system | — |
| 29. F4.3 | BP_*/p | finitely presented, not projective (Hovey 1.3.4) | not dualizable | — |
| 30. F4.4 | fiber F of S_(p)→BP | π₀F is the image of π₁BP=0; F^(∧s) is (s−1)-connected | holds | — |
| 31. F4.5 | ⟨h₀,h₁,h₀⟩, ⟨h₁,h₀,h₁⟩ | value−h₁²=d[ξ₁ξ₂]; value−h₀h₂=d[ξ₁²ξ₂]+d[ξ₁⁵] (C(5,k) odd for k=0,1,4,5); Ext^(1,3)=0 | holds | — |
| 32. F4.6 | BP⟨1⟩₂; K(ℤ,3) at 2 | π_i≠0 for i=2+j(2p−2); H⁶=ℤ/2ι₃² and H₅=ℤ/2 | holds | — |
| 33. F5.4 | x+y+uxy; M=ℤ | ((1+ux)^p−1)/u≡u^(p−1)x^p, so v₁ is a unit; v₁=0 on ℤ/p | criterion holds; criterion fails | — |
| 34. F6.3 class identities | locator | orange Theorem 7.3.2(a)–(f), p. 82, states each of them; the README cites nothing | true statements, no locator | R01 |
| 35. F6.3 P(1) | H(BP_*/p) | same π_*; K(1)∧H(BP_*/p)=0, while K(1)∧P(1)≠0 | no Check excludes the wrong model | R03 |
| 36. F6.4 fracture square | n=1, X=S_(p), p odd | π₀: ℚ, ℤ_p and ℚ_p; π₁ of the corner is 0; π₀L₁S=ℚ×_(ℚ_p)ℤ_p=ℤ_(p) | true; no locator | R01 |
| 37. F6.5 | K(n) with C_p acting trivially; Hℤ | x^(pⁿ)=0 in K(n)^*[[x]]/(v_n x^(pⁿ)); Ĥ^(2k)(C_p;ℤ)=ℤ/p | holds | — |
| 38. F6.6 | χ=[2]; q=2 | mod 2 the leading term is v₁x² (A2.2.4, congruence A2.2.3); (Π−n)(Π+n)=Π²−n²=Π² | holds | — |

## Not verifiable

- **Settled as uncertified, cited by locator only, not read:**
  - Landweber 1976 (filtration theorem; Theorem 2.6);
  - Adams, *Lectures* (Lecture 4) and *Stable Homotopy* (Part III §7, consistent with `ravenel-green` line 6040);
  - Wilson II, Corollary 5.1 (consistent with `hovey-mstring` line 118);
  - Bousfield 1979 (§1, Theorem 6.6);
  - Hopkins–Smith (Theorems 3, 7 and 9);
  - Devinatz–Hopkins–Smith;
  - Quillen 1971; Thom 1954; Toda 1962; James 1955;
  - Johnson–Wilson; Würgler;
  - Symonds;
  - Hovey–Strickland (Proposition 7.10(e));
  - Greenlees–Sadofsky (Theorem 1.1, the number confirmed by `hovey-sadofsky` line 83);
  - Landweber–Ravenel–Stong.
- **Not read:**
  - Hovey 1995, offered in R01 only as a candidate for the fracture square;
  - Lurie's HTT and HA, which F6.5 consumes through G2.11.
- **Ownership against open pull requests** was checked with `roadmaps grep` on the objects named above, not exhaustively over all 438 heads.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says a_i is represented by [ξ_i] at p=2; it should be [ξ_(i+1)], since a₀=[ξ₁] (p. 62) and ξ_(i+1) has degree 2^(i+1)−1; affects nothing.
- **Misprint** in ravenel-green at Lemma A2.1.26, proof, p. 360: the source takes ζ a primitive p-th root of unity in h_q; it should be a primitive q-th root, as in (A2.1.21); affects nothing.
- **Misprint** in ravenel-green at Theorem A2.2.12, proof, p. 367: the source cites (A2.1.24) for the classifying map θ:V→K; it should cite Theorem A2.1.25; affects nothing.
- **Misprint** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source lists the invariant primes of L as I_n for 0<n≤∞; it should be 0≤n≤∞, since the zero ideal is invariant and prime; affects nothing.
- **Misprint** in ravenel-orange at Theorem B.6.2, p. 183: the source requires v_n injective on M/I_n for positive n only; it should include n=0, p injective on M; affects a stated result.
