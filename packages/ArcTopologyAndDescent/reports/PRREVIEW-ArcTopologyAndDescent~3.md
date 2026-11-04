# Review of ArcTopologyAndDescent (pull request #1755 at faa84e8)

**Verdict:** accepted

Incremental re-review of the 21 lines changed since c9c8d83. The one blocking finding of the previous review (R01, ownership of the localized complete integral closure) is repaired: §9.7 now imports the object from its earlier owner and keeps only the noetherian comparison and the arc_t-equivalence. The gate passes, the dependency check reports no problem, and `Suggested.lean` is unchanged and elaborates with only its five `sorry` warnings. One P3 note. :robot: Independent AI review.

## R01 (P3) — Add a negative control for the noetherian hypothesis of §9.7

**Location.** `TauCetiRoadmap/ArcTopologyAndDescent/README.md:1245`: "Prove that A^tic equals the integral closure of A in A[1/t] when A is noetherian".

**Claim.** The Checks of §9.7 (lines 1252–1260) test the uniform-bound condition and the unequal-closure example, but none shows that the noetherian hypothesis of the comparison is needed, so a reader cannot tell it from an artefact of the Mathlib route.

**Witness.** B = k + t·k[t,x] (the B of the last Check), t regular. x ∈ B^tic with c = 1 since t·x^n ∈ B for every n. B[x] = k[t,x], and k[t,x]/B ≅ x·k[x] is killed by t·k[t,x], so it is an infinite-dimensional k-space: k[t,x] is not a finitely generated B-module and x is not integral over B. Hence B^tic ≠ B^+ for this nonnoetherian B.

**Repair.** Add one Check bullet to §9.7 stating this: for B = k + t·k[t,x], x lies in B^tic but is not integral over B, so the noetherian hypothesis of the comparison cannot be dropped. No Lean change.

## Previous findings

- R01 — repaired: README lines 26, 66–68, 1245–1247, 1264, 1294 and 1302 cite PerfectoidSpacesPartII §RA.2, target p-root-closure, for A^tic, its subalgebra laws and the integral-closure inclusion; §9.7 keeps only the noetherian comparison and the arc_t-equivalence.

## Verified sound

**Scope and gate.** Head `faa84e808a035cb3cfb5770232da8955d83ff9b5` confirmed; `git diff --stat c9c8d837..HEAD` touches only `TauCetiRoadmap/ArcTopologyAndDescent/README.md` (12 insertions, 9 deletions); the diff outside the folder against `origin/main` is empty; `Suggested.lean` is byte-identical to the head the previous review read. The worker's gate at this head passes every scanner, the dependency check and the targeted build. Re-ran the standalone dependency check, which returned exactly:

