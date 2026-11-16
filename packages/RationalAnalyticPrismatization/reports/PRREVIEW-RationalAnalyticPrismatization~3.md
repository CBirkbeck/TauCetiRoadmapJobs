# Review of RationalAnalyticPrismatization (pull request #2456 at 51abf5f)

**Verdict:** needs changes

## R01 (P3) — AnalyticStacks §0.11(ii) is cited for descent of D-properness, which it does not state

**Location** `TauCetiRoadmap/RationalAnalyticPrismatization/README.md:1673`: "π: BΠ^cont → GSpec(ℚ_p) is D-proper (AnalyticStacks §0.11(ii); HM Corollary 4.7.5(iii), p. 77, HM line 3890)". Line 70 has a matching clause: "and primness and D-properness descend along it (§0.11(ii); HM Lemma 4.7.4 and Corollary 4.7.5, …)".

**Claim** AnalyticStacks §0.11(ii) states only universal ∗- and !-descent. Descent of primness is in its §0.9. Descent of D-properness (HM Corollary 4.7.5(iii)) is not stated anywhere in AnalyticStacks. The repair of the previous R02 introduced this citation.

**Witness** AnalyticStacks README at dd5bc83, line 330: §0.11(ii) concludes only that "f is of universal ∗- and !-descent". Line 297 (§0.9) states HM Corollary 4.7.5(ii) and not (iii).

**Repair**
- Line 1673: replace the quoted sentence, from "As the composite" up to "HM line 3890).", with: "As the composite GSpec(ℚ_p) → BΠ^cont → GSpec(ℚ_p) is the identity, π: BΠ^cont → GSpec(ℚ_p) is D-prim by descent of primness along f (AnalyticStacks §0.9; HM Corollary 4.7.5(ii), p. 78, HM line 3895). It is D-proper because it is 1-truncated and its diagonal is D-proper: the base change of the diagonal along the !-cover f × f is the 0-truncated map Π^cont → GSpec(ℚ_p) of affinoids, and D-properness is local on the target (2.2; AnalyticStacks §0.10)."
- Line 70: replace "and prim descendable descent: … HM line 3858, HM line 3890)" with "and prim descendable descent: a D-prim map g with g_*1 descendable is of universal ∗- and !-descent (§0.11(ii); HM Lemma 4.7.4(i), HM line 3858), and a map f with f∘g D-prim is D-prim (§0.9; HM Corollary 4.7.5(ii), HM line 3895)".
- Line 1675: insert "AnalyticStacks §0.9; AnalyticStacks §0.10;" before "AnalyticStacks §0.11".
- Tested on Π = ℤ_p: π∘f = id is prim, so π is prim. The diagonal's base change is ℤ_p^cont → GSpec(ℚ_p), which is D-proper by 2.2. The 10.3 reuse still holds, because for G^la the same base change is G^la → GSpec(ℚ_p).

## Previous findings

