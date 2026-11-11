# Review of GeometricFreyMazur (pull request #2130 at 50d3389)

**Verdict:** accepted

Incremental re-review of the 8 changed lines since 0e81d72 (README lines 9, 11, 59 and 63; `Suggested.lean` and `metadata.toml` unchanged). No finding remains. The previous finding is repaired. The repair introduces no new problem, and the gate passes. The acceptance is conditional on the nine declared supplier gaps listed under `## Verified sound`.

## Findings

None.

## Previous findings

- R01 — repaired: README line 59 now reads "§4.1 supplies formal cusp charts; §4.6, `stabilizersAndSmallLevels`, supplies the pointed automorphism groups μ₄ and μ₆ at j=1728 and j=0 and the finite local coarse chart; §§4.7–4.10 supply …". The Scope list at line 9 reads "4.1, 4.6–4.10".

## Verified sound

**Gate, dependency check, elaboration (rerun at 50d3389).**

```text
gate GeometricFreyMazur: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The worker's gate at this head also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. `lake env lean TauCetiRoadmap/GeometricFreyMazur/Suggested.lean` exits 0 with two warnings, both `declaration uses sorry` (lines 58 and 78). `git diff 0e81d72 HEAD -- Suggested.lean` is empty. On a scratch copy with `#check @gonality`, `#check @full_monodromy` and `#check @geometric_frey_mazur`, the elaborated types are identical to `signatures.md` and to the previous review: `gonality` keeps `[Field k] [Field K] [Algebra k K]`, and both theorems keep `IsAlgClosed k`, `CharZero k`, the tower `k → RatFunc k → K`, `FunctionField k K`, `IsElliptic`, the non-constant-j hypotheses and the `Nat.Prime p` bounds. No binder was lost, and nothing changed.

