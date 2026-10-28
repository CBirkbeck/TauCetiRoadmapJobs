<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1382#issuecomment-6393321010 -->
Review (claude) of cb3f4f5

Verdict: rejected

1. **F01** (P1) The package re-plans EllipticLegendreCharacterInterfaces and owns nothing

   - **Location.** `packages/EllipticCurvesPartII/README.md`:
     - line 3: "This Part II is the import index for the Legendre continuation of EllipticCurves";
     - line 9: "EllipticLegendreCharacterInterfaces LG.0–LG.5 is the single owner of all 37 equation-specific targets indexed here."
     - `Suggested.lean` lines 9–14 say the same.
   - **Claim.** An import index that restates the complete supplier contracts is a roadmap.
   - **Witness.** All 37 ELCI sections map one-to-one onto §§0.1–5.2 here, with the same witnesses: P=(4,3) at p=5, t=v=2, i=3 (ELCI lines 680, 684). `roadmaps grep --fixed EllipticCurvesPartII` finds no match. ErdosProgressionPowers cites ELCI directly (lines 484–498).
   - **Repair.** This package cannot be repaired by edits: deleting the restated targets leaves an empty roadmap. A human applies the merger proposed in `design/plan.json` `restructure`:
     - retire `EllipticCurvesPartII`: its README, `Suggested.lean` and metadata, and line 109 of `merge-order/ORDER.txt`;
     - keep ELCI as the sole owner of the Legendre targets;
     - carry R02–R07 to ELCI where they apply.

     A genuine extension of EllipticCurves under this identifier needs a new design with its own scope; see the duplication map below for the material another design expects here. Tested on the instance above: after retirement, ErdosProgressionPowers still resolves every citation, because it cites ELCI.

2. **F02** (P2) No headline is stated although seven are statable at the pins, and the docstring names the wrong missing carrier

   - **Location.** `packages/EllipticCurvesPartII/Suggested.lean`:
     - lines 16–18: "the conductor-divisibility theorem lacks the suppliers' native rational squareclass-character and all-prime elliptic-conductor interfaces";
     - lines 20–22: "ownership, rather than missing carriers, excludes them from this file."
   - **Claim.** A file with no statement is the right acceptance test, and the squareclass character is missing at the pins.
   - **Witness.** Seven headlines elaborate with `sorry` as the only warning (table below). ClassicalArithmeticCompletion §1.51 (main, line 1789) defines `squareclassCharacter` on the pinned `fundamentalDiscriminantChar` (Character.lean:34). Only the elliptic conductor is absent at the pins.
   - **Repair.**
     - Inside this package, none is possible without making it a second owner of ELCI's theorems (R01).
     - Under the merger, ELCI's `Suggested.lean`, which states these headlines, is the acceptance test.
     - Any surviving docstring names only the elliptic conductor as missing.
     - Tested: the probe statements elaborate at the pins.

3. **F03** (P2) gap:legendre-rational-local-units is compound, already provided, and duplicates ELCI's own gap

   - **Location.** README line 53: "What EllipticCurves must provide (gap:legendre-rational-local-units): For every rational elliptic Weierstrass curve and prime p, identify curve-level good reduction through a minimal model over ℚ_p, prove that good reduction makes j p-integral, and identify …"
   - **Claim.** EllipticCurves Layer 4 must supply this single contract.
   - **Witness.** It bundles three obligations, each already at the pin:
     - `Reduction.lean`: `minimal` (299), `HasGoodReduction` (323), `integralModel_c₄_eq` (139), `hasGoodReduction_iff_isElliptic_reduction` (328);
     - `PadicNumbers.lean:1063`: `Padic.valuation_ratCast`.

     ELCI's README line 51 declares the same obligation as `gap:rational-local-unit-reduction`.
   - **Repair.**
     - Delete the gap sentence and its `plan.json` entry; after R01 it has no consumer.
     - On ELCI, apply ELCI review F02: cite these Mathlib names and state the glue as its own proof step.
     - Tested on L₋₁ at p=3: j=1728, v₃(j)=3≥0, and both parameters are units.