```text
depcheck: 204 roadmaps, 1647 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The five new edges are the PerfectoidSpacesPartII citations; PerfectoidSpacesPartII is at `merge-order/ORDER.txt:59`, this roadmap at line 93.

**The repair, resolved against the supplier.** PerfectoidSpacesPartII has no folder on main and no open pull request (the worker's `roadmaps resolve` lead at README line 26); it is a board design, `packages/PerfectoidSpacesPartII/design/README.md`, and its plan lists the target `PerfectoidSpacesPartII:RA.2/p-root-closure` (`design/plan.json:986`). The design's target statement (its README line 491) defines, for g ∈ R a nonzerodivisor with S = R[1/g], R^*_S = {s : ∃ m, g^m s^n ∈ R for all n ≥ 0} and states R^+_S ⊂ R^*_S. Its API (lines 515–517) names exactly the two declarations the README's supplier contract cites: `completeIntegralClosureAway` as a subalgebra of `Localization.Away g` with the predicate ∃ m ∀ n, g^m s^n ∈ R, and `integralClosure_le_completeIntegralClosureAway`. Its hypotheses section (line 497) confirms no prime, perfectoid or noetherian hypothesis on that constructor, as the README's contract line 68 says. The README's convention (x ∈ A^tic iff ∃ c ≥ 0 ∀ n ≥ 0, t^c x^n ∈ A) is the supplier's with R = A, g = t, m = c. Citing a design-stage roadmap earlier in the merge order is the brief's ordinary supplier relation and was the previous review's requested repair.

**Locators.** BM21 Example 6.20(4) is at BM21 lines 2213–2217 (printed p. 53): nonzerodivisor t, the uniform-exponent definition, subring, contains the integral closure, equals it for noetherian R, and R → R^tic is an arc_t-equivalence. The README's "lines 2213–2215" and the §9.7 text locator "line 2213" are exact; the previous locator 2207 was the example's header. BM21 Theorem 6.25 at line 2283 and its proof at 2298–2305 are unchanged from the previous round and were reread; the §9.10 statement still uses the weaker hypothesis B ⊆ A^tic justified in the previous review.

**Pinned declaration opened.** At Mathlib f6090c70, `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:26` defines `IsAlmostIntegral R s` as ∃ r ∈ R⁰, ∀ n, r • s^n ∈ range(algebraMap); line 31 defines `completeIntegralClosure` as the subalgebra of such elements; line 86 states `IsAlmostIntegral.isIntegral_of_nonZeroDivisors_le_comap` with hypotheses `[IsNoetherianRing R]` and `R⁰ ≤ S⁰.comap (algebraMap R S)`. The README's route in §9.7 (multiplier t^c, S = A[1/t]) fits: t^c ∈ A⁰ because t is a nonzerodivisor, and a nonzerodivisor a of A stays one in A[1/t] because a·x = 0 in A[1/t] gives t^m a x = 0 in A, hence x = 0. Together with the supplier's inclusion this gives A^tic = A^+ for noetherian A, as the §9.7 API bullet states. The two API bullets dropped from §9.7 (the membership criterion and bounded denominators of integral elements) are now the supplier's constructor and inclusion.

**Shape.** §9.7 is now a theorem subsection with two prose API facts, five Checks, a locator and a *Needs:* line naming the supplier target, the Mathlib theorem and §9.3; the Layer 9 Dependencies line lists the supplier. The Scope table row at line 26 and the new supplier subsection at lines 66–68 match the house shape (`From TauCetiRoadmap.<X>`). No process words, pull-request numbers or paths were added; the curly apostrophe in "Mathlib's" at line 1247 is cosmetic.

**Lean.** `lake env lean` on `TauCetiRoadmap/ArcTopologyAndDescent/Suggested.lean` from the worktree: five `declaration uses sorry` warnings (lines 61, 73, 95, 117, 128), nothing else. Elaborated a scratch copy with `#check @name` for nine of the ten declarations: types identical to the worker's signatures file, no lost binders; the tenth (`affinoid_artin_grothendieck_prime_to_residue`) is taken from that file, the module being unchanged. The module docstring's eleventh non-statable group still names the §9.10 excision with the small-limit-valued arc-sheaf carrier as the missing piece; the README's §9.10 hypothesis B ⊆ A^tic is unchanged. The one-tactic padding probes of the previous reviews are carried forward since no declaration changed.

**Sampled targets.** Of the fifteen seeded targets, §9.7 and §9.10 fall in the change and were rechecked above against BM21 lines 2213–2217 and 2283–2305. The other thirteen (§§1.3, 1.5, 1.6, 1.7, 2.7, 3.9, 3.10, 4.3, 4.7, 5.1, 6.6, 8.1, 9.1) are untouched by the diff and are carried from the first and second reviews, not freshly re-verified. The README flags no locator as unverified.

**Citations.** The worker's two Lean-name leads are supplier declarations resolved in the previous review (`Etale.artinSchreier_vanishing` in SchemeAndStackFoundations §2.11, `Topos.isQuasiseparated_iff_of_cover` in AdicSpacesPartII §R0.19.10); they are unchanged. Declared gaps: the four slugs and `needs` sentences are unchanged and still agree between the README and `packages/ArcTopologyAndDescent/design/plan.json`. Ownership against open pull requests named without files was not checked; against the board packages, the only competing owner of A^tic is now cited.