**The repair of R01 (ModularCurvesPartII §4.6).** I read ModularCurvesPartII at its open head (#913, through `roadmaps show`; the README line numbers below are the README's own). §4.6 is "Small-level stabilizers and coarse quotients" (line 1467). It states that the elliptic stabilizers are μ₄ and μ₆ at the special j-values, that the analytic coarse local chart is `U/Aut(E,level)` with a finite local chart U, and that the theorem is `stabilizersAndSmallLevels` (line 1477). The new contract entry says exactly this, and §0.3 (README line 221) uses no more: the order-4 and order-3 lifts and their Lie eigenvalues. I extracted every ModularCurvesPartII section named in a `*Needs:*` line mechanically. There are 18 distinct ones: 1.2, 1.3, 2.3, 3.9, 3.14, 4.1, 4.6, 4.7, 4.8, 4.10, 5.7, 5.13, 5.16, 6.1, 8.4, 8.5, 9.10 and 9.13. All 18 are now in the contract (line 59) and the Scope list (line 9). Every heading the contract range covers exists at that head: 1.2 (421), 1.3 (445), 2.3 (611), 3.9 (1150), 3.14 (1286), 4.1 (1357), 4.6 (1467), 4.7 (1489), 4.8 (1509), 4.9 (1534), 4.10 (1560), 5.7 (1770), 5.13 (1904), 5.16 (2001), 6.1 (2122), 8.4 (2506), 8.5 (2528), 9.10 (2809) and 9.13 (2869).

**The new SchemeAndStackFoundations §§4.11–4.12 contract (line 63) and the Scope sentence (line 11).**
- **Main (5fc1aa8).** §4.11 "Modifications and strict transforms" (line 5820) defines the strict transform along a modification with a chosen dense-open witness. Its blow-up case is `strictTransform_eq_blowup`. §4.12 (line 5915) states `modification_domination`: every modification of a Noetherian integral scheme is dominated by a U-admissible blow-up. §4.13 (line 5945) covers the regular normalization of curves and `bertini_smoothness`.
- **Open revision of SchemeAndStackFoundations (#1656, head a072c0d8, read twice).** It keeps the three headings (lines 6737, 6834 and 6864) and the declarations `strictTransform_eq_blowup`, `modification_domination`, `bertini_smoothness` and `isModification_fromNormalization_fromSpecStalk_genericPoint`. The overlap report lists no dropped id.
- **Wording.** "Modifications, strict transforms along them (blow-ups included) and domination of a modification by an admissible blow-up" matches both copies.
- **Coverage.** The SchemeAndStackFoundations sections named in `*Needs:*` lines are 0.8, 0.9, 0.11, 1.17, 3.5, 4.11, 4.12, 4.13, 5.2, 5.3, 5.9 and 5.10. §3.5 is contracted in the AlgebraicCurves paragraph (line 73), so every one now has an entry. Before this change, §§4.11–4.12 were consumed through the ranges "§§4.11–4.13" in the `*Needs:*` lines of §§10.3–10.5 (lines 1374, 1386 and 1400) and had no entry.
- **Supplier hypotheses.** The contract does not repeat them, but every consumer satisfies them. A determinant component of Z(p) is a connected normal projective surface, so it is Noetherian and integral, as `modification_domination` requires. Y = X ×_Z Z̃ is of finite type over a field, so the retained open immersion is quasi-compact, as the strict-transform constructors require. Hecke curves are integral, so the strict transform does not depend on the witness U.
- **Pinned carriers.** The modification class and the regular normalization are pinned Tau Ceti carriers, which SchemeAndStackFoundations §§4.11 and 4.13 record and extend. I opened them at 2fd255d9: `TauCeti.AlgebraicGeometry.IsModification` (`AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`, fields: proper, plus a dense open with dense preimage over which f is an isomorphism, with no integrality); `IsModification.birational` (:70); the instance `IsModification.comp` (`Composition.lean:75`); `isIso_of_isFinite` (`Finite.lean:53`); and `ker_blowupBaseChangeHom` and `ker_blowupMap` (`AlgebraicGeometry/Blowup/StrictTransform.lean:76`, :115). Citing them through the supplier section is the route those sections themselves give, and this README restates none of them.
- **Gap minimality.** `gap:cyclic-surface-resolution-and-contraction` (Hirzebruch–Jung resolution, the Bertini extension, Castelnuovo contraction and termination) still asks for nothing §§4.11–4.12 provide. At the pin, `TauCeti/FieldTheory/FunctionField/Consequences/Castelnuovo.lean` is the function-field file, not surface contraction.

**Seeded sample.** Of the 15 sampled targets, only §10.3 cites a changed passage: its `*Needs:*` line names SchemeAndStackFoundations §§4.11–4.13. I read it at BT16 lines 1464–1469, p. 742 (the page-743 marker is at line 1475). The source gives cyclic quotient singularities `(z,w) ↦ (ζz, ζ^a w)` with 0<a<n, n = 2 or 3 at CM points and n = p at singular bicusps, and a minimal resolution by a chain of smooth rational curves whose intersection form comes from the continued fraction of n/a. The source supports the target as written. The README's gcd(a,n)=1 is automatic, because n is prime. The other 14 targets are untouched text: §§1.2, 2.3, 3.2, 4.4, 5.5, 9.3 and 9.8 carry their rows from the previous review, and §§2.4, 3.6, 6.5, 7.1, 9.2 and 10.1 have new computed rows below. Their locators were not re-read this round.

**Adversarial table.** Rows marked "(r5)" are carried from the previous report (`PRREVIEW-GeometricFreyMazur_r5`) for statements this diff leaves untouched. Every other row was computed in this review, by hand or by a script in exact arithmetic.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Contract §4.6 → §0.3 (changed) | y²=x³+x; y²=x³+1 | j=1728·4a³/(4a³+27b²) gives 1728 and 0; [i]:(x,y)↦(−x,iy) pulls dx/y back to i·dx/y, and [i]² = (x,−y) = [−1]; (x,y)↦(ζ₃x,−y) has order 6 and eigenvalue −ζ₃=e^(−iπ/3); projective orders 2, 3 give p=7 orbits 336/2=168 and 336/3=112 | matches §4.6 (μ₄, μ₆) and §0.5 | none |
| §0.3 order-3 Check (consumer of §4.6) | t₀=[[0,1],[−1,−1]] | t₀²=[[−1,−1],[1,0]], t₀²+t₀+I=0, t₀³=I; the second root is −1−ω=ω², not −ω | holds | none |
| Contract §§4.11–4.12 → §10.3 (changed) | 1/n(1,a) for (n,a)=(2,1),(3,1),(3,2),(5,2),(5,4),(7,6),(7,3) | chains [2]; [3]; [2,2]; [3,2]; four 2s; six 2s; [3,2,2]; for a=p−1 (an A_(p−1) point) each point blow-up adds two curves and lowers the index by 2: p=5 needs 2 blow-ups and gives 4 curves, p=7 needs 3 and gives 6, p=11 needs 5 and gives 10 = p−1 | the resolution is a modification, an isomorphism off the finite singular set and an iterated admissible blow-up, so §4.11 strict transforms and §4.12 domination apply | none |
| §4.11 witness choice used by §10.3 | a Hecke curve H through a singular point, U = Z ∖ Sing | H is integral and Sing is finite, so H∩U is dense in H; the strict transform is the closure of H∩U for every dense-open witness | holds (reduced case of `strictTransform_independent_of_witness`) | none |
| §10.5 contraction Check (gap input) | C²=−2 with C·E=1, 2 | −2+1²=−1; −2+2²=2 | holds | none |
| §2.4 Check (sample) | p=7, γ=S=[[0,−1],[1,0]], σ=σ′=T=[[1,1],[0,1]], H = ± upper unipotents | TST ≡ [[1,0],[1,1]] mod 7; enumerated: not in S·H, not in H·S, in H·S·H | both H factors needed | none |
| §3.6 first Check (sample) | PGL₂(𝔽₇) | 336 elements; 6 fix 0 and ∞ (t↦at); 1 also fixes 1 | holds | none |
| §3.6 second Check (sample) | p=5, 13, 17, 29 with a=2, 5, 4, 12 | a² ≡ 4, 12, 16, 28 = p−1; with determinant matching, the scalar pair (v,λv) lies on positive-type T_m only if λ² ≡ m, so the least m is p−1, while the reflected type λ² ≡ −m gives m=1 | holds, including p ≡ 1 mod 8 | none |
| §6.5 (sample) | slot degrees (8), (8,0), (3,5,7), (1,2,3,4) | Σ_(i<j)(D_i+D_j) = 0, 8, 30, 30, against (n−1)ΣD_i = 0, 8, 30, 30; for T₁×{a} at p=7, Deg=2(2·3−2)=8 | holds | none |
| §7.1 Check (sample) | n=2, τ∘(g,g⁻¹) | (ξ₁,ξ₂)↦(gξ₂,g⁻¹ξ₁) fixes ξ iff ξ₁=gξ₂ (the second equation is equivalent), i.e. ξ∈Δ_g^(12); for n=1 only the special points remain | holds | none |
| §9.2 (sample) | y²=x³+x over k(t); h=af | [i]² = [−1], so [i] ∉ ℤ; deg(af)=a²·deg f: a=2, deg f=3 gives 12; a cyclic h=af with \|a\|≥2 has E[\|a\|]≅(ℤ/\|a\|)² in its kernel | holds | none |
| §10.1 (sample) | N=1, 2; genus 0, 1 | gon(ℙ¹)=1=g+1<2; elliptic gon 2=g+1=N fails gon<N and meets gon<N+1 | P_N=M_(N+1) is needed and sufficient | none |
| §10.3 Checks (sample) | 3/1, 3/2, p/(p−1), 2/1 | [3]; [2,2]; p−1 twos; [2] (self-intersection −2, not −1) | holds | none |
| `gonality` (r5) | k(t); k(s,t); K=k | finrank 1 gives 1; transcendence degree 2 gives 0; no transcendental f gives sInf ∅ = 0 | holds | none |
| `full_monodromy` / §9.6 (r5) | N=0, 1, 2; a constant curve | N ≤ 1 is vacuous; 7·227=1589 < 1600 < 1603=7·229; constant E has image {I} and is excluded by j ∉ k | holds | none |
| `geometric_frey_mazur` / §9.8 (r5) | W′=W, e=id; a quadratic twist | the identity isogeny; for the twist σf=−f, and −1≠1 on E[p] | holds | none |
| §0.4 (r5) | p=7 | 24 cusps per component; 3 same-line labels; stabilizer 336/48=7 | holds | none |
| §0.5 (r5) | p=7 | orbits 168, 112, 48 give stabilizers 2, 3, 7 | holds | none |
| §1.2 (r5) | p=7, 11, 101 | det U_p=1; U_p^p=(SU_p)³=−I to 10⁻¹²; y=1.725082, 3.240910, 32.123353 | holds | none |
| §1.2 direction Check (r5) | p=7 | r₂r₁ against U⁻¹: ≤ 7.0·10⁻¹⁶; against U: 4.056 | holds | none |
| §1.3 (r5) | seven primes up to 10007 | deformed trace/p² = 0.6839176 against 27/(4π²)=0.6839180 | holds | none |
| §1.4 (r5) | p=7 | 2 arcosh(23.5)=7.699389 < 4 log 7=7.783641 | holds | none |
| §1.7 (r5) | p=101 | U(p)L(−p)=[[1−p²,p],[−p,1]] is killed by γ_p | README's witness is needed | none |
| §2.1 (r5) | J, [[2,1],[1,1]], diag(2,1) | entrywise 1 against Frobenius 2; inverse heights 2, 2 | holds | none |
| §2.2 (r5) | [[2,1],[1,1]] | cosh d=7/2; h=2 ≤ √7 ≤ e^(2d)=46.98 | holds | none |
| §2.3 (r5) | midpoint argument; p=101 | exponent 4δ; M↦MU^k is free | holds | none |
| §2.5 (r5) | p=101, 1009, 10007 | d−2 log p = −0.0982, −0.0923, −0.0922 | two lifts | none |
| §2.6 (r5) | R=1 | 2 artanh√tanh(1/2)=1.657454 | holds | none |
| §3.2 (r5) | Gaussian; Eisenstein | 4 and 6 unit solutions | holds | none |
| §4.4 (r5) | p=7, d=1, R=1/2 | displacements 0, 0.980099, 1.645565, 1.961531 | holds | none |
| §5.1 (r5) | p=7 diagonal | Deg=8, vol=16π | holds | none |
| §5.5 (r5) | q=t², ε=0.01 | mass 2π/(−log ε)=1.364376 | holds | none |
| §5.6 (r5) | p=7, 11, 101 | g=3, 26, 40376; s=24, 60, 5100 | holds | none |
| §5.8 (r5) | p=7, 11, 101 | ratio 3p/(p−6)=21, 6.6, 3.189 | hypothesis needed | none |
| §7.2 / §7.3 (r5) | n=2, p=7 | bound 84; lcm 7 | holds | none |
| §7.4 (r5) | p=7, n=1 | K=4; D ≤ 2dK | holds | none |
| §8.2 (r5) | p=2, 3, 5, 7 | least proper indices 2, 3, 5, 7 | holds | none |
| §8.4 (r5) | 𝔽₅; p=3 | both sides [[0,3],[2,0]]; no map ℤ/3 → 𝔽₃^× | holds | none |
| §9.3 (r5) | h=af | deg 0, 3, 12 for a=0, 1, −2 | holds | none |
| Conventions (r5) | f=z² | mass 1, 2; 4 dx dy/(1−\|z\|²)² | holds | none |
| Supplier constant (r5) | index 1 | (21/100)(π/3)/(8π)=7/800 | holds | none |
| Point-ball example (r5) | line (z, az) | V/a = 1+a²(1−q)/(1−a²q), decreasing | holds | none |

**Ownership and overlaps.** The overlap report lists no other pull request that changes this folder, no dropped id, and no id that only an open revision defines. The closest open roadmaps (FuchsianOrbifoldsPartII, ModularCurvesPartII, CanonicalModelsAndGonality, ArithmeticDynamics, GroupActionsOnRiemannSurfaces) were compared by the previous review. The change adds no object of its own: it only adds supplier contract entries.

**Declared gaps.** The diff changes no `What … must provide` sentence. The nine slugs (`finite-group-quotient-analytification`, `analytic-cycle-current-transport`, `hyperbolic-cycle-volume-comparisons`, `relative-point-ball-volume`, `hyperbolic-trigonometry`, `free-locus-and-relative-cycle`, `curve-extension-and-normalization`, `cyclic-surface-resolution-and-contraction`, `surface-contraction-intersections`) stand as the previous review compared them. This acceptance is conditional on them.

**Remark on untouched text (no change requested).** The generated `merge-order` block of the description still says "It depends on no other author's open pull request". The author's own paragraph says that CanonicalModelsAndGonality, another author's roadmap, must merge first. The merge-order file still has no CanonicalModelsAndGonality line (searched; GeometricFreyMazur is line 311). This is an operator item, as the previous review said: regenerate the block once the merge order places that roadmap before this one.

## Not verifiable

- Sil09 Corollary III.9.4, cited in §9.2: the manifest records it as uncertified (paywalled). It is cited by locator alone and was not read.
- BLR90 §1.2 Proposition 8 and §1.4 Proposition 2: also uncertified, and not read.

## Source issues

- none