4. **F04** (P2) Two headlines are narrowed, and their general forms are left to a later roadmap

   - **Location.**
     - README line 139: normalization "For an elliptic native curve F/ℚ".
     - Line 306: §3.1 "For a prime p≡3 mod 4".
     - Line 11: "Its §2.1 extends rational normalization to arbitrary fields … and the prime-field subgroup theorem to all odd finite fields; neither extension is a target of this index."
   - **Claim.** The ℚ and p≡3 mod 4 forms are the right generality.
   - **Witness.** At p=5, η=2, L₄(𝔽₅) has 8 points, and (2,1) has order 4 with 2·(2,1)=(0,0). The subgroup exists in 302 of 302 cases with p≡1 mod 4 and p<80. ErdosProgressionPowers is ORDER.txt line 263, after this roadmap (109).
   - **Repair.** On ELCI, per its review F03:
     - state normalization over fields with `(2 : K) ≠ 0`;
     - state the subgroup theorem over odd finite fields with η≠0 and η²≠1, halving (0,0) when −1 is a square;
     - keep ℚ and p≡3 mod 4 as Checks.
     - Tested on p=5, η=2.

5. **F05** (P3) Supplier citations point to design node ids, and one ownership statement is false

   - **Location.**
     - README lines 45–47 and every *Needs:* line: "EllipticLegendreCharacterInterfaces LG.0, the ordinary-model and invariant contracts".
     - Line 434: the model of MordellLawrenceVenkatesh §6.4 "flow[s] from the earlier LG.0 owner".
   - **Claim.** These citations resolve in ELCI, and MordellLawrenceVenkatesh consumes ELCI.
   - **Witness.** ELCI's package README has 0 matches for "LG." and 0 for slugs such as `split-cubic-crt`; it numbers its sections §§0.1–5.2. MordellLawrenceVenkatesh §6.4 (open head, line 2084) defines the model itself and never cites ELCI.
   - **Repair.** Moot after R01. Otherwise:
     - cite ELCI by README section;
     - state that MordellLawrenceVenkatesh §6.4 restates ELCI §0.1 and should be repointed (ELCI review F09).

6. **F06** (P3) Four sampled locators do not contain the statement as written, and one source cannot carry the roadmap alone

   - **Location.**
     - §0.5 (line 151): BS20 lines 552, 666.
     - §1.1 (line 180): BS20 line 526.
     - §2.4 (line 284): BS20 line 554.
     - §5.1 (line 402): BS20 lines 462–465.
     - §1.2 (line 194): BS20 line 560.
   - **Claim.** BS20 supports each statement at these lines.
   - **Witness.**
     - Line 554: one direction of halving, over 𝔽_p.
     - Lines 552, 666 use the 2-torsion points without enumerating them.
     - Line 526: units, not j-valuations.
     - Lines 464–465 call §5.1 well known (Koblitz).
     - The §1.2 converse is at 568–569.
   - **Repair.** On ELCI (its review F08):
     - add textbook locators for the full halving criterion, the 2-torsion enumeration and §5.1, recording Koblitz as `uncertified`;
     - repoint §1.2 to lines 568–569 and add Lemma 6.4 to the manifest locator.

7. **F07** (P3) gap:finite-field-native-twist-trace is sound but serves a target this roadmap does not own

   - **Location.** README line 55, `gap:finite-field-native-twist-trace` on EllipticCurves Layer 5.
   - **Claim.** This roadmap needs the generic trace comparison.
   - **Witness.** True for 241,286 (W, d) pairs over 𝔽₃–𝔽₁₁, a₁, a₃ ≠ 0 included; absent at the pins and on main. Its sole consumer, §5.2, is ELCI's, whose README declares no such gap. The Euler-polynomial clause restates the trace.
   - **Repair.** Drop it with the alias. If ELCI adopts the general normal-form statement (its review F03), ELCI owns it or declares this gap itself, with the trace identity as its only conclusion.

The mathematics in the README is correct. Every Check and worked example I recomputed holds, every library declaration it cites exists at the pins, and the dependency check is clean. The package fails on scope, and edits to its own files cannot fix that.

- It owns no target.
- Its 19 subsections restate the 37 targets of EllipticLegendreCharacterInterfaces (ELCI), one for one, with the same statements, routes and numerical witnesses.
- Its `Suggested.lean` states nothing, although its own docstring admits that all but one of the headlines can be stated.
- No roadmap consumes `EllipticCurvesPartII`.

