# Red-team review of #1335 ArithmeticDynamics at 1921611 (pass b (claude))

**Verdict:** changes needed

No P1 finding. Two P2 findings (one generality mismatch between a named signature and its target, one ownership overlap with SchemeAndStackFoundations), and ten P3 findings (one wrong endpoint Check, one redundant sorry'd theorem, supplier-locator and reference defects).

## R01 (P2) — `linearSynchronizedIntersection` is stated over ℂ, target is over any characteristic-zero field

**Location.** `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` line 490: `theorem linearSynchronizedIntersection (a b c e x₀ y₀ : ℂ)`. `packages/ArithmeticDynamics/README.md` line 8814: "Let K have characteristic zero, f(X)=aX+b and g(X)=cX+e …"; line 8812: "The named signature is `linearSynchronizedIntersection`."

**Claim.** The Lean signature that the README declares to be the named signature of §6.45 proves only the ℂ case, while §6.45 and its consumer (the polynomial-lines DML target in §6.46, which works over a number field or finitely generated field) need the characteristic-zero statement. The README's own proof sketch (line 8818, "Reduce to the finitely generated characteristic-zero subfield … embed it in C") is the reduction step the Lean statement omits.

**Witness.** Lean line 490 fixes `ℂ`; README line 8814 quantifies over K of characteristic zero; §6.46 (line 8824 onward) applies §6.45 to lines over the base field of the DML statement, not over ℂ.

**Repair.** Change the Lean signature to `theorem linearSynchronizedIntersection {K : Type*} [Field K] [CharZero K] (a b c e x₀ y₀ : K) (ha : a ≠ 0) (hc : c ≠ 0) (hcommon : Set.Infinite {z : K | ∃ n : ℕ, (fun w => a * w + b)^[n] x₀ = z ∧ (fun w => c * w + e)^[n] y₀ = z}) : ∃ m : ℕ, 0 < m ∧ (fun w : K => a * w + b)^[m] = (fun w : K => c * w + e)^[m]`, keeping the ℂ embedding inside the proof as the README prescribes. Alternatively state §6.45 over ℂ and add the reduction as a separate target consumed by §6.46.

## R02 (P2) — §0.28 constructs geometric quotients and GIT that SchemeAndStackFoundations owns

**Location.** `packages/ArithmeticDynamics/README.md` line 1389: "construct Rat_d … its SL₂-action over ℤ, and the geometric quotient M_d over Spec ℤ. Prove affineness, relative dimension 2d−2 and the projective GIT compactification over ℚ".

**Claim.** The quotient predicates and the categorical/geometric quotient theory are already defined in SchemeAndStackFoundations §1.17 "Categorical and geometric quotients, and Artin's bootstrap" (main, `packages/SchemeAndStackFoundations/README.md` line 2600, `IsCategoricalQuotient`, `IsGeometricQuotient`). §0.28 neither cites that section nor lists SchemeAndStackFoundations beyond "Layer 0" and "Layer 5" in its supplier contracts (README lines 107, 149, 177), so the quotient construction, Hilbert–Mumford stability and the GIT compactification are redeveloped here without an owner contract. The targets that actually consume §0.28 (§0.29 line 1395 onward, §0.34, §0.40) use only the set quotient Rat_d(K)/PGL₂(K) and Milnor's coordinates (σ₁, σ₂).

**Witness.** README line 1389 (quoted above); SchemeAndStackFoundations README line 2600 defines the quotient predicates §0.28 would need; README line 1393 "a set quotient over K does not identify all twists with geometric K-points" concedes the scheme-level statement is not used downstream.

**Repair.** Either (a) add a supplier contract "From TauCetiRoadmap.SchemeAndStackFoundations — §1.17" consuming `IsGeometricQuotient` and state §0.28 as: "Given a geometric quotient `Rat_d → M_d` in the sense of SchemeAndStackFoundations §1.17, prove that `M_d(K̄) = Rat_d(K̄)/PGL₂(K̄)` and that (σ₁, σ₂) identifies M₂ with A²"; or (b) restrict §0.28 to the set quotient and Milnor coordinates (what §0.29/§0.34/§0.40 consume) and move "affineness, relative dimension 2d−2, projective GIT compactification, Hilbert–Mumford" to "Not in scope". In both cases add a References entry for "Silverman, Duke Math. J. 94 (1998)" (line 1389), which has none (References section lines 10376–10754 contain no 1998 Silverman entry).

## R03 (P3) — §3.4 endpoint check gives the wrong multiplicity pattern for z² − 3/4 at −1/2

**Location.** `packages/ArithmeticDynamics/README.md` line 3851: "r = 2, p = 0, B ≡ 2: the transform is [N = 1] + [N = 2], the multiplicity pattern of z² − 3/4 at −1/2."

**Claim.** At the fixed point −1/2 of z² − 3/4 the multiplier is −1, so a(k) = 1 for odd k and a(2) = ord(g² − z) = 3, i.e. B ≡ 3, not 2. The transform is then [N = 1] + (3 − 1)·[N = 2] = [N = 1] + 2·[N = 2], which is also what the roadmap itself computes elsewhere.

**Witness.** README line 4538: "g = −z + z², g² = z − 2z³ + z⁴, s = 3"; line 4823: "z² − 3/4 at −1/2 over ℚ: λ = −1, r = 2, B ≡ 3, so a(k) = 1 for odd k and 3 for even k"; line 4684: "`a*_{[−1/2:1]}(2)` = 2". Lines 4823 and 4684 contradict line 3851.

**Repair.** Replace line 3851 by: "r = 2, p = 0, B ≡ 3: the transform is [N = 1] + 2·[N = 2], the multiplicity pattern of z² − 3/4 at −1/2 (a(k) = 1 for odd k, 3 for even k; a*(2) = 2)."

## R04 (P3) — `tateLimit_double` is a sorry'd restatement of a proved example

**Location.** `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` line 195: `theorem tateLimit_double (x : ℝ) : tateLimit (fun y : ℝ ↦ 2 * y) id 2 x = x := sorry`.

**Claim.** The identical statement is proved at line 178 (`example (x : ℝ) : tateLimit (fun y : ℝ ↦ 2 * y) id 2 x = x := by …`). A sorry'd duplicate of a proved statement is a defect in the Suggested file (it counts as an open goal that is already closed).

**Witness.** Lean lines 178 and 195 have the same statement; line 178 closes by induction, line 195 is `sorry`.

**Repair.** Delete lines 194–196 (the docstring and `tateLimit_double`), or replace the `example` at line 178 by `theorem tateLimit_double … := by` with the existing proof and drop the sorry'd copy.

## R05 (P3) — `DiophantineApproximationAndTranscendence:DT.0/…` and `DT.2/…` slugs do not exist on main

**Location.** `packages/ArithmeticDynamics/README.md` line 1746: "`DiophantineApproximationAndTranscendence:DT.0/infinite-places-over`"; line 1804: "`DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`"; line 8820: "`DiophantineApproximationAndTranscendence:DT.2/s-unit-equation-finiteness`"; also the DT.0 slugs `mul-height-algebra-map`, `abs-mul-height-eq-of-minpoly-eq`, `northcott-absolute-height` in the Layer 1 Needs lines.

**Claim.** DiophantineApproximationAndTranscendence on main has no section, anchor or target named by any of these slugs. The corresponding targets are §0.2 (`prod_infinitePlace_comap_pow_mult`, `mulHeight_algebraMap`, `absMulHeight₁_eq_rpow`, `absMulHeight₁_eq_of_minpoly_eq`), §0.3 (`finite_setOf_absMulHeight₁_le`), and unit equations are in §2.3 "p-adic approximation and unit equations over ℚ" and §2.4 "Finite-rank multiplicative groups and recurrences". No supplier contract "From TauCetiRoadmap.DiophantineApproximationAndTranscendence" appears in lines 100–265.

**Witness.** `packages/DiophantineApproximationAndTranscendence/README.md` lines 227 (§0.2 heading), 259, 269, 289, 299 (the four named theorems), and the §2.3/§2.4 headings; `grep` for `infinite-places-over`, `s-unit-equation-finiteness` on that README returns nothing.

**Repair.** Add a contract "### From TauCetiRoadmap.DiophantineApproximationAndTranscendence — §0.2, §0.3, §2.3" listing the five named theorems and the two-variable unit-equation finiteness statement, and replace each slug by the section number and theorem name (e.g. "DiophantineApproximationAndTranscendence §0.2 `absMulHeight₁_eq_rpow`", "§2.3 unit equation in two variables").

## R06 (P3) — `SchemeAndStackFoundations:SF.0/…` and `HeightsRationalPointsAndObstructions:RP.0/…` slug citations do not match the suppliers

**Location.** `packages/ArithmeticDynamics/README.md` line 8425: "`SchemeAndStackFoundations:SF.0/spreading-out-models`", "`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`"; lines 8199, 8201, 8217: "`HeightsRationalPointsAndObstructions:RP.0/silverman-dominant-map-inequality`", "`RP.0/weil-height-machine`".

**Claim.** SchemeAndStackFoundations has no "SF.0" label; `spreading_out_models` is the target of its §0.9 "Limits of schemes, Noetherian approximation and spreading out" (main, line 841). The two RP.0 contracts in this README (lines 111, 115) are the Weil height machine and Néron–Tate heights; neither mentions "geometric height field" or a "Silverman dominant map inequality", so lines 8199–8217 and 8425 consume statements that no contract states.

**Witness.** `packages/SchemeAndStackFoundations/README.md` line 841 (`spreading_out_models` under §0.9); README lines 111–118 (RP.0 contracts) contain neither "dominant" nor "geometric height field".

**Repair.** Cite "SchemeAndStackFoundations §0.9 `spreading_out_models`" at line 8425. Add to the RP.0 contract block (lines 111–118) two further paragraphs stating exactly what is consumed: Silverman's height inequality for dominant rational maps (h_Y(F(P)) ≥ c·h_X(P) − C off a proper closed subset) and the geometric height field axioms for K(T); then replace the four slugs by those contract titles.

## R07 (P3) — ConformalMapping "milestone-l0"/"milestone-l4" anchors are not headings on main

**Location.** `packages/ArithmeticDynamics/README.md` line 189: "### From TauCetiRoadmap.ConformalMapping — milestone-l0--the-local-mapping-engine"; line 241: "… milestone-l4--analytic-continuation--the-reflection-principle"; line 2906: "ConformalMapping §milestone-l0--the-local-mapping-engine"; line 4161: "ConformalMapping §milestone-l4--…".

**Claim.** The ConformalMapping README on main has one "## Layers" section (line 93) with the layers as bullets; there are no headings whose anchors are `milestone-l0--the-local-mapping-engine` or `milestone-l4--analytic-continuation--the-reflection-principle`, so the contract headers and the two in-text citations point nowhere.

**Witness.** `packages/ConformalMapping/README.md` headings: lines 43, 68, 93, 139, 169, 200, 205 only.

**Repair.** Rename the contract headers to "From TauCetiRoadmap.ConformalMapping — Layers, L0 (Hurwitz and the local mapping engine)" and "— Layers, L4 (analytic continuation and the reflection principle)", and in lines 2906 and 4161 cite "ConformalMapping Layers, L0" / "L4".

## R08 (P3) — citation of a roadmap that does not exist

**Location.** `packages/ArithmeticDynamics/README.md` line 5502: "… `ζ_{a,r}` … (TropicalAndBerkovichArithmetic Layer 2)".

**Claim.** No roadmap named TropicalAndBerkovichArithmetic exists on main or in the merge order; the Berkovich line used by this roadmap is its own §2.2 (line 2179).

**Witness.** `ls packages/` on main contains no such directory; the merge-order file lists none.

**Repair.** Replace "(TropicalAndBerkovichArithmetic Layer 2)" by "([The Berkovich projective line](#22-…))" pointing at §2.2 "The native analytic projective line" (line 2175).

## R09 (P3) — two forward references across layers

**Location.** `packages/ArithmeticDynamics/README.md` line 3574 (§2.86 Needs): "[The power map z ↦ z^d on the projective line](#62-…)"; line 2004 (§1.19 Check `relCanonicalHeight_sq_add_t_zero`): "Over k(t) with its admissible absolute values"; the instance `ratFuncAdmissibleAbsValues` is first constructed at line 8092 (§6.6).

**Claim.** §2.86 depends on Layer 6 §6.2, and the §1.19 Check cannot be stated before §6.6 supplies the `AdmissibleAbsValues (RatFunc k)` instance. The "How to read the build" paragraph (line 741) acknowledges the first but not the second; CONTRIBUTING requires that within the build order a target's prerequisites precede it.

**Witness.** Lines 3574, 2004, 8092 as quoted.

**Repair.** Move §6.2 (the power map) and §6.6 (admissible absolute values on k(t)) into Layer 0 as §0.x targets (they depend only on Layer 0 and Mathlib), update the two Needs lines, and delete the sentence at line 741–742 about the Layer 6 power map.

## R10 (P3) — internal design slugs that resolve to no section

**Location.** `packages/ArithmeticDynamics/README.md` line 5306: "morton-rational-three-cycle-reduction"; line 4024 and 4404: "ArithmeticDynamics:Layer 3/rational-preperiodic-enumeration-over-Q"; lines 4074, 4084: "quadratic-parameter-ramification"; lines 5133, 5147: "analytic-dynatomic-identification"; line 3332: "zieve-rational-cycle-adapter"; line 4817: "germ-order-parabolic-iterate"; line 4726: "preperiodic-filter-correct" and "ED.0/bounded-height-enumeration"; lines 6836, 7342: "regular-tower-isomorphism"; lines 7471, 7732: "tree-automorphism-order", "quadratic-level-kummer-generation".

**Claim.** None of these slugs is a section title, anchor or named signature in this README; a reader cannot find the target being invoked. Every other cross-reference in the file uses a Markdown link to a section heading.

**Witness.** `grep -n "^### "` on the README lists no heading whose slug matches any of the strings above; `grep` for each string finds only the citing line(s).

**Repair.** Replace each slug by a Markdown link to the section that implements it (e.g. "morton-rational-three-cycle-reduction" → [Reduction excluding two rational 3-cycles](#388-…) (§3.88, line 5412); "ED.0/bounded-height-enumeration" → the ED.0 contract once added, see R12), or delete the slug when the sentence is self-contained.

## R11 (P3) — works cited in target bodies with no References entry

**Location.** `packages/ArithmeticDynamics/README.md` line 1389 "Silverman, Duke Math. J. 94 (1998)"; line 8209/8215 "Silverman, Moduli Spaces and Arithmetic Dynamics (2012) p.103"; line 2179 "Boucksom–Jonsson"; lines 2227, 5652 "Gubler"; lines 5488, 5494 "Gauthier"; lines 8179, 8185 "Benedetto–Ingram–Jones–Levy Theorem 4.1"; line 8391 "Altman–Kleiman", "van den Dries–Schmidt"; line 4891 "Washington"; lines 5129, 5137 "Bousch", "Buff–Tan"; line 9507 "[DF1, Theorem B]", "[DF2, Theorem D]"; line 9455 "Tate 1983".

**Claim.** The References section (lines 10376–10754) has no entry for any of these; the only Benedetto entries (lines 10470, 10548, 10722) are the AWS notes, the BIJMST survey and the function-field heights paper, not Benedetto–Ingram–Jones–Levy. README conventions require every cited source to carry a reference entry with a locator.

**Witness.** `grep -c` in lines 10376–10754 for "Levy", "Altman", "Dries", "Washington", "Bousch", "Buff", "Faber", "Tate", "Boucksom", "Gubler", "Gauthier", "Moduli Spaces and Arithmetic" returns 0 for each except "Levy" (1 hit, inside the BIJMST survey title, not the Duke 2014 paper).

**Repair.** Add References entries (author, title, journal/arXiv, year, page or theorem locator) for: Silverman, "The space of rational maps on P¹", Duke 94 (1998); Silverman, *Moduli Spaces and Arithmetic Dynamics*, CRM Monograph 30 (2012); Boucksom–Jonsson; Gubler; Gauthier; Benedetto–Ingram–Jones–Levy, Duke 163 (2014); Altman–Kleiman; van den Dries–Schmidt; Washington; Bousch (thesis 1992); Buff–Tan; DeMarco–Faber [DF1], [DF2]; Tate, "Variation of the canonical height of a point depending on a parameter", Amer. J. Math. 105 (1983). Where a work is only mentioned as background, delete the mention instead.

## R12 (P3) — ED.0 consumed without a contract; "explicit supplier gap" wording

**Location.** `packages/ArithmeticDynamics/README.md` line 29: "EffectiveDiophantineMethods, ED.0, ED.3 and ED.4, supplies certified height"; lines 4724, 4726: "ED.0/bounded-height-enumeration"; lines 5264, 5326, 5340, 5432: "explicit supplier gap".

**Claim.** The supplier contracts (lines 100–265) contain four ED.3 blocks and one ED.4 block but no ED.0 block, so the "certified bounded-height enumeration" that §3.40–§3.41 and the Layer 3 reduction targets consume has no stated interface. Separately, lines 5264–5432 describe an "explicit supplier gap" although no supplier gap is declared in the metadata or the Scope section; the phrase is process language referring to a state of the repository rather than to mathematics.

**Witness.** `grep -n "^### From TauCetiRoadmap.EffectiveDiophantineMethods"` returns only ED.3 (lines 119–131) and ED.4 (line 135); `grep -n "supplier gap"` returns only the four prose lines.

**Repair.** Add "### From TauCetiRoadmap.EffectiveDiophantineMethods — ED.0" stating: for a number field L, a rational D, a certified finite list S ⊆ L of all x with H_L(x) ≤ D (and the companion list for ℙ¹(L)), with the certificate predicate consumed by §3.40. Replace "explicit supplier gap" in the four lines by "explicit hypothesis" and name the hypothesis (Poonen's conjecture, or the Stoll/Zieve input) as the surrounding sentence already does.

## Adversarial mathematics pass

| Target | What was recomputed | Result |
|---|---|---|
| 0.x resultant conventions | `Polynomial.resultant`, `discr f = sylvesterDeriv.det · (−1)^{d(d−1)/2}`, `resultant_deriv`, `discr_C = 1` against the README's sign and leading-coefficient conventions | consistent with pinned Mathlib |
| 0.40 Milnor coordinates | σ-relations for the multipliers of the fixed points of a degree-2 map; identification M₂ ≅ A² | relations hold |
| 1.2–1.5 Tate limit | `tateLimit` as `limUnder atTop`; `tateLimit_elliptic_doubling` vs pinned TauCeti `Point.canonicalHeight` (`(2^n • P).naiveHeight / 4^n`) | definitions agree, including the 4ⁿ normalisation |
| 1.12 height bound constant | `logHeight_eval_ge` constant `−log(Nat.card ι'^{totalWeight K} · max(mulHeightBound q) 1) + N·logHeight x` | matches README's displayed constant |
| 2.5 Laplacian sign | Δ log⁺|T| = δ_G − δ_∞ (opposite to Baker–Rumely) applied consistently in §2.5, §2.7x, §4.1 | consistent throughout |
| 2.4x p-adic Cantor map | G(0,1) = −log p/(p−1) for the Cantor example | value correct |
| 3.4 Möbius transform | formula with r, p, B; endpoint z² − 3/4 | formula correct; endpoint wrong (R03) |
| 3.5/3.44/3.52 multiplicities | g = z² − z, g² = z − 2z³ + z⁴, a(2) = 3, a*(2) = 2 | correct |
| 3.1x discriminant recursion | `discr_iterate_sub_succ` sign and exponent pattern for degree 2 | correct |
| 3.46–3.49 genus formulas | g₀(n), g₁(n) of the dynatomic curves for n ≤ 6; Burnside necklace counts e₁..e₆ | all values correct |
| 3.48/3.51 golden ratio check | f³ for x² − x − 1 factors as (x⁴−x³−3x²+x+1)(x⁴−3x³+4x−1) | verified exactly (scratch script) |
| 3.57 Morton 4-cycle | Φ₄ degree 12; Washington's genus-2 curve input | consistent (reference missing, R11) |
| 3.81–3.88 Morton curve | parameter inverse, 3-cycle identity, rotation compatibility, trace invariance, E-numerator divisibility by H(t,·) | all identities hold over ℚ(t) (exact-fraction scratch script) |
| 3.6x Poonen parametrisations | fixed points c = 1/4 − ρ², 2-cycles c = −3/4 − σ², 3-cycles via τ | all three correct |
| 3.7x kneading / Stoll sequences | kneading sequences and Möbius quotients tabulated for small n | correct |
| 4.1x FRL energies | local mutual energies at good reduction and for the power map | values correct |
| 4.2–4.5 adelic pairing | Arakelov–Zhang pairing symmetry and non-negativity conventions (PST Prop 18) | consistent with cited statements |
| 5.x arboreal | Stoll's irreducibility criterion, Odoni's maximal order 2^{2ⁿ−1}, Jones's Kummer-generation degree formula | correct |
| 6.2 / 2.86 power map | G_{F,v} = log⁺|z|_v, µ = δ_{ζ_{0,1}} at finite v | correct |
| 6.11–6.14 Legendre family | A∘F_t = −F_{1−t}∘A and B∘F_t = F_{1/t}∘B, Jacobian form, multiplier trace formula | identities verified |
| 6.34/6.35/6.4 elliptic computations | explicit point heights and Lattès projections | correct |
| 6.45 linear synchronised DML | unit-equation reduction; Lean generality | mathematics correct; signature too narrow (R01) |
| 6.57–6.60 Lech–Cassels | embedding of a finitely generated field into ℚ_p with integral images | correct |
| 6.8x Call–Silverman specialisation | Theorems 1.1, 2.1, 3.1, 4.1, Corollary 1.1.1, Examples 1–3 | locators resolve (call-silverman-1993 lines 48–96, 154–182, 195) |
| 6.9x Ritt | `rittCommonIterate` hypotheses (degrees > 1, common iterate) | matches Ritt's theorem statement |

## Verified sound

- Lean declarations read: all 67 in `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` (15 definitions, 36 sorry'd theorems, 16 proved examples; 497 lines, single `import Mathlib` plus `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic`, no `set_option`, no sorry'd data, ≤2 examples per definition). Every Lean name appears in the README as a named signature.
- README targets read: 489 (all six layers plus Layer 0), 63 corrections, references.
- Pinned declarations checked against the pinned Mathlib and TauCeti checkouts: 459 of 459 resolve (scratch script plus direct grep for primed names).
- Cached-source locators verified: 21 (call-silverman-1993 Theorems 1.1/2.1/3.1/4.1, Corollary 1.1.1, Examples 1–3, §3–§4; ms95 Conjecture 1.1, Proposition 3.2, Corollary 3.3, Lemma 3.4, Theorem 4.1, displays (7)–(13) and (21); mcmullen-1987 Theorem 2.2, Corollary 2.3).
- Endpoint Checks and computations tested: about 150 (table above lists the groups).
- Sibling citations checked on main: SchemeAndStackFoundations (§0.3, §0.8, §0.9, §1.17, Layer 5), ModularCurves, NumberFieldArithmetic, AlgebraicCurves (Layers 6–8), FuchsianOrbifolds, ConformalMapping, HeightsAndUnits, ClassicalArithmeticCompletion, PDE, RestrictedPowerSeries §2.4, DiophantineApproximationAndTranscendence, TauCeti OnePoint/CanonicalHeight. All resolve except as recorded in R05–R08.
- Policy: `theorem` used throughout, no PR numbers, no "currently"/"recently" process language except the four lines in R12, metadata.toml consistent with the README title and suppliers.
- Depcheck gate:

```
depcheck: 2 roadmaps, 6 edges, 0 problem(s)
```

No UPWARD or CYCLE edges; ArithmeticDynamics is at merge-order position 143 and all cited suppliers are earlier.

## Not verifiable

- Supplier contracts RP.0, RP.4, RP.5 (HeightsRationalPointsAndObstructions), ED.0, ED.3, ED.4 (EffectiveDiophantineMethods), IG.2 (InverseGaloisAndArithmeticFundamentalGroups), and ArakelovGeometryAndAbelianHeights: none of these roadmaps is on main and no head is available locally, so the contract texts at README lines 107–265 could not be compared with the supplier's own statements. A declared supplier gap is not a finding.
- Possible duplication of Layer 4 §4.2–§4.5 (adelic intersection numbers, Siu's inequality, Yuan–Zhang equidistribution) with ArakelovGeometryAndAbelianHeights: cannot be assessed without that roadmap.
- §4.58 Check value (3√3/4π)·L(2,χ₋₃) for the Mahler-measure identity: not recomputed numerically (no CAS available in the sandbox); the identity is Smyth's and the citation is standard.
- Zieve (thesis) and Stoll (preprint) sources waived under the brief: their locators (lines 3332, 5264–5432 and the Layer 5 Stoll citations) were not opened.
- pst2012 Proposition 18(d) and the FRL/Fili energy normalisations beyond the cases listed in the table were checked for internal consistency only, not against the papers.