**Adversarial table.** Fresh rows for every changed statement, then the inherited rows, each citing the review that computed it.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Supplier contract (line 68): A^tic equals the supplier's `completeIntegralClosureAway` | A = Z, t = 2, x = 1/2; t a unit; A = 0 | both predicates read ∃ c ∀ n, 2^c·2^(−n) ∈ Z, false at n = c+1; t unit: A[1/t] = A so A^tic = A on both sides; zero ring: both 0 | same object as the supplier's, with R = A, g = t, m = c | none |
| §9.7 noetherian comparison via `isIntegral_of_nonZeroDivisors_le_comap` | A = Z, t = 2; A = k[t,tx,x²], t; H′ for S = A[1/t] | Z^tic = Z = Z^+ (supplier's own test); x = tx/t has t·x^n ∈ A (c = 1) and x² ∈ A, so x ∈ A^tic = A^+ = k[t,x]; a ∈ A⁰ and a·x = 0 in A[1/t] give t^m a x = 0, x = 0 | route valid at the pin's hypotheses | none |
| §9.7 noetherian hypothesis is needed | B = k + t·k[t,x], t | x ∈ B^tic (c = 1); k[t,x]/B ≅ x·k[x] infinite-dimensional, so x not integral over B; B^tic ≠ B^+ | hypothesis necessary; no Check records it | R01 (P3) |
| §9.7 arc_t-equivalence A → A^tic | V complete aic rank one, t ↦ pseudouniformizer; t ↦ unit | v(t^c x^n) ≥ 0 for all n forces v(x) ≥ −c·v(t)/n → v(x) ≥ 0 in the archimedean value group, so A[1/t] → Frac V restricts to A^tic → V; t a unit in V: A[1/t] → V already | restriction bijective on t-tests (BM21 line 2216) | none |
| §9.7 locator move 2207 → 2213 | BM21 lines 2207, 2213 | 2207 is "Example 6.20" header; 2213 opens item (4) with the nonzerodivisor hypothesis | exact | none |
| §9.10 *Needs:* and Scope row additions | supplier target; §9.10 hypothesis | §9.10 uses only membership in A^tic (∃ c ∀ n), which is the supplier's predicate; the §9.7 noetherian comparison is not used by §9.10 | edges correct, no cycle (depcheck 0) | none |
| §9.7 changed comparison and §9.10 weakened hypothesis (carried from the previous review) | A = B = k[t]; B = A[1/t]; t = 1; A = B = 0 | identity: inclusion true; localization: b = t⁻¹ fails at n = c+1; unit: B = A; zero ring: all rings 0 | boundary cases preserve the quantifiers | none |
| §9.7 monomial Check: integrality, bound, unequal closures (carried from the previous review) | j = 0..3, k = F₂, F₃; b = t·x^j, c = j; x with c = 0..3 | (t·x^j)^j = t^j x^(j²) ∈ A; t^j b^n = t^(j+n) x^(jn), j+n ≥ ⌈√(jn)⌉; x ∈ B^tic, x ∉ A^tic since n = (c+1)² needs c ≥ c+1 | B ⊆ A^tic, closures unequal | none |
| §9.10 integral-element bound, common-closure instance, projection kernel, integrality and special fibre (carried from the previous review) | A = k[t,tx,x²] ⊂ k[t,x]; z = (tb,0) | t·x^(2r), t·x^(2r+1) ∈ A so c = 1; u = tx ∈ A ∩ tB ∖ tA, κ = (0,u) ≠ 0, tκ = 0, κ² = 0; z^(c+1) = diag(t·t^c b^(c+1)) ∈ tA; A′[1/t] = B[1/t] | proof of the weakened theorem valid | none |
| §9.8 invariance (carried from the previous review) | t = 1; complete aic rank-one V | E_1 = 0; V^tic = V and E_t(V) = Λ[0] both sides | arc_t-equivalence input unchanged | none |
| §2.2 supplier comparison (carried from the previous review) | id on Spec F₂; empty source over Spec F₃; rank-two split | id: v = arc = true; empty: both false; split: arc true, v false | correct one-way comparison | none |
| Suggested.lean §9.6 and §9.10 docstring headlines (carried from the previous review) | X empty; X = Spec C_p; identity; monomial pair | 0; Λ[0]; identity square cartesian; pair has B ⊆ A^tic true and A^tic = B^tic false | missing carriers named, no stand-in | none |
| §0.1 aic predicate (carried from [the first review](PRREVIEW-ArcTopologyAndDescent~1.md)) | k algebraically closed; ℚ; F₂×F₃; zero ring | degree-0 polynomial excluded; T²−2 has no root in ℚ; roots componentwise; zero ring has root 0 | correct (BM21 line 922) | none |
| §0.5 prime-splitting square (carried from the first review) | V rank two, p middle prime; p = 0; p = m | p·V_p = p; quotient side identity for p = 0; localization side identity for p = m | correct (BM21 line 406) | none |
| §0.6 interval rings (carried from the first review) | [p,p]; [0,m]; {0,p,m} | (V/p)_p = κ(p); (V/0)_m = V; [0,p] = V_p, [p,m] = V/p | correct | none |
| §1.1 Checks 2–3 (carried from the first review) | k = F₂, F(X) = O(X); id,id on Z[0] | equalizer is the diagonal with 2 elements of 4; fibre of 0: Z→Z is Z ⊕ Z[−1], H¹ = Z | correct | none |
| §1.6 Check 3 (carried from the first review) | A_i = k[x], B_i = k[x,x⁻¹], x ↦ 1 | B_i ⊗ A_(i+1) = A_(i+1) ≠ B_(i+1); limit map identity, x = 0 never covered | explains §4.2's cartesian hypothesis | none |
| §1.7 subtrusive = v-cover (carried from the first review) | RYD10 Definition 2.2 (line 330), Theorem 2.8 (line 421), Corollary 2.9 (line 459) | quasi-compact f makes the constructible condition automatic; 2.9(ii) is valuation lifting | correct | none |
| §2.3 Milnor split, §2.5 universal injectivity (carried from the first review) | rank-two V, I = p, 0, A; A = B = V, M = V/(t²); k[ε]/ε² → k; k → 0 | V → V_p × V/p arc not v; class of 1 preserved or killed as stated; no tests for the zero ring | matches BM21 lines 390–423 | none |
| §2.7 Check 3 and `IsSchemeArcCover` (carried from the first review) | 8 subsets of {0,p,m}; id of Spec k; ∅ → Spec F_p; Spec Frac V → Spec V | inverse images open exactly for ∅, {0}, {0,p}, all; lift with e = id; no lift; closed point unreachable | matches BM21 Definition 1.2 | none |
| `arc_spectral_characterization`, `isSchemeArcCover_of_isLimit` (carried from the first review) | T = ∅; T = Spec V rank one; f = id; one-object I; non-limit cone of apex ∅ | vacuous; closed point not open and surjectivity fails; both sides true; ∅ → Spec k fails without the limit hypothesis | matches BM21 Definition 2.14, Proposition 2.19, Corollary 2.20 | none |
| §3.1, §3.6, §3.7, §3.8, §3.10 (carried from the first review) | D(Λ)^(≥0); F₂×F₃; lexicographic rank two on k(x,y); singleton and empty I; Propositions 3.30/3.32 | degree-dependent bounds; 6 elements, 2 components; three distinct contractions versus ≤ 2 points; stalk = F(A), F(0) terminal; cardinality max(card A, ℵ₀) | correct (BM21 lines 680, 826, 958, 977, 986) | none |
| §4.1, §4.3, §4.4, §4.5 (carried from the first review) | V field in W, p = 0; V rank two, W = κ(m); (1,0) in κ(p); interval chains; pW = W, p ⊊ ker, ker ⊆ p | pW = 0 contracts to m ≠ p without ker ⊆ p; residues 1 ≠ 0 exclude (1,0); strict extensions essential; three cases listed | correct with the added hypotheses (source issues recorded) | none |
| §5.1, §5.2 (carried from the first review) | Spec ℚ ⊔ Spec Z_(p) over Spec Z; A = {a}, B = {a,b}, C = {c}; A = ∅ | no finite subfamily lifts a p-adic test outside it; D = {b, a = c}; disjoint union | correct (BM21 lines 1404, 1443) | none |
| §7.3, §7.6, `IsPerfectFpScheme`, `QcqsPerfectFp`, `arcCover_iff_universallyEffectiveEpi` (carried from the first review) | rank 0/1; Λ = Z/4; aic V; ∅; F_p[ε]/ε²; F_p[t^(1/p^∞)]; p = 1, 0, 4; infinite ⊔ Spec F_p | Tor_i(Z/2,Z/2) = Z/2; p = p², Ω¹ flat; ε^p = 0 kills injectivity; p = 1, 0 force ∅, p = 4 admits Spec F₂; compactness excludes the infinite union | matches BM21 Proposition 5.12, lines 1831–1834, Theorem 5.17 | none |
| §8.1, §8.5, §8.8 (carried from the first review) | I = 0, A, (p) in Z → Z_p; rank-two V, f ∈ m ∖ p | datum iff A ≅ B; Z/p^n both sides; p ⊆ ⋂ f^n V kills p; fibre of F(U) → F(Û) equals fibre of F(A) → F(Â) | matches BM21 Definition 1.14, Example 6.8, Proposition 6.3, Corollary 6.10 | none |
| §9.2, §9.4, §9.9 (carried from the first review) | BM21 Example 6.15; t = 0, unit, field K; Proposition 6.24 | generic points ↔ rank-one t-maps; E_t = 0 in the boundary cases, E_t(K) = 0 ≠ RΓ(Spec K); diagonal immersion collapses the nerve | correct | none |
| §10.0, `IsTorsionEtaleSheaf`, `IsPrimePowerTorsionEtaleSheaf`, §10.1, §10.2, §10.5–10.7, `affinoid_artin_grothendieck` (carried from the first review) | n = 0; K⟨T⟩/(T²); zero sheaf; Z/6; ⊕ Z/ℓ^r; ℓ = 1, 0; (X,1) at X = 0; A = K, K×K, 0; C₂ with ℓ = 2 | values K, 0, nonzero square-zero; exponents; max = 1 and min = 0; H⁰ = F_ℓ, two copies, all zero; ‖2‖ = 1/2 fails the residue hypothesis | matches BM21 Theorem 7.3, Proposition 7.6, Lemma 7.8, Proposition 7.9 | none |
| §11.1, §11.4, §11.5, §12.2, §12.6, §12.7 (carried from the first review) | I = 0, A, (p); I = (2,3), (x,y); Z_p[p^(1/p^∞)]^; F_p × O_(C_p); CS24 Lemmas 2.2.2, 4.2.6 | ordinary arc; D(2), D(3) jointly cover; torsion F_p × 0 removed, R = O_(C_p); ϖ^p ∣ p; A_inf, A, A♭ | matches CS24 §2.2.1, Theorem 2.2.5, MAT22 Definition 5.17, BS22/GR24 | none |

## Not verifiable

- HUB96 remains settled as uncertified; no paywall was bypassed and no request was made. Nothing in this change cites it.
- The first review's limitation on the precise definitions of RYD10's E_qc, E_sep,qc and E_fin is carried forward; that declared contract is untouched by this change.
- PerfectoidSpacesPartII exists only as a board design (`packages/PerfectoidSpacesPartII/design/README.md`); its target was read there. No merged or open-pull-request version exists, and none is claimed.
- Ownership against open pull requests the brief names without files was not checked.

## Source issues

- **Error** in BM21 at Theorem 6.25, remark after the statement, printed p. 55 (BM21 line 2296; carried from the previous review): the source says integral maps of t-torsion-free rings with equal t-localizations have equal total integral closures; it should be the weaker inclusion B ⊆ A^tic, sufficient for the proof, because the monomial example of §9.7 has unequal closures; affects a stated result.
- **Error** in BM21 at Lemma 4.3, printed p. 25 (BM21 line 1040; carried from the first review): the source says pW is prime and contracts to p whenever pW ≠ W; it should also require ker(V → W) ⊆ p; affects a stated result.
- **Gap** in BM21 at Lemma 4.4, proof, printed p. 26 (BM21 line 1080; carried from the first review): the source says the cases pW = W and Lemma 4.3 suffice; it should add the case p strictly below the kernel, where both tensor terms vanish; affects the proof.
- **Misprint** in BM21 at Lemma 7.8, proof, printed p. 58 (BM21 line 2458; carried from the first review): the source says the minimum of the displayed absolute values is bounded below; it should be the maximum, since (X,1) has minimum zero at X = 0; affects nothing.