If the duplicated targets are deleted, nothing is left. Keeping them means two owners for every object. The design's own `restructure` entry already proposes the remedy: retire the alias and keep ELCI as the sole owner. A human must apply that merger.

There are 7 findings, 4 of them blocking (R01–R04). R02–R07 are recorded so that the merger carries them into ELCI. R03, R04 and R06 repeat findings F02, F03 and F08 of the ELCI package review.

## Duplication map

The 19 subsections here against ELCI's package README (board head 8320d52):

| This package | ELCI sections |
| --- | --- |
| §0.1 | §§0.1, 0.4 |
| §0.2 | §§0.2, 0.5, 0.7 |
| §0.3 | §§0.3, 0.6 |
| §0.4 | §§0.8–0.9 |
| §0.5 | §§0.10–0.11 |
| §§1.1–1.3 | §§1.1–1.5 |
| §§2.1–2.4 | §§2.1–2.8 |
| §§3.1–3.3 | §§3.1–3.7 |
| §§4.1–4.2 | §§4.1–4.4 |
| §§5.1–5.2 | §§5.1–5.2 |

That is 37 of 37 ELCI sections.

- Shared witnesses: P=(4,3) at p=5, t=v=2, i=3; the off-curve control (4,4); (2,4) on L₋₁/𝔽₅; the conductors 12, 3, 24, 24.
- Both READMEs carry the title "elliptic curves, part ii" (line 1 of each).
- The board design `packages/ColemanPowerSeriesPartII/design/README.md` line 1228 sends supersingular finite-field material to the "grouped design EllipticCurvesPartII". This package contains none of it.
- The other owners of the coefficient model are MordellLawrenceVenkatesh §6.4 (later, ORDER.txt line 174) and ArithmeticDynamics §6.35 (later, line 268).
- Library objects that are consumed and correctly not restated:
  - Tau Ceti `quadraticTwistOf`, `μ`, `ker_μ_eq`, `normM_μ₀_eq_one`, `pointCount`, `frobeniusTrace` and `card_ker_nsmul_two`;
  - ClassicalArithmeticCompletion §1.51;
  - NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g.

## Headlines target by target

The docstring's claim, checked target by target. The Lean column was elaborated in a scratch probe with `lake env lean` from the content checkout, under a scratch namespace, with `legendre`/`scaledLegendre` defined as in ELCI's file.

| Target | Headline? | Statable at the pins | Lean form (elaborated) |
| --- | --- | --- | --- |
| §0.1, §0.2 models, invariants, twist identity | no: definitions and identities | yes | Proved outright: `legendre_Δ`, `legendre_c₄`, `scaledLegendre_Δ` by `simp; ring`; `(legendre lam).quadraticTwistOf 0 (-d/4) = scaledLegendre d lam` by `ext; simp; field_simp; ring` (padding if stated) |
| §0.3 six labels | no | yes | definition-level |
| §0.4 normalization | yes | yes | `∃ C d lam, d ≠ 0 ∧ lam ≠ 0 ∧ lam ≠ 1 ∧ C • E = scaledLegendre d lam` from `Nat.card (nsmulAddMonoidHom (α := E.toAffine.Point) 2).ker = 4`, over ℚ and over fields with `(2:K) ≠ 0` |
| §0.5 two-torsion list | no (Tau Ceti `card_ker_nsmul_two` has the count) | yes | — |
| §1.1 j-valuation | no (input) | yes | — |
| §1.2 good-prime units | yes | yes | `HasGoodReduction (PadicInt p) ((E.map (algebraMap ℚ (Padic p))).minimal (PadicInt p)) → padicValRat p lam = 0 ∧ padicValRat p (1 - lam) = 0` |
| §1.3 conductor divisibility | yes | **no**: no elliptic conductor in Mathlib or Tau Ceti (grep "conductor" in both elliptic-curve trees: none) | — |
| §§2.1–2.3 CRT and readings | no (constructions) | only by building the ordered equivalence | — |
| §2.4 halving | yes | yes | `(∃ Q, 2 • Q = Point.some x y hP) ↔ IsSquare x ∧ IsSquare (x - d) ∧ IsSquare (x - d * lam)` |
| §3.1 ℤ/2×ℤ/4 | yes | yes | `∃ f : (ZMod 2 × ZMod 4) →+ (legendre (η ^ 2)).toAffine.Point, Function.Injective f` |
| §3.2 minus-one half | no (input of §3.3) | yes | — |
| §3.3 exact count | yes | yes | `padicValNat 2 (legendre (-1 : ZMod p)).pointCount = 3` for `p % 8 = 5` |
| §§4.1–4.2 witness | borderline (ELCI review F04 calls it an input) | yes | `2 • P = Point.some (4*t^2) 0 hT ∧ addOrderOf P = 4` |
| §5.1 trace zero | yes | yes | `(scaledLegendre u (-1)).pointCount = p + 1 ∧ (scaledLegendre u (-1)).frobeniusTrace = 0` |
| §5.2 twist trace | yes | yes | `(scaledLegendre d lam).frobeniusTrace = quadraticChar (ZMod p) d * (legendre lam).frobeniusTrace` |

