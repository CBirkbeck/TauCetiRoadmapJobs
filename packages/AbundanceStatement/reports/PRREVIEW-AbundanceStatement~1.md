# Review of AbundanceStatement (pull request #545 at b042ecc)

**Verdict:** needs changes

The gate fails (no `Suggested.lean`), and the roadmap plans several theorems that SchemeAndStackFoundations on main already owns, without citing that roadmap at all. The mathematics itself held up under every instance I computed (table below). The findings, most important first.

## R01 (P1) — Gate fails: `TauCetiRoadmap/AbundanceStatement/Suggested.lean` does not exist

**Location.** The roadmap folder contains only `README.md`. The pull-request description says: "Markdown-only addition; no Lean source". README lines 377–384: "Suggested signatures, when added, must import the actual dependencies and explicitly distinguish incomplete constructions from the finished proposition."

**Claim.** A roadmap folder needs no acceptance test until later.

**Witness.** The worker's gate at b042ecc: `gate AbundanceStatement: missing-files=1 FAIL`, listing `TauCetiRoadmap/AbundanceStatement/Suggested.lean`. Every roadmap on main (for instance `TauCetiRoadmap/CFSGStatement/`, which the README cites as its model at line 16, and `TauCetiRoadmap/JacobianChallenge/`) carries a `Suggested.lean`.

**Repair.** Add `Suggested.lean` with `import Mathlib`, one module docstring ("Stating abundance for projective klt varieties: target signatures"), `namespace TauCetiRoadmap.AbundanceStatement`, and no `set_option`. Its docstring must say which headline statements are not statable at the pins and what each lacks. I checked the pins: Mathlib at `5e0c4e5` has no projectivity predicate for schemes or morphisms (`grep` of `Mathlib/AlgebraicGeometry` for `IsProjective`: nothing), no normality predicate for schemes, and no sheaf of relative Kähler differentials (`Mathlib/AlgebraicGeometry/` mentions Kähler differentials only in `Morphisms/Etale.lean` and `Morphisms/FormallyUnramified.lean`); neither Mathlib nor Tau Ceti at `a780c7a` has an ampleness or nefness predicate. So `AbundanceConjecture k`, its unfolding theorem, Kleiman's criterion and the Néron–Severi finiteness theorem are not statable, and the file must say so and state no stand-in. One Layer 1 milestone is statable at the pins and I tested it: with `import TauCeti.AlgebraicGeometry.Scheme.CodimensionOnePoint`, the statement "for an open immersion `f : U ⟶ X` such that every `x` outside the image of `f.base` has `2 ≤ coheight x`, there is an equivalence `CodimensionOnePoint U ≃ CodimensionOnePoint X` commuting with `f.base`" elaborates with `lake env lean` under the defaults, `sorry` the only warning (Stacks 0EBM's `Cl(U) = Cl(X)` remark). Whether to include it is the author's call; the deep headlines go in the docstring. Delete lines 377–384 from the README: they are process narrative about a file that must simply exist.

## R02 (P2) — Re-plans theorems that SchemeAndStackFoundations on main owns, and never cites SchemeAndStackFoundations

**Location.** README lines 97–99 ("Supply the implications needed for a normal finite-type integral `k`-scheme: Noetherianity, a DVR stalk at each codimension-one point, finite dimension, and `dim X = trdeg_k k(X)`"), 100–104 ("Prove that a normal variety is regular in codimension one. Over a perfect field, construct the open smooth locus and prove that it equals the regular locus"), 232–237 (identify the Euler-characteristic degree with the residue-weighted degree on a regular projective curve; degree laws), 238–244 (finite normalization of an integral projective curve is regular), 305–309 ("Supply the projective cohomology finiteness, Serre vanishing, Hilbert-polynomial intersection numbers"). The supplier table (lines 62–66) names JacobianChallenge, AlgebraicCurves and AlgebraicVectorBundles only.