- R01 — repaired: "0-primness asks for a linear right adjoint of pullback at every categorical level (0.3): on 1-sheaves, π_* ≅ π_! …; on 2-sheaves, descent of linear categories along f …; at the higher levels … 2-proper (0.4)". The 2.2 law now requires "a finite family of monomorphisms".
- R02 — repaired: the 10.2 *Needs:* line now has "AnalyticStacks §0.11; AnalyticStacks §0.12", and line 70 adds prim descendable descent and lists 10.2 under "Used in". Its citation of §0.11(ii) for HM Corollary 4.7.5(iii) is this report's R01.
- R03 — repaired: "One supplier, MotivesAndAlgebraicCyclesPartII, is not on main; it is a new roadmap in its own pull request, which merges before this one."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.2: 0-properness checked along a finite monomorphism !-cover | {A_1, A_2} of 12.2(3); f: GSpec(ℚ_p) → Bℤ_p^cont | Sieve limit over 3 subsets, finite. f ×_{Bℤ_p} f = ℤ_p^cont ≠ GSpec(ℚ_p): f is no monomorphism, so excluded | holds; HM line 3409–3415 |
| 2.2: D-properness checked on the source, with f_! commuting with the sieve's limits | finite closed affinoid cover of 12.4 | The sieve limit is finite and f_! is exact, so the hypothesis holds; this is HM 4.6.3(ii′), line 3752–3753 | holds |
| 10.2 route: π is 0-prim at levels m = 1, 2 and ≥ 3 | Π = ℤ_p; Π = 1; Π = ℤ/p | ℤ_p: π_* = fib(γ − 1), RΓ = ℚ_p ⊕ ℚ_p[−1], 2-sheaves are D(Bℤ_p^cont)-linear. Π = 1: π = id. ℤ/p: averaging retract | holds |
| 10.2 route: the diagonal of π is 0-proper | Π = ℤ_p | Base change along f × f: Bℤ_p^cont ×_{(Bℤ_p^cont)²} GSpec(ℚ_p) = ℤ_p^cont → GSpec(ℚ_p), a map of affinoids | holds |
| 10.2 route: π is D-proper, citing AnalyticStacks §0.11(ii) | AnalyticStacks at dd5bc83 | §0.11(ii) states descent only (line 330); Cor. 4.7.5(ii) is in §0.9 (line 297); (iii) is stated nowhere | wrong supplier (R01) |
| R01 repair | Π = ℤ_p; Π = 1 | π∘f = id is prim, so π is prim; the diagonal's base change is 0-truncated and 0-proper, hence D-proper; π is 1-truncated. Π = 1: identity | holds |
| 10.3: BG^la and BG^{≤r} are 0-proper for compact G | G = ℤ_p, r = 1/p; G = ℤ/p × ℤ_p; r = 1 | ℤ_p^la = GSpec(C^la(ℤ_p, ℚ_p)) is affinoid; G_{≤1/p} is p overconvergent discs; ℤ/p × ℤ_p: p copies of ℤ_p^la; r = 1 lies outside (0, 1) | holds; ALRS line 5170–5173 |
| 12.2(3): the base change of Div¹ → Bℤ_p^{×,la} | ℚ_p^× = p^ℤ × ℤ_p^× | GSpec(ℚ_p) ×_{BK} B(H × K) = BH, so the base change is X_cyc/p^ℤ = X_cyc/φ^ℤ | holds |
| 12.2(3): the two annuli meet none of their φ-translates | p = 2, s = 0.6; p = 3, s = 0.7 | p = 2: A_1 = [0.6, 0.697], A_2 = [0.697, 0.775], φA_1 = [0.36, 0.486], φ⁻¹A_1 = [0.775, 0.835]. p = 3: φA_1 = [0.343, 0.539] | disjoint; holds |
| 12.2(3): the action of φ on r = \|q − 1\| | q = 1 + x, \|x\| = r; point (1, −1, i, …) for p = 2 | \|q^p − 1\| = max(r/p, r^p) = r^p iff r > p^{−1/(p−1)}; at (1, −1, i, …), r = 0 and φ⁻² gives \|i − 1\| = 0.707 | covered; holds |
| 0.4: n-étale implies (n + 1)-proper, used at m ≥ 3 | n = 1 | Gest Proposition 6.21(ii), Gest line 2228, p. 58 | holds |
| Line 85: AnalyticStacks §0.12, (a) ⇒ (d) | the Čech nerve of the 0-affine map f | D((Π^cont)^n) = D(ℚ_p)^{⊗_{D(BΠ^cont)} (n+1)}, Künneth on the nerve; source RCSolid Proposition 6.3.7, RCSolid line 4146 | holds |

The rows for untouched statements stand as in the previous review, of 6d6b04a. That includes the seven headline theorems: none is statable, and `Suggested.lean` is unchanged.