Result: 7 headlines are statable and none is stated (R02). One is not statable, and the docstring misnames its missing carrier.

## Adversarial table

| Statement | Instances tried | Values computed (statement / independent) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: twist (0,n) has D=−4n; Δ scales by D⁶ | n=−1/2, −2 on L_{1/2} | D=2, 8; D⁶·1 = 64, 262144 / README 2, 8, 262144 | holds | none |
| Conventions: count and trace on L₋₁/𝔽₅ | brute force | 8 points, a₅=−2 / README 8, −2 | holds | none |
| Conventions: zero ring | R=0 | Δ=0=1 is a unit; `IsElliptic` is `IsUnit Δ` (Weierstrass.lean:366) | holds | none |
| §0.1 Δ, c₄, j | λ=−1, 2, 1/2, 0, 1, 3, 1/3, −2 over ℚ; any ring (Lean) | (c₄,Δ,j)=(48,64,1728), (48,64,1728), (12,1,1728), (16,0,–), (16,0,–), (112,576,21952/9), (112/9,64/81,21952/9), (112,576,21952/9); the formulas give the same; Lean identities proved | holds | none |
| §0.1 characteristic two | 16=0 | Δ=0 for every λ | holds | none |
| §0.2 scaled model | (d,λ)=(2,1/2), (1,1/2), (0,1/2), (2,0), (2,1) | coefficients (0,−3,0,2,0) with Δ=64; Δ=1, 0, 0, 0; twist identity proved in Lean | holds | none |
| §0.3 tuple | λ=−1, 2, 1/2, 3, 0, 1 (totalized division) | (−1,−1,2,1/2,1/2,2); (2,1/2,−1,−1,2,1/2); (1/2,2,1/2,2,−1,−1); (3,1/3,−2,−1/2,3/2,2/3); (0,0,1,1,0,0); (1,1,0,0,0,0) | holds | none |
| §0.3 root orders | roots (0,1,3), all 6 orders | ratios 3, 1/3, −2, −1/2, 3/2, 2/3; scalars 1, 3, −1, 2, −2, −3 | holds | none |
| §0.3 reciprocal pairs, entries ≠0,1 | symbolic, λ≠0,1 | products equal 1; (λ−1)/λ=1 would force −1=0 | holds | none |
| §0.4 translation | roots (3,5,9) | d=2, λ=3, y²=x(x−2)(x−6) | holds | none |
| §0.4 generality | fields of characteristic ≠2 | the translation argument does not use ℚ | narrowed | R04 |
| §0.5 ordered points | (d,λ)=(1,−1), (2,1/2), (1,3) | (0,0),(1,0),(−1,0); (0,0),(2,0),(1,0); the three sum to O | holds | none |
| §1.1 alternatives | every λ=n/m, \|n\|≤60, m≤39, at p=3, 5, 7 | 0 failures; p=3: λ=3 gives (1,0,−2), 1/3 gives (−1,−1,−2), −2 gives (0,1,−2), −1 gives v₃(1728)=3; p=2, λ=1/2: v₂(j)=6≠2a=−2 | holds; p=2 shows the hypothesis is needed | none |
| §1.2 unit model | λ=3 at p=5 and p=3 | Δ=576≡1 mod 5, λ̄=3; v₃(576)=2, λ̄=0 | holds | none |
| §1.3 conductors | u=−1, 1, −2, 2, 3, −3, 6, −6 | 4, 1, 8, 8, 12, 3, 24, 24; odd parts 1 and 3; conductor of y²=x³−x is 32 | holds | none |
| §2.1 evaluation | X+2 at roots (0,1,−1); X(X−1) mod X(X−1)² | (2,3,1); a nonzero class with all evaluations 0 | holds | none |
| §2.2 reading | constant 2, d=1, λ=1/2 over ℚ | ([2],[2],[2]) ≠ 1 | holds | none |
| §2.3 root readings | 𝔽₅, d=1, λ=−1 | representatives (4,4,1), (1,2,2), (4,3,2); classes (1,1,1), (1,[2],[2]), (1,[2],[2]); products 1, 4, 4 | holds | none |
| §2.3 scale-two root | 𝔽₅, d=2, λ=3, root (1,0) | (1,4,4), all squares; symbolic (2t)², (2iv)², (4itv)² equal dλ, d(λ−1), d²λ(λ−1) | holds | none |
| §2.4 halving iff | every point, p∈{3,5,7,11,13}, all d, λ | 2982 points, 0 mismatches; 2·(2,4)=(0,0) on L₋₁/𝔽₅ | holds | none |
| §3.1 subgroup | all η, primes p≡3 mod 4 below 80 | 424/424; p=7, η=2: 8 points, (3,1) of order 4 doubling to (1,0); p=11: 16 points | holds | none |
| §3.1 generality | p≡1 mod 4 below 80 | 302/302; p=5, η=2: (2,1) of order 4 | narrowed | R04 |
| §3.2 point H | 𝔽₅, i=2, 3 | (2,4), (3,3) on the curve; 2H=(0,0); order 4; representatives 2 and 3 are nonsquares | holds | none |
| §3.3 count | 22 primes p≡5 mod 8 below 400 | p=5, 13, 29, 37 give 8, 8, 40, 40; all have v₂=3; no point of order 8 for p<120; p=3 gives 4 | holds | none |
| §4.1 witness | 𝔽₅ with (t,v,i)=(2,2,3), (2,2,2); all 256 tuples, p∈{5,13,17,29,37,41} | (4,3) and (3,4) on the curve; 256/256 on the curve, with 2P=(2λ,0) and order 4; printed (4,4) gives 1≠4 | holds | none |
| §4.2 slope | the two 𝔽₅ tuples | (r,s,r+s)=(4,2,1), (4,3,2); numerator/denominator (1,1), (1,3); slopes 1, 2; third representatives 3, 2, both nonsquares | holds | none |
| §5.1 trace zero | p=3, 7, 11, all u; 162 cases, p<200 | counts 4, 8, 12 (traces 0); 162/162; p=5, u=1 gives 8, trace −2 | holds | none |
| §5.2 twist trace | all d, λ with p≤13 | 266/266; also 68/68 at λ∈{0,1} (an unused hypothesis, P3 note); p=5, λ=3, d=1, 2, 4 give counts 4, 8, 4 | holds | none |
| gap: twist trace, general W | 𝔽₃, 𝔽₅ exhaustive; 𝔽₇, 𝔽₁₁ sampled | 241,286 pairs, 0 failures | holds | R07 |
| gap: rational-local units | Mathlib Reduction API | all three parts present at the pin | already provided | R03 |
| docstring: character missing | ClassicalArithmeticCompletion §1.51; Tau Ceti Character.lean:34 | defined on a pinned carrier | false | R02 |
| docstring: conductor missing | grep at both pins | no elliptic conductor | true | none |