**Claim.** These are this roadmap's targets.

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main (merge order line 2): §0.7 line 768–771 "This subsection owns the general locally finite-type dimension theorem; *dimensionTheory_abundanceSpecialization* identifies its integral finite-type specialization"; §4.13 lines 5653–5656 "AbundanceStatement Layer 0 / item 2 … states the normal-variety special case of *regularLocus_eq_smoothLocus*. This subsection owns the general finite-type perfect-field statement"; §4.13 lines 5670–5673 (`resolution_of_curves` owns finite-normalization regularity; "the supplier provides projectivity and characteristic-zero smoothness"); §4.13 lines 5676–5681 (`serre_normality_criterion` owns codimension-one regularity and DVR stalks); §3.3 lines 4728–4733 ("This subsection owns the arbitrary-field vector-bundle statements", degree of `O(D)` on a regular curve, Stacks 0AYY); §2.6 lines 3449–3452 (`ample_serre_vanishing`: "This subsection owns the general proper-Noetherian-base theorem"). JacobianChallenge Layer A (main, line 128–129) already plans "deg L := χ(L) − χ(O_X) (this equals Σ_x [κ(x):k]·ord_x …; prove agreement)".

**Repair.** Add `## Exact supplier contracts` with a `From TauCetiRoadmap.SchemeAndStackFoundations` subsection citing §0.7 (dimension theory), §4.13 (`regularLocus_eq_smoothLocus`, `resolution_of_curves`, `serre_normality_criterion`), §3.3 (degree of vector bundles and of `O(D)` on regular curves, pullback degree law) and §2.6 (`ample_serre_vanishing`, with cohomology finiteness from JacobianChallenge Layer B), and delete the restatements at lines 97–104, 232–237, 240–244 and 306–308. Keep here only what those sections leave to this roadmap: projectivity and characteristic-zero smoothness of `C^ν`, the comparison of orders with `Scheme.ord`, and the Nakai–Moishezon criterion in arbitrary dimension. Two more things belong in `## Scope and ownership`. First, SchemeAndStackFoundations §5.9–§5.10 (lines 7129–7273) own the surface carriers `Chow.NumericallyEquivalent` / `Num S` for smooth projective surfaces over algebraically closed fields of any characteristic, the positive-characteristic surface Nakai–Moishezon criterion, and the comparison `numericalQuotient_abundanceComparison`; this roadmap owns the arbitrary-dimension characteristic-zero `N^1(X)_ℝ`, `N_1(X)_ℝ`, Néron–Severi finiteness, Nakai–Moishezon and Kleiman, and must say so in one clause so that there is one owner per object. Second, SchemeAndStackFoundations lines 441–444, 7133–7137, 7215–7219 and 7240–7243 list "AbundanceStatement §4A / items 2–4", "§4B / items 1–2", "§4C / item 3", "§4D / item 1" and "Layer 0 / items 1–2" as *its* suppliers. Those rows cite a roadmap that will sit after AlgebraicCurves (merge order line 259), so they are upward citations on SchemeAndStackFoundations's side; repairing them is that roadmap's work, not this pull request's, and the dependency check does not report them today only because AbundanceStatement is not yet in the order. What this README must do is keep those item identifiers resolvable when it is restructured (or record the mapping from the old item numbers in `## Scope and ownership`), and it must not cite §5.9–§5.10 for the objects SchemeAndStackFoundations says it takes from here, which would close a cycle.

## R03 (P2) — Ampleness and global generation are planned here without naming their owner

**Location.** README lines 47–49 ("Classical ampleness theory, including Serre vanishing and the numerical criteria needed to prove Kleiman's criterion in Layer 4D, is included"); line 305 ("Use geometric ampleness, with its positive-power very-ample criterion, independently of the cones"); lines 335–343 (define global generation, stalkwise criterion, finite family on a quasi-compact scheme, invariance laws).

**Claim.** Ampleness and global generation of invertible sheaves are either available or built here.

**Witness.** Neither pin has them (R01). On main, `TauCetiRoadmap/StableReduction/README.md` Layer 2 (line 354 onward) builds "degree on components, global generation, and relative ampleness" and "the ampleness criterion for an invertible sheaf on a proper curve by positive degree", and SchemeAndStackFoundations §5.10 line 7239 defers to "StableReduction Layer 2's ampleness convention" ("some power is very ample", line 7247). StableReduction is on main and may be cited.