- **Source locators checked against the text (31, all match).**
  - HM lines 3409 (p. 67), 3752 (p. 75), 3858 and 3890 (p. 77; part (iii) is on p. 78).
  - ALRS lines 4860, 4898–4900, 4906, 4957, 5072, 5150, 5169, 5824, 6907 (p. 127), 8745, 8785, 8938, 8952 and 8962 (p. 165).
  - ALBM line 1437 (p. 33).
  - Gest lines 1081, 2115, 2147, 2214, 2216, 2225, 2252, 2479, 2698, 2702 and 2753.
- **Seeded sample.** 0.4, 10.2 and 12.4 fall in the changed passages or depend on them, and were checked; 12.4's finite closed affinoid cover lies within the narrowed 2.2 law. The other twelve targets lie outside the change.
- **Cross-roadmap citations resolved.**
  - AnalyticStacks at #1687 (dd5bc83): §0.9 line 297, §0.10, §0.11 line 330, §0.12 line 342.
  - MotivesAndAlgebraicCyclesPartII Layer 0 at its new head 1fff774: §§0.3, 0.4 and 0.6 are present, and its line 1500 names this roadmap.
  - The one `roadmaps resolve` lead, `Huber.GelfandSpectrum`, is AdicSpacesPartIII §R3.9 on main.
- **Gate.** The worker's gate and my re-run both pass, every check 0. Depcheck: `depcheck: 263 roadmaps, 2570 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with no message. The file declares nothing, so the `#check` comparison and the one-tactic probe have nothing to test. No file outside the folder changes.
- **Previous remark repaired.** The previous remark on 2.2 is resolved: the law now carries HM's hypothesis that f_! commutes with the limits indexed by the sieve.
- **Pull-request text.** Checked against this head. The change touches only proof routes, *Needs:* lines and two contract lines; it adds or drops no section, headline or supplier, and no sentence of the description is contradicted.
- **Remark on untouched text (§8.1 Check, README line 1340).** The Check says "On X_cyc the divisor of q − 1 is empty". But X_cyc removes only the point (1, 1, …) (ALRS line 3028) and is φ-stable, so it contains (1, ζ_p, ζ_{p²}, …), where q − 1 vanishes.

Overlap check: read AnalyticStacks (its scope line 22, which excludes Gestalten, and §§0.9–0.12) and MotivesAndAlgebraicCyclesPartII (Layer 0) for the changed passages. Owners of the objects they share with this roadmap:
- prim descendable descent and descent of linear categories: AnalyticStacks §§0.9, 0.11 and 0.12, cited here;
- 0-properness of BΠ^cont, BG^la and Div¹ as Gestalten: this roadmap.

The other closest roadmaps stand as in the previous review.

Source independence: changed passages only. 6 passages compared with 3 sources:
- the two 2.2 laws, against HM lines 3409–3415 and 3752–3753;
- the new 10.2 route, against ALRS lines 4897–4900 and 6905–6908;
- the 10.3 sentence, against ALRS lines 5169–5173;
- the 12.2(3) route, against ALRS lines 8785–8786.

The longest shared run is 7 words and is forced: "generated by a finite family of monomorphisms", a hypothesis (HM line 3409). Largest share: ALRS, 863 of 1358 locators; this change adds 5 HM locators and no net ALRS locator. No layer was added, removed or reordered, so the contents comparison with ALRS stands: independent.

## Not verifiable

- none

## Source issues

- **Gap** in ALRS at Theorem 6.5.4(3), proof, p. 162: the source says 0-properness of Div¹ follows from (1), (2) and surjectivity of β, since 0-properness can be checked 0-proper-locally on the source; it should be justified by a locality result covering β, which is not a finite family of monomorphisms (HM Remark 4.4.11(iii)); affects the proof.
- **Misprint** in HM at Corollary 4.7.5, pp. 77–78: the source writes the composite Z → Y → X as gf in (i)–(ii) and as fg in (iii); it should use one order throughout; affects nothing.

## For the human reviewers

- Scope: the main sources are unrefereed. ALRS (863 of 1358 locators) is a 2026 preprint on an author page, and Gest is 2026 lecture notes on an author page. ABLB, RCSolid and Hauck are arXiv preprints. sources.toml records no published versions.