## Verified sound

- **Sources (15 sampled targets; the author flagged none as unverified).** The page offset is +354 (PDF page 13 = p. 367).
  - Supported as written, with the adapters and algebra acknowledged as the author's: §§0.1, 0.2, 0.4, 1.2, 1.3, 2.1, 2.3, 3.1, 4.1, 4.2, 5.2. These are at BS20 lines 512–515, 526–546, 547–557, 655–662, 703–720 and 462–465.
  - Partly supported: §§0.5, 1.1, 2.4, 5.1 (R06).
  - The BS20 manifest entry checks out: DOI, publisher-open URL, and a sha256 that matches the cached text.
- **Library (31 declarations, all present at Mathlib 6b7abb3c and Tau Ceti a91d3aaf).**
  - Mathlib `Weierstrass.lean`: lines 76, 100, 104, 108, 112, 120, 131, 366, 388.
  - Mathlib `Affine/Basic.lean`: 149, 156.
  - Mathlib `NormalForms.lean:166`, `VariableChange.lean:246`, `FiniteAbelian/Basic.lean:134`.
  - Mathlib `QuadraticChar/Basic.lean`: 119, 213. `LegendreSymbol/Basic.lean:274`. `QuadraticReciprocity.lean:60`.
  - Tau Ceti `QuadraticTwist/Basic.lean:169`: the coefficients are (0, Da₂, 0, D²a₄, D³a₆) when a₁=a₃=0.
  - Tau Ceti `MordellWeil/XSubT.lean`: 276, 283, 297, 505, 558, 566, 794, 803, 961, 1023.
  - Tau Ceti `PointCount.lean`: 73, 80, 86 (needs finiteness and `IsElliptic`), 101, 109.
  - Tau Ceti `Affine/FinitePoint.lean:53`, `MordellWeil/TwoTorsion.lean:57`, `Affine/Point/VariableChange.lean:177`.
  - μ's corrected representative evaluates to f′(r) at its own root and to r−s at the others, as §2.3 says.