**Repair.** Cite StableReduction Layer 2 for the ampleness predicate and its positive-power very-ample convention and for global generation, in the supplier contracts, and turn lines 305 and 335–343 into consumption plus the arbitrary-dimension facts those layers do not supply (the finite-family criterion on a quasi-compact scheme, tensor and pullback laws), each with a locator (Stacks 01AM for the definition, which I verified: `stacks-01AM` line 192, Definition 17.4.1). If the author decides this roadmap is the owner of absolute ampleness on projective varieties, `## Scope and ownership` must say so and say how it differs from StableReduction's relative notion.

## R04 (P3) — The README is not in roadmap form: no supplier contracts, no `*Needs:*` lines, no Checks, no locator at any target

**Location.** Whole file. Headings are `## Scope and conventions` (19), `## Existing vocabulary and dependency contracts` (51), `## Layer k — …` (92, 116, 161, 195, 224, 330, 359), `## Acceptance instances and completion` (390). Layers are numbered item lists between `**Input:**` and `**Milestone:**` blocks. `grep -c 'Needs:'` and `grep -c 'Checks'` on the README both return 0.

**Claim.** The layers specify the targets fully.

**Witness.** No target carries a locator: the only locators in the file are in `## References` (lines 430–453). No definition (Q-Cartier divisor, line 144; canonical divisor `K_X(eta)`, 173; discrepancy, 200–204; klt, 214; intersection number `A . C`, 244; `N_1`, `N^1`, 257; `NE(X)`, 279; nef cone, 283; ample cone, 317; global generation, 335; semiample, 344; `AbundanceConjecture k`, 363) has a `**Checks.**` list, and none of the degenerate or negative instances I computed below is recorded as one. Compare `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §5.9–§5.10, whose every definition has `*Needs:*` and `**Checks.**` with values.

**Repair.** Rewrite in the house shape: `# Roadmap: …` with a `**Summary.**` paragraph; `## Scope and ownership`; `## Conventions` (the present lines 21–41 fit here); `## Exact supplier contracts` (`From Mathlib`, `From Tau Ceti`, `From TauCetiRoadmap.<X>`, with declarations by name and file at the pins); `## How to read the build`; `## Layer k: <title>` with `### k.n <topic>` prose, each theorem with its hypotheses and a locator in parentheses at the claim and a `*Needs:*` line, each definition with API bullets and at least three discriminating Checks, each layer ending with `### Examples` and `### Dependencies`; `## Downstream consumers`; `## References`. Checks worth recording, with the values I computed: the quadric cone `xy = z²` (discrepancy `0`, index `2`, gap `0 ≥ −1 + 1/2`) as a klt non-Gorenstein example; the cone over a plane cubic (exceptional discrepancy `−1`) as a non-klt control; `U = 𝔸² ∖ {x = 0}` (restriction kills `[x = 0]`) as the negative control for the codimension-two hypothesis; the fibre class `(1, 0)` on `ℙ¹ × ℙ¹` (`F² = 0`, `F · (0,1) = 1`) as nef-not-ample; the exceptional curve of a blown-up point (`E² = −1`) as not nef.

## R05 (P3) — LaTeX display blocks

**Location.** Lines 202–204 (` ```math a(E;Y/X)=\operatorname{coeff}_E(…) ``` `) and 371–376 (` ```math \forall X/k … \Longrightarrow \exists m\in\mathbb Z_{>0} … ``` `).

**Claim.** None; house style.

**Witness.** The repository's roadmap style is Unicode mathematics with ASCII in code spans and no LaTeX delimiters; the two blocks are the only `math` fences in the file.

**Repair.** Write `a(E; Y/X) = coeff_E(K_Y(ω) − f^*K_X(ω))` and the expansion of the conjecture as inline code spans or an indented code block.

## R06 (P3) — Pull-request numbers, process narrative and unpinned library links

**Location.** Lines 82–86 ("Follow the interfaces of Mathlib's #43273 …, #38472 …, and #38953"); lines 12–15 and 377–384 ("Proving the conjecture is outside this roadmap. In particular, the final proposition is not introduced as an axiom or as a theorem proved with `sorry`"; "Suggested signatures, when added, must …"); line 413 ("contain no `sorryAx`, invented mathematical axioms, or opaque stand-ins"); lines 56–58 and 69–76 link to `mathlib4/blob/master` and `TauCeti/blob/main`.

**Claim.** None; policy.

**Witness.** A roadmap cites Mathlib and Tau Ceti declarations by name and file at the pins, never by pull-request number or by a branch link; a reader a year from now cannot tell what #38472 was. `Scheme.ord` is already at the pin (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52), so "follow #43273" describes a done thing.

**Repair.** Replace lines 82–89 with the pinned declarations (`AlgebraicGeometry.Scheme.ord`, `AlgebraicCycle`, `IsWeilDivisor` and `weilDivisors` in `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` lines 44–108; `SchemeWeilDivisor` in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean` line 46 with `toAlgebraicCycle` and `equivFiniteCodimensionOneCycles`) in `From Mathlib` / `From Tau Ceti`; drop the `sorry`/`sorryAx` sentences (the README specifies mathematics; the Lean rules live in the repository's README).

## R07 (P3) — Supplier drift: a cited Tau Ceti file does not exist at the pin, and the general Weil-divisor sheaf already does

**Location.** Line 76 ("The existing Cartier/Weil sheaf comparison … `CartierDivisor/WeilComparison.lean` has dimension-one hypotheses"); lines 120–123 ("Extend the existing principal-divisor, restriction, linear-equivalence, and coefficient APIs to normal varieties in arbitrary dimension").

**Claim.** The comparison lives in that file; the existing divisor APIs are dimension-one.

**Witness.** At Tau Ceti `a780c7a`, `TauCeti/AlgebraicGeometry/CartierDivisor/` contains `Basic`, `LocalEquations`, `Picard`, `Sheaf`, `Transition` only. The Cartier–Weil comparison is `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Cartier/Basic.lean` and `Inverse.lean`, whose docstrings state "integral scheme of dimension at most one whose codimension-one local rings are discrete valuation rings" (so the substance of line 76 is right, the file is not). `WeilDivisor/Scheme/Sheaf.lean` builds `𝒪_X(D)` for every integral locally Noetherian `X` regular in codimension one, in any dimension, and `WeilDivisor/Scheme/Principal.lean` builds principal divisors on every Noetherian integral scheme; `WeilDivisor/Scheme/LinearEquivalence.lean` proves `𝒪_X(D) ≅ 𝒪_X(E)` iff `D ∼ E` for locally principal divisors on integral schemes. What is genuinely one-dimensional is Hartogs in `Scheme/Regular.lean` and the Cartier–Weil equivalence.

**Repair.** Cite the four files by name in `From Tau Ceti`; restate Layer 1 item 1 as consuming them and owning only the normal arbitrary-dimension Hartogs principle, Cartier-to-Weil injectivity and the `𝒪(D)` comparison (item 3, lines 139–143).

## R08 (P3) — Stacks locator for Cartier divisors points into the Exercises chapter

**Location.** Line 443: "[Cartier divisors](https://stacks.math.columbia.edu/tag/02AR)".

**Claim.** Tag 02AR is the Stacks Project's treatment of Cartier divisors.

**Witness.** `stacks-02AR` line 2098–2100: it resolves to `exercises.pdf`, Section 49 "Divisors", Definition 49.1 (02AR), a convenience list of definitions for exercises (Weil divisors, effective Cartier divisors, the sheaf `K_S`), not the Divisors chapter. The other three tags are right: `stacks-01WO` line 6 is the Divisors chapter, `stacks-01AM` line 192 is Definition 17.4.1 (generated by global sections), `stacks-0EBK` line 3226 is Section 31.30 "Weil divisors on normal schemes", whose Lemma 30.2 (0EBM, line 3250–3258) contains the `Cl(U) = Cl(X)` statement for a complement of codimension at least two that Layer 1 item 2 cites.

**Repair.** Cite the Divisors chapter's Cartier-divisor material (Section 31.13 Effective Cartier divisors and the sections on `K_X^*/O_X^*` that follow) and keep 0EBK for the normal-scheme statement. Record Kollár–Mori and Kleiman 1966 as `uncertified` (see Not verifiable).

## R09 (P3) — Order of the numerical-group comparison and the nefness predicate's domain

**Location.** Lines 257–262 (item 1 of 4B: "Relate these constructions to the integral and rational numerical groups and extension of scalars") before line 263 (item 2: finite generation); line 283–285 ("Define a Cartier or Q-Cartier divisor to be nef when its numerical class belongs to this cone"); line 363–367 (the proposition's hypotheses "the Layer 3 klt condition, and nefness of the Layer 2 canonical divisor").

**Claim.** Item 1's comparison is independent of item 2; nefness of `K_X` is meaningful as stated.

**Witness.** The identification of `(Cartier/≡) ⊗ ℝ` with real Cartier combinations modulo real numerical equivalence uses that `Cartier/≡` is finitely generated and torsion-free: `ℤ^ρ → Hom(Z_1(X), ℤ)` is injective and stays injective after `⊗ ℝ` because `ℝ` is a filtered colimit of finite free modules; without item 2 only the surjection is available. Nefness of a rational Weil divisor is defined only for Q-Cartier divisors, so in Lean the hypothesis "`K_X` nef" must take the Q-Gorenstein witness from the klt hypothesis (dependent hypotheses), or the nef predicate must be defined on rational Weil divisors as "Q-Cartier and nef".

**Repair.** Move the scalar-extension comparison after finite generation (or state it as a consequence in item 2), and say in Layer 6 and in Layer 4C item 2 which of the two spellings of `Nef` is used for a rational Weil divisor, with the instance `D = ½[∞]` on `ℙ¹` (`r = 2`, `A = [∞]`, `D · ℙ¹ = ½`) as its Check.

## Verified sound

**Gate and tooling.** Gate at b042ecc: `missing-files=1 FAIL` (R01), no other failing check. `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/AbundanceStatement`: empty. Dependency check (`gate --depcheck … --movable`):

```
NOT IN ORDER: AbundanceStatement (insert it after its last supplier)
depcheck: 156 roadmaps, 1066 edges, 1 problem(s)
```

No UPWARD or CYCLE line; "not in order" is not a defect at this stage. The citation resolver (`roadmaps resolve`) reports no cross-roadmap citation or Lean name found nowhere.

**Cross-roadmap citations resolved on main.** JacobianChallenge Layer A (`TauCetiRoadmap/JacobianChallenge/README.md` line 111, anchor `layer-a-line-bundles-divisors-picard-group-degree`) and Layer B (line 135): both exist and say what the table claims (invertible sheaves, Cartier/Weil divisors, `O(D)`, Picard classes, degree; finiteness of coherent cohomology for proper curves). AlgebraicCurves Layer 3 (line 475, divisors, `L(D)`, degree zero of principal divisors) and Layer 12 with sublayers 12A–12E (line 1085 onward: regular models, normalization of `ℙ¹_k` in `F`, divisors compared) and its `## Coordination` section (line 1333): exist. AlgebraicVectorBundles `## Layers` (line 211) with L0A–L0C (lines 215–269: tensor, duals, exterior powers, determinants, pullback comparisons): exist. CFSGStatement: exists on main. SchemeAndStackFoundations and StableReduction: on main, sections cited above by line.

**Library declarations opened at the pins** (Mathlib `5e0c4e5`, Tau Ceti `a780c7a`): `AlgebraicGeometry.Scheme.ord` (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52, with `ordHom` line 35, `ord_mul` 81, `ord_add` 107 under a DVR-stalk instance); `AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 44), `IsWeilDivisor` (87), `weilDivisors` (108), no principal divisors there; `Scheme.Hom.normalization` and `fromNormalization` integral (`Mathlib/AlgebraicGeometry/Normalization.lean` lines 123, 170, 196); `Scheme.Hom.smoothLocus` (`Morphisms/Smooth.lean` line 303); `Birational`, `BirationalOver`, `PartialIso` (`Birational/Birational.lean` lines 39, 181, 203); `IsProper` (`Morphisms/Proper.lean` 42), `IsDominant` (`Morphisms/UnderlyingMap.lean` 217), `Smooth` (`Morphisms/Smooth.lean` 62), `IsIntegral` scheme (`Properties.lean` 240). Tau Ceti: `SchemeWeilDivisor` (`WeilDivisor/Scheme/Basic.lean` 46), `toAlgebraicCycle` (76) with `finite_support_toAlgebraicCycle` (110); `CodimensionOnePoint` (`Scheme/CodimensionOnePoint.lean` 42); `Scheme.CartierDivisor` (`CartierDivisor/Basic.lean` 125); `InvertibleSheaf.pullback` (`LineBundle/Pullback.lean` 72); `InvertibleSheaf.eulerDegree` (`LineBundle/Degree.lean` 70, `χ(L) − χ(𝒪_X)`); the `𝒪_X(D)`, principal-divisor, linear-equivalence and Cartier–Weil files named in R07. Absent at both pins: projectivity, normality and ampleness predicates, Kähler differential sheaf, nef, klt, canonical divisor, Néron–Severi group.

**Sources at their locators.** `fujino-higher` lines 124–149: Definition 1.2 (canonical divisor as the divisor of a regular `n`-form on the regular part, extended) and Definition 1.3 (discrepancy through every proper birational `f : Y → X` from a normal `Y`; klt iff `discrep > −1` and `⌊D⌋ ≤ 0`); Fujino works over `ℂ` (line 122), which the README says (lines 439–441). `fujino-gongyo-abundance` lines 44–46: Conjecture 1.2, log abundance for projective semi log canonical pairs with `ℚ`-boundary. `debarre-hdag`: Theorem 4.1 (line 1486, Nakai–Moishezon for a Cartier divisor on a projective scheme, with the Q-Cartier remark at 1490), Theorem 4.6 (1586, nef iff nonnegative on every curve, projective scheme), Theorem 4.8 (1686, Kleiman's criterion on a projective variety, proof by the compact unit slice and `D − (a/b)H` nef at 1700–1709, exactly the route of Layer 4D item 3), Corollary 4.9 (1719–1722, dual of the closed cone of curves is the nef cone; interior of the nef cone is the ample cone), and footnote 3 at 1650–1651 citing Kleiman p. 334 for finite-dimensionality of `N^1(X)_ℝ` over a general field, as the README says at lines 448–449. Stacks tags as in R08. The seeded sample's targets (`**Input:**` and `**Milestone:**` lines) carry no locators of their own; I checked every locator the file does have.

**Adversarial table.** One row per statement; values on each side.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Sign of `𝒪_X(D)` (line 34) | `D = [p]` on `ℙ¹` | `{s : div s + [p] ≥ 0} = span{1, 1/(t−p)}`, dim 2 = `h⁰(𝒪(1))`; reversed sign gives dim 0 | holds, convention pinned | add as Check |
| `div(dt) = −2[∞]`, `𝒪(K) = 𝒪(−2)`, degree `−2`, not nef (400–403) | `ℙ¹`, `s = 1/t` | `dt = −s⁻² ds`, `ord_∞ = −2`, finite orders 0; `K · ℙ¹ = −2 < 0` | holds | none |
| Discrepancy gap `a ≥ −1 + 1/r` (206–208) | `r = 1`; `r = 2` | `a ∈ ℤ, a > −1 ⇒ a ≥ 0`; `a ∈ ½ℤ, a > −1 ⇒ a ≥ −½` | holds | none |
| Smooth ⇒ klt (214–218) | blow-up of a point on a smooth surface; general `E` | `K_Y = f^*K_X + E`, `a(E) = 1`; general `a(E) = ord_E(f^*ω₀) ≥ 0` for a local generator `ω₀` | holds (even canonical) | none |
| klt controls (missing) | quadric cone `xy = z²`; cone over a plane cubic | `a(E) = 0`, index 2, `0 ≥ −½`; `a(E) = −1`, lc not klt | both discriminate | add as Checks (R04) |
| Independence of top form (206) | `ω ↦ gω` | `K_Y(gω) − f^*K_X(gω) = (K_Y(ω) + div_Y g) − f^*(K_X(ω) + div_X g)`; needs `f^* div_X g = div_Y g` (Layer 1 item 5) | holds given item 5 | none |
| `Spec k` (396–397, 408–411) | dimension 0 | `Ω¹ = 0`, `⋀⁰ = 𝒪`, `K = 0`, `1·K` Cartier; only model `Spec k` itself, klt vacuous; `N_1 = N^1 = 0`, `NEbar = Nef = {0}`, Kleiman vacuous, `𝒪` ample (affine), `𝒪` globally generated | holds | none |
| Unique extension (124–138) | `X = 𝔸²`, `U = 𝔸² ∖ {0}`; `U = 𝔸² ∖ {x = 0}` | every curve meets `U`, `Div(U) ≅ Div(X)`; `[x=0] ↦ 0`, not injective, complement codimension 1 | holds; hypothesis necessary | add negative Check (R04) |
| `extension(div_U f) = div_X f` (135–136) | `f = x` on `𝔸² ∖ {0}` | `div_U(x) = [x=0] ∩ U`, closure `[x=0] = div_X(x)` | holds | none |
| Closures of prime divisors of `U` are prime divisors of `X` (128–130) | generic point `ξ ∈ U` | generizations of `ξ` lie in `U`, so `coheight_X ξ = coheight_U ξ = 1` | holds | none |
| Q-Cartier local = global (144–147) | quasi-compact `X` | finitely many local indices, lcm `r`; `rD` locally principal hence Cartier by item 3 | holds | none |
| `A · C` kills principal divisors (244–247) | `C ⊆ supp div f` | `ν^*𝒪(div f)|_C ≅ 𝒪`, degree 0 | holds (bundle, not equation) | none |
| Degree convention across suppliers | `ℙ¹`, `L = 𝒪(1)` | JacobianChallenge `χ(𝒪(1)) − χ(𝒪) = 2 − 1 = 1`; AlgebraicCurves residue-weighted `deg[p] = 1` | agree | none |
| `(Cartier/≡) ⊗ ℝ` = real quotient (257–262) | general | `ℤ^ρ → Hom(Z_1, ℤ)` injective, stays injective after `⊗ ℝ` (filtered colimit of finite free modules); needs finite generation | holds after item 2 | reorder (R09) |
| Nef iff `D · C ≥ 0` (288–290), scaling (294–297) | `D = ½[∞]`, `A = [∞]` on `ℙ¹` | `D · ℙ¹ = ½`, `A · ℙ¹ = 1`, both nef | holds | Check for the predicate's domain (R09) |
| `ℙ¹` numerical spaces (404–407) | `N_1 = N^1 = ℝ` | `[ℙ¹] · 𝒪(1) = 1`; `NEbar = ℝ_{≥0}`, nef = `ℝ_{≥0}`, ample = `ℝ_{>0}` | holds | none |
| Kleiman (313–316) | `ℙ¹`, `D = a·𝒪(1)` | `D · z > 0 ∀ z ≠ 0 ⇔ a > 0 ⇔ 𝒪(a)` ample; `a = 0` nef not ample | holds | none |
| Nakai–Moishezon, ample + nef (305–312) | `ℙ¹ × ℙ¹`, `D = (a, b)` | `D² = 2ab`, `D · fibres = a, b`; ample iff `a, b > 0`; `(1,1) + (1,0) = (2,1)`, `D² = 4 > 0` | holds | none |
| Nef not ample control (missing) | `F = (1, 0)` on `ℙ¹ × ℙ¹` | `F² = 0`, `F · (0,1) = 1`: nef; Nakai fails on `Y = X` | discriminates | add as Check (R04) |
| Not nef control (missing) | exceptional `E` on a blown-up point | `E · E = −1 < 0` | discriminates | add as Check (R04) |
| Ample cone = interior of nef cone (317–319) | `ℙ¹`; `Spec k` | `ℝ_{>0} = int(ℝ_{≥0})`; `{0} = int{0}` in the zero space | holds | none |
| Semiample ⇔ some power of `𝒪(rD)` globally generated (349–351) | `D = ½[∞]`; `D = −½[∞]` on `ℙ¹` | `𝒪(1)` globally generated, `2D = [∞]`; `𝒪(−m)` has no sections, not semiample, consistent with not nef | holds both ways | none |
| Semiample ⇒ nef, Q-trivial ⇒ semiample (352–355) | `mD ∼ 0` | `𝒪(mD) ≅ 𝒪`, generated by `1`; `D · C = 0 ≥ 0` | holds | none |
| Global generation, finite family (335–339) | invertible sheaf, quasi-compact `X` | a section nonzero in the fibre at `x` generates on an open neighbourhood; finitely many cover | holds for invertible sheaves (stated so) | none |
| Generic fibre of `Ω¹` (165–168) | smooth `X/k` | `dim_{k(X)} Ω_{k(X)/k} = trdeg = n` since `k(X)/k` separably generated | holds | none |
| Curve normalization smooth (238–241) | characteristic 0 | regular + perfect field ⇒ smooth; finite over projective ⇒ projective | holds | none |
| Definition of klt quantifier (214) | non-exceptional `E` | `a(E) = 0 > −1`; agrees with Fujino's exceptional-only infimum when `D = 0` | holds | none |

**Ownership.** Searched by object (nef, Kleiman, klt, canonical divisor, Néron–Severi, Nakai, semiample, discrepancy, numerical equivalence, globally generated, Q-Cartier, Weil divisor, smooth locus, Kähler differentials) over the roadmaps on main and the open heads in the index. Owners found: SchemeAndStackFoundations (R02), StableReduction Layer 2 (R03), JacobianChallenge Layer A (degree agreement, R02). Surface roadmaps (EnriquesSurfacesAndIntegralNonexistence, K3SurfacesAndSymplecticBoundedness) cite SchemeAndStackFoundations §§5.9–5.10 for nef, consistent with that ownership. MotivesAndAlgebraicCycles (earlier in the merge order) plans numerical equivalence of cycles on smooth projective varieties; its files are not among the sibling checkouts this review was given, so I checked it only through the roadmap index: the Chow-group `Num` there and the Cartier-divisor `N^1` here coincide on smooth `X`, which `## Scope and ownership` should say in one clause. No open pull request in the index builds klt, discrepancies, the canonical Weil divisor of a normal variety, or abundance; this roadmap is their owner.

## Not verifiable

- Kollár–Mori, *Birational Geometry of Algebraic Varieties*, §2.3 and Conjecture 3.12 (lines 431–433): the book is behind Cambridge's paywall; the sources service reached only the landing page. Cite as `uncertified`. From the standard numbering, §2.3 is "Singularities of pairs" and Conjecture 3.12 is the abundance conjecture, consistent with the README, but I did not read the text.
- Kleiman, *Towards a numerical theory of ampleness*, Annals 84 (1966) (line 452): JSTOR, paywalled; the service's arXiv lookup was rate-limited. Cite as `uncertified`; Debarre's footnote (line 1651) points to p. 334 for the finite-dimensionality statement.
- Ownership against open pull requests whose files the brief does not provide (MotivesAndAlgebraicCycles, AlgebraicModuliForArithmeticGeometry, HeightsRationalPointsAndObstructions, AbelianSchemesAndArithmeticModuli, ResolutionOfSingularitiesCharacteristicZero) was checked through the roadmap index grep only.

## Source issues

- none