- **Cross-roadmap citations (all resolved).**
  - On main: ModularCurves §4C (line 1100) and §9E (line 2008); ClassicalArithmeticCompletion §1.51 (line 1789); EllipticCurves Layers 2–6 (lines 647, 683, 793, 1154, 1200).
  - At open heads: NeronModelsAndSemistableAbelianVarieties §5.3a (line 3209) and §5.3g (line 3356); ErdosProgressionPowers Layer 2 §2.1 and "Required Legendre-character interfaces"; MordellLawrenceVenkatesh §6.4.
  - On the board: ELCI's design is on board main, and its package README is at board head 8320d52. ELCI is line 108 of the merge order, before this roadmap.
  - `roadmaps resolve` finds nothing that exists nowhere.
- **Dependency check.** Output: `depcheck: 48 roadmaps, 538 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Shape.** 19 subsections, each with a *Needs:* line and at least 3 Checks (4, 3, 5, 3, 3, 3×12, 4, 3, 3, 3). Every layer ends with Examples and Dependencies. There is no LaTeX and no process word.
- **Elaboration.**
  - `lake env lean` on `packages/EllipticCurvesPartII/Suggested.lean` runs in 3.7 s with no messages. The file has zero declarations, so the binder audit and the one-tactic padding probe have nothing to check.
  - The scratch probe (10 sorried headlines plus 4 proved identities) gives 10 `sorry` warnings and one style-linter note.
- **Ownership against open pull requests.** `roadmaps grep` over the 352 open heads and main for Legendre models, normalization, halving, two-by-four torsion and twist traces finds the same model in three more places:
  - ELCI §0.1;
  - MordellLawrenceVenkatesh §6.4 (later, line 174);
  - ArithmeticDynamics §6.35 (later, line 268).

  It also finds the extensions in ErdosProgressionPowers §2.1, and the twist coefficient comparison over ℚ in EffectiveClassNumbers §2.3 (a different setting).

## Not verifiable

- Koblitz, the text BS20 cites for §5.1 (p. 41): paywalled, not read.
- No textbook source was fetched for the full halving criterion. Under R01 the repair is to retire the package, so I did not request one.
- I did not recheck the claim from ELCI's review that ComputationalNumberTheory §3.17 states a character-sum point count. No finding here depends on it.

## Source issues

- **Error** in BS20 at the proof of Lemma 6.6, p. 371: the source says the order-four point on the twist by 2 has a degree-six polynomial y-coordinate. That pair fails the curve equation, for example (4,4) at p=5, t=v=2, i=3; it lies on the curve in only 24 of 384 tested prime-field tuples. It should be y=8itv(t+iv), equivalently rs(r+s) with r=2t and s=2iv; the x-coordinate, the double and the third descent class are unchanged. Affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cb3f4f5", "job": "REV-PKG-EllipticCurvesPartII", "model": "opus", "worker": "fable-rev87"} -->
