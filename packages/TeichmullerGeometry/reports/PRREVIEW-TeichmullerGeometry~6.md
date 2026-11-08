# Review of TeichmullerGeometry (pull request #1169 at f1d0a04)

**Verdict:** needs changes

This is a full re-review: the folder changed by 602 lines since `4451421`. Twelve of the previous round's thirteen findings are repaired, and the thirteenth is partly repaired. The gate passes. Four new findings block:

- the deck dictionary of §4.2 states its endpoint formula with the inverse loop;
- two open revisions by the same author plan objects that this roadmap also owns: GeometricTopology's revision for the surface theory of Layer 0 and Smale's theorems, and FuchsianOrbifolds' revision for the `π/21` bound and arithmetic finiteness;
- Nielsen realization can be stated at the pins in its lifting form, but `Suggested.lean` lists it as not statable.

Mechanical checks at this head:
- **Gate** (my own run, which agrees with the worker's): `set_option=0 … sorry-data=0 … statement-hygiene=0 … outside-folder=0 source-material=0 OK`.
- **Elaboration**: `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0 with 29 `declaration uses 'sorry'` warnings and nothing else.
- **Dependency check**: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Other changes**: `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

## Previous findings

- **R01 (sorry'd subgroups): repaired.** The gate reports `sorry-data=0`. `isotopicToIdSubgroup` (lines 508–523) is proved with `TauCeti.Isotopic.trans`. The carrier of `plHomeomorphSubgroup` is now "`s.IsPLHomeomorph f ∧ s.IsPLHomeomorph f.symm`" (line 646). Both `QuotientGroup.map` side conditions are discharged (lines 693–696 and 736–743).
- **R02 (Euler characteristic planned twice): repaired.** §0.0c says "it is not defined again here" (README line 150), and every Lean statement uses `TauCeti.eulerChar` (lines 384, 411, 429, 488).
- **R03 (the `𝓡 2`/`𝓡∂ 2` passage owned nowhere): repaired.** §0.0e line 193 now owns it ("Prove the **comparison of the two models**…"), with *Needs:* `TauCeti.EuclideanHalfSpace.interiorEmbedding` and `ModelWithCorners.interior`, and §§0.1, 0.2, 3.1, 5.3b, 5.4 and 5.4a cite it. §0.2 puts the disc on `𝓡∂ 2` through `TauCeti.DiscDiff 2`.
- **R04 (statement hygiene): repaired.**
  - `Surface.genus` is now an `sInf` (lines 423–424).
  - The smoothing statements use `@IsManifold … σ` (lines 236, 365).
  - `mcg_sphere_full` and `mcg_torus_full` state the canonical maps (lines 842–899), and `torusLinearHomeomorph` has a real body.
- **R05 (six padding declarations): repaired.** All six names occur 0 times.
- **R06 (Epstein 6.3, relative form): repaired.** README line 173 and the docstring at lines 202–207 cite "Theorem 6.3 and its proof, pp. 99–101".
- **R07 (the docstring's reason for not stating the relative PL theorems): repaired.** Lines 59–64 now say these are statable in barycentric coordinates and are proof steps, not headlines.
- **R08 (missing locators): partly repaired.**
  - §0.0c (Hatcher), §0.0h (Epstein A4, 6.3, 6.4), §0.2 (Kriegl–Michor) and §0.3 (Hirsch) now carry locators. I verified the first three below; Hirsch is uncertified.
  - §5.6 dropped the name instead: "Macbeath" and "Singerman" occur 0 times, and no locator was added. Carried into R10.
- **R09 (false §0.3 Check): repaired.** Line 310 now uses the translated line `ℝ × {0}`.
- **R10 (wrong attributions): repaired.** Lines 563 and 820 use the finite isometry group against the infinite order of a twist. Line 880 gives the countability argument.
- **R11 (orientability binder on `baer_epstein_smooth`): repaired.** Line 642 reads "orientable or not", and lines 784–791 carry no `Orientable` binder.
- **R12 (section order): repaired.** Layer 4 is at line 747 and Layer 5 at line 759.
- **R13 (process wording): repaired.** The two "Mathlib acquires" clauses are gone. Line 553 reads "(the third and fourth carriers of the Summary: marked hyperbolic metrics and holonomy classes)".

## R01 (P1) — The deck dictionary's endpoint formula has the inverse loop, contradicting the pin and the section's own Check

Location: README §4.2, line 512: "`η` is a group isomorphism `Π ≃* deck(proj)`, with `η(op p)` the deck transformation sending the base lift to the endpoint of the lift of `p⁻¹`."

Claim: with `η(op p) = loopDeck(p⁻¹)`, which is the pinned `deckFundamentalGroupEquiv_symm_op` that line 508 adopts, `η(op p)` sends the base lift to the endpoint of the lift of `p`, not of `p⁻¹`. Write `T_p` for the deck transformation that sends the base lift to the end of the lift of `p`. Then lifting `p.trans q` gives `T_(p.trans q) = T_p ∘ T_q`. The map the bullet describes is `op p ↦ T_p⁻¹`, and
`T_(p.trans q)⁻¹ = T_q⁻¹ ∘ T_p⁻¹`,
so it is an anti-homomorphism. It is not a group isomorphism for the nonabelian surface groups of this roadmap.

The section's own Checks disagree with the bullet:
- Check 2 (line 519) says that on the circle `η(op(generator))` is the unit translation "in the direction of the loop", which is `T_p`.
- Check 1 (line 518) needs `η(op p) = T_p`.

Witness: Tau Ceti `AlgebraicTopology/UniversalCover/Action.lean` line 172, `monodromy_basepointLift`, gives `monodromy g (basepointLift) = g⁻¹ • basepointLift`, which is `(loopDeck x₀ g⁻¹) (basepointLift)` (`Deck/FundamentalGroup/UniversalCover.lean` lines 52–56 and 112–129). Mathlib's `monodromy` is the endpoint of the lifted path (`Topology/Homotopy/Lifting.lean` lines 385–391).

Repair: at line 512, write "sending the base lift to the endpoint of the lift of `p`". In line 508, call it "the endpoint formula `η(op p)(x̃₀) = end of the lift of p from x̃₀`". On the circle, generator `p` with lift `0 ↦ 1`: `η(op p)(0) = 1`, which agrees with Check 2. With the repaired bullet, `η(op p · op q)(x̃₀) = η(op p)(η(op q)(x̃₀))`, which is Check 1.

## R02 (P2) — The surface theory of Layer 0 and Smale's theorems have a second owner in GeometricTopology's open revision

Location: README Scope line 9 (owns Radó, the Hauptvermutung, smoothing, isotopy of homeomorphisms to diffeomorphisms, and "the topological, relative, orientation-preserving, PL and smooth mapping class groups"), line 16 (owns "Smale's theorems that `Diff(D², ∂)` is contractible and `Diff⁺(S²)` deformation retracts onto `SO(3)`"), and §§0.0b, 0.0e, 0.0h, 5.3, 5.3a and 5.3b.

Claim: GeometricTopology's open revision (#903, same author) plans the same objects and hands them to this roadmap:
- its README lines 137–148 say it "owns … the mapping class groups of compact surfaces (Layer 1.7.2) … Radó's theorem, the two-dimensional Hauptvermutung and the comparison of smooth and topological isotopy (Layer 11.2.1)", that "Layer 1.7.2 is the single owner of the mapping class groups of compact surfaces", and that TeichmullerGeometry Layer 3.1 takes them from it;
- its lines 13343–13345 list "TeichmullerGeometry consumes … Layer 1.7.2's mapping class groups … and Layer 11.2.1's comparison";
- its line 1286 puts "`Diff(S²) ≃ O(3)` and Smale's theorem on the disc" in its Layer 3.4.

Each object therefore has two owners, and each roadmap points at the other.

The same revision also renames a supplier section this roadmap cites. Its lines 558–560 map "the smoothing-and-triangulation comparison … item 1" to Layer 11.3. This README cites that section by its main name in the GeometricTopology contract (line 79) and in the *Needs:* lines of §0.0e (line 207), §5.3a (line 626) and §5.4 (line 651). That citation breaks when #903 merges.

Witness: #903's README at its head, lines 137–148, 1286, 558–560 and 13343, set against this README's lines 9 and 16.

Repair: settle one owner with #903 and say which in the Scope. Two ways:
- **Keep the targets here.** Keep §§0.0b, 0.0e, 0.0h, 5.3, 5.3a and 5.3b, and have #903 delete its Layer 1.7.2, its `Diff(S²)` part of Layer 3.4 and its Layer 11.2.1. GeometricTopology precedes this roadmap, so it cannot cite them back; its consumers, such as MordellLawrenceVenkatesh, would cite this roadmap.
- **Merge #903 first.** Name #903 in the merge-order paragraph, cite GeometricTopology Layers 1.7.2, 3.4, 11.2.1 and 11.3 at its head, and delete the duplicated targets here.

Either way, cite the comparison section as "GeometricTopology's smoothing-and-triangulation comparison, item 1 (Layer 11.3 at the revision)" in the four places above.

## R03 (P2) — The minimum area `π/21` and arithmetic fixed-signature finiteness have a second owner in FuchsianOrbifolds' open revision, and the inequality is already at the Tau Ceti pin

Location: README Scope line 20 ("arithmetic Fuchsian groups … their covolume lower bound and the finiteness of conjugacy classes … by Borel's finiteness theorem") and line 21 ("the minimum area `π/21` of a compact orientable hyperbolic orbifold"), §9.1–§9.2 and §10.1.

Claim: three problems.
- **A second owner.** FuchsianOrbifolds' open revision (#1168, same author) owns both objects:
  - its "Layer 4a: minimum area of compact orientable hyperbolic orbifolds" (README line 398) states `Area ≥ π/21` with equality exactly at `(0;2,3,7)`;
  - its "Layer 7: arithmetic Fuchsian groups, invariants, and fixed-signature finiteness" (line 516; L7.4 at line 894) owns "the fixed-signature finiteness proof";
  - its line 146 says "T8 consumes Fuchsian L7.4", handing that result to this roadmap, which proves it itself from Borel 1981.
- **The inequality is already at the pin.** Tau Ceti already proves the numerical inequality that §10.1 rebuilds case by case (`h ≥ 2`, `h = 1`, `r ≥ 5`, `r = 4`, `r = 3`), together with the value at `(2,3,7)`.
- **Renumbered citations.** #1168 renumbers FuchsianOrbifolds Layer 5. Its Layer 5 has items 1–5 only; item 3 is now "invariant … functions descend", and there is no item 6. This README cites Layer 5 items 1, 3 and 6 in the contract (line 95) and in the *Needs:* lines of §0.0f (line 227), §8.4 (line 848), §8.5 (line 860) and §10.4 (line 971).

Witness:
- Tau Ceti `Data/Rat/BranchDeficit.lean` line 116, `TauCeti.one_div_forty_two_le_hyperbolic_deficit`: for indices at least two, a positive `2γ − 2 + Σᵢ(1 − 1/eᵢ)` is at least `1/42`.
- The same file, line 196, `hyperbolic_deficit_two_three_seven`: the value is `1/42` at `(2,3,7)`.
- #1168's README, lines 146, 398, 516 and 894.

Repair:
- **Settle one owner with #1168 and say which in the Scope.** Either keep §9.1–§9.2 and §10.1 here and have #1168 drop Layer 4a and L7.4, or name #1168 in the merge-order paragraph, cite FuchsianOrbifolds Layer 4a and L7.4 at its head, and delete §9.2's Borel route and §10.1's case analysis.
- **Keep the ids §9.2 and §10.1.** GroupActionsOnRiemannSurfaces (its README lines 315 and 390) consumes §10.1 for `π/21`.
- **Cite the pinned inequality.** In either case, cite `TauCeti.one_div_forty_two_le_hyperbolic_deficit` and `hyperbolic_deficit_two_three_seven` in the Tau Ceti contract and in §10.1. Keep only the equality case and the factor `2π` (FuchsianOrbifolds Layer 4 item 5) as this roadmap's work.
- **Fix the Layer 5 citations.** Cite them by content as well as by number, or state the merge order relative to #1168.

## R04 (P2) — Nielsen realization can be stated at the pins in its lifting form, but the docstring calls it not statable

Location: `Suggested.lean` lines 68–72 ("the Nielsen realization theorem … not statable … no carrier for the marked quotient") and README §8.2 line 815 ("hence by Layer 5.6 is realized as a group of conformal and anticonformal isometries").

Claim: the README's Summary (line 3) lists the Nielsen realization theorem among the headline results of Layer 8, and its classical form needs no Teichmüller carrier. That form says that a finite subgroup of the mapping class group lifts isomorphically to a finite group of diffeomorphisms. It is statable with the file's own `MappingClassGroupSmooth`. The docstring's reason applies only to the fixed-point form.

Witness: appended to a scratch copy of the file, the following elaborates with only the `sorry` warning (line 906 of the probe):

```lean
theorem nielsen_realization
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanHalfSpace 2) S]
    [IsManifold (𝓡∂ 2) ∞ S] [T2Space S] [CompactSpace S] [ConnectedSpace S]
    (hb : (𝓡∂ 2).boundary S = ∅) (hor : Surface.IsOrientable S)
    (F : Subgroup (MappingClassGroupSmooth S)) [Finite F] :
    ∃ H : Subgroup (TauCeti.Diff (𝓡∂ 2) S ∞), Finite H ∧
      Set.BijOn (QuotientGroup.mk : TauCeti.Diff (𝓡∂ 2) S ∞ → MappingClassGroupSmooth S)
        (H : Set _) (F : Set _) := by
  sorry
```

Repair: add this statement, with a docstring citing Kerckhoff 1983, Theorem 1, and §8.2. Name it in §8.2 as a target: the isometry group of the fixed point lifts `F`. The sphere and torus cases hold by §5.4a, where reflections and `torusLinearHomeomorph` give the lifts. Keep only the fixed-point form in the docstring's not-statable list.

## R05 (P3) — §0.4's first Check is false in genus two and contradicts §0.4's third Check

Location: README line 320: "`(X, m) ∼ (X, m ∘ φ)` for `φ ∈ Diff₀(Σ)`, and not for the shear of the torus or any `φ` acting nontrivially on `H₁(Σ)`".

Claim: in genus two every `X` has the hyperelliptic involution `h`, which acts as `−1` on `H₁`. Take `φ = m⁻¹ h m`. Then `f = h` gives `f ∘ m = m ∘ φ`, so `(X, m) ∼ (X, m ∘ φ)` even though `φ` acts nontrivially on `H₁`.

Witness: §0.4 Check 3 (line 322) proves exactly this relation, and §1.2 Check 1 (line 373) says that `J` and `φ^*J` for the hyperelliptic involution give the same point.

Repair: "and not for `φ` whose action on `H₁(Σ)` is not that of an automorphism of `X`, such as the shear of a generic torus; in genus two the hyperelliptic involution acts as `−1` and is realized (third Check)".

## R06 (P3) — §10.1's third Check says a bound of `84(g − 1)` on the total index holds for the Bolza surface; it fails there

Location: README line 926: "with `96 = 2·48 ≤ 168`; a bound `84(g − 1)` on the total index would still hold here but is not what the argument proves."

Claim: for `g = 2`, `84(g − 1) = 84`, and the total index `[Λ : Γ]` of the Bolza group in its maximal `PGL₂(ℝ)` overgroup is `96 > 84`.

Witness: the Check's own numbers: `Aut⁺ = 48` and full isometry group `96`. Also `(2,3,8)` has area `2π·(1/24) = π/12`, and `4π/(π/12) = 48`.

Repair: "a bound `84(g − 1) = 84` on the total index would fail here (`96 > 84`), so the factor two from `[Λ : Λ⁺] ≤ 2` is needed".

## R07 (P3) — §9.2's third Check says there are finitely many signatures of bounded covolume; there are infinitely many

Location: README line 892: "so the number of possible signatures of covolume at most `c` is finite, which is the content of the generator bound."

Claim: the signature formula bounds `h` and `r`, but not the cone orders. The signatures `(0; 2, 3, m)` for `m ≥ 7` are pairwise distinct. Their covolumes `2π(1/6 − 1/m)` are all below `π/3`.

Witness: Borel 1981, Lemma 8.1 (p. 25; borel1981 lines 782–789) bounds the number of generators, `2g + m + r − 1` there, and says nothing about the orders.

Repair: "so `2h + r`, and hence the number of generators, is bounded in terms of `c`; this is the content of Borel's Lemma 8.1 (the cone orders are not bounded: `(0; 2, 3, m)`, `m ≥ 7`)".

## R08 (P3) — The direction of the earthquake in §8.1's API contradicts §8.1's first Check

Location: README line 802: "so `E^(ℓ_γ)_γ` is the Dehn twist, with the sign of Layer 7.2"; line 806: "`(X, m ∘ τ_γ) = τ_γ⁻¹ ⋅ (X, m)`, so it changes the twist coordinate by `+ℓ_γ` … A convention with `E^(ℓ_γ)_γ = τ_γ ⋅ (X, m)` would be a right earthquake."

Claim: Layer 7.2's Dehn twist `τ_γ` lowers `t_γ` by `ℓ_γ` (lines 736 and 740). Read with that sign, the bullet makes `E^(ℓ_γ)_γ` the action of `τ_γ`, which the Check calls a right earthquake. The Check makes it the action of `τ_γ⁻¹`, which raises `t_γ` by `ℓ_γ`.

Witness: on one cuff, `t ↦ t − ℓ` under `τ_γ ⋅` (§7.2) and `t ↦ t + ℓ` under `E^ℓ_γ` (§8.1 Check 1).

Repair: replace the clause with "so `E^(ℓ_γ)_γ(X, m) = (X, m ∘ τ_γ) = τ_γ⁻¹ ⋅ (X, m)`, and `E^t_γ` raises `t_γ` by `t`".

## R09 (P3) — Two Checks give a wrong reason

Location and claim:
- **README line 122 (§0.0a Check 2):** "an approximation within it would agree with `f` at every point with rational first coordinate". At a point with first coordinate `p/q` the allowed error is `1/q > 0`, so agreement is not forced there. Agreement is forced at every point by continuity, because every neighbourhood contains rational first coordinates with unbounded denominators.
- **README line 502 (§4.1 Check 4):** "The lifting statement fails without torsion-freeness in the uniqueness clause only: for `Γ` with elliptic elements the lift is still unique up to `Γ₂`". The sentence says both that uniqueness fails and that it holds.

Witness:
- §0.0a: at `p/q = 0/1` the bound is `1`, and `g ≠ f` there is allowed.
- §4.1: two lifts `a, a'` give `a'a⁻¹ x ∈ Γ₂ x` for all `x`. By discreteness this forces `a'a⁻¹ ∈ Γ₂`, with or without torsion.

Repair:
- **§0.0a:** "near every point the bound takes values `1/q` with `q` unbounded, so continuity forces `g = f` everywhere".
- **§4.1:** "with elliptic elements the lift and its uniqueness up to `Γ₂` still hold, but the quotients are orbifolds, which is why Layer 10.1 passes through FuchsianOrbifolds Layer 1".

## R10 (P3) — Sampled targets without a source locator, and one source used beyond its setting

Location:
- §0.5 line 328: `Aut(X) ∩ Diff₀(Σ) = {id}`, and the injectivity of `Isom(X) → Mod±(Σ)`.
- §5.6 line 680: the identification of point stabilizers and the finite-index criterion. Previous R08 asked for a locator here, and the name was deleted instead.
- §7.2 line 736: the twist coordinate and its sign under the Dehn twist.
- §8.4 line 839: `dim_ℂ Fix(F⁺) = 3h − 3 + r` and the pole condition.
- §0.0d line 171: the fourth curve theorem, on disc-bounding curves.
- §0.2 line 284: Kriegl–Michor is cited "For compact `M`", including `D²` with a collar.

Claim:
- **No locator.** The first five are theorems stated with hypotheses but with no source. In §0.0d the other three bullets cite Epstein.
- **Kriegl–Michor beyond its setting.** Kriegl–Michor's manifolds have no boundary (kriegl-michor1997 line 12085, §27.1; the book mentions neither "with boundary" nor "with corners"), so Theorems 42.1 and 43.1 do not cover `D²` with a collar.

Witness: none of these five paragraphs has a parenthetical source locator. kriegl-michor1997 lines 20142–20145 (42.1, p. 439) and 20817–20820 (43.1, p. 454) cover smooth finite-dimensional manifolds with no boundary.

Repair:
- **Add locators.** Give each of the five a theorem-and-page locator to a source that states it (for §0.5 and §5.6 a textbook such as Farb–Margalit, Chapter 7, with the exact item), or say in one clause that the proof given is the roadmap's own.
- **Narrow the Kriegl–Michor citation.** In §0.2 write "for closed `M`; for `D²` with a collar, apply it to the compactly supported diffeomorphisms of the open disc".

## R11 (P3) — Ids this pull request dropped are still cited by another roadmap, with no old → new numbering

Location: README (whole), and the pull request description ("this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9").

Claim: earlier heads of this pull request numbered its parts `T0`, `T4a`, `T7`, `T8`, `T9` and `T10`. At commit `84e3d818` the README had the headings "### T0. …" at line 40, "### T8. Arithmetic exceptions" at line 138 and "### T10. …" at line 198. The current README defines none of them. FuchsianOrbifolds' revision cites them throughout: its README lines 32, 142–147, 183–189, 1377, 1388, 1407, 1429, 1449 and 1461–1489.

Witness: `grep -E '\bT(0|4a|7|8|9|10)\b'` on this README returns nothing. #1168 line 1407 reads "the geometric surface-group convention fixed by TeichmullerGeometry T4a".

Repair: add one old → new line per moved id: `T0` → Layers 0–3, `T4a` → §§4.2–4.5, `T7` → §8.5, `T8` → §§9.2–9.3, `T9` → §10.4 (with §4.1 for `Isom(ℍ) ≃ PGL₂(ℝ)` and isometry lifting), and `T10` → §11.1. Alternatively, have #1168 cite the new ids.

## Verified sound

**Adversarial table.** 42 rows. It covers the fifteen sampled targets, all 29 sorried theorems of `Suggested.lean`, its definitions, and every target a finding touches.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.0d `isotopic_of_homotopic_closedSurface` | `S²`; torus; Klein bottle; closed disc | `S²`: homotopic ⇒ same degree ⇒ isotopic; disc: conjugation homotopic, not isotopic, excluded since `∂D = S¹ ≠ ∅` | true as stated | none |
| §0.0d `isotopicRel_of_homotopicRel` | annulus twist; Möbius band | twist moves a crossing arc by the core, so not homotopic rel ∂; Epstein 3.4 (line 246): every self-homeomorphism of the Möbius band fixing `∂` is isotopic rel `∂` | consistent | none |
| §0.0d curve Checks | clockwise vs counterclockwise unit circle in `ℝ²` | Epstein Remark 1 after 2.1 (lines 112–115): false when the curve bounds a disc in orientable `M` | Check 3 correct | R10 (fourth bullet) |
| §0.2 paths and isotopies | `S²` rotation vs antipodal; torus shear | antipodal map has degree `−1`; the shear acts on `H₁` by `[[1,0],[1,1]] ≠ I` | Checks hold | R10 (Kriegl–Michor scope) |
| §0.4 markings | genus 2, `φ = m⁻¹hm` | `φ_* = −1` on `H₁`, and `f = h` relates `(X,m)` and `(X, m∘φ)` | Check 1 false | R05 |
| §0.5 kernel | torus translations; hyperelliptic `h`; `⟨γ⟩` hyperbolic | `g = 1` fails; `h_* = −1`; centralizer of `⟨γ⟩` is a one-parameter group | consistent | R10 |
| §1.1 Nijenhuis | `N(v,Jv)`; `J = [[0,−1],[1,0]]` | `N(v,Jv) = −N(Jv,v) = J N(v,v) = 0`; `(e₁, Je₁) = (e₁,e₂)` positive | correct | none |
| §2.2 transitions | ComplexCurveModuli D4 item 4, D3 item 6 | "uniqueness with the specified central isomorphism" (CCM line 114); block form `[[i,0],[α,j]]` (line 103) | supplier says it | none |
| §2.3 Hausdorff, second countable | `𝒥(T²)/Diff₀`; `ℝ/ℤ` collapsed | `ℍ`, Hausdorff; not first countable at the collapsed point | Checks hold | none |
| §4.1 `exists_mulEquiv_isometryEquiv_glAction` | `diag(−2,1)`; `λI` with `λ<0`; Mathlib `σ` | `z ↦ −2z̄`, `i ↦ 2i`, `2i ↦ 4i`; `det = λ² > 0`; `σ g = conj` iff `det ≤ 0` (`MoebiusAction.lean` line 91) | true | R09 (Check 4) |
| §4.2 `η` | circle, generator `p`; nonabelian `Π` | pin gives `η(op p)(0) = +1`, the bullet gives `−1`; the bullet's map is an anti-homomorphism | bullet false | R01 |
| §4.3 attaching word | `g = 1`; `g = 2` | native relator `B⁻¹A⁻¹BA`, whose image under `ι⁻¹` is `[b,a] = R⁻¹`; `[b₁,a₁][a₂,b₂] = [a₂,b₂]² ≠ 1` in `Π` | correct | none |
| §4.4 sign Check | genus 2; reflection conjugate | `e = 2 − 2g = −2`; `e(cρc⁻¹) = +2` | consistent | none |
| §5.4 `baer_epstein_smooth` | Klein bottle; torus | `(x,−y) = (x+½, y)` on the Klein bottle, joined to the identity by `(x + t/2, y)`; `diag(1,−1)` on the torus `H₁` | true, also nonorientable | none |
| §5.6 stabilizers | `H = Aut(Π)`; `H = Inn(Π)` | `[Aut:Inn] = ∞` with empty fixed set; index 1, fixes everything | consistent | R10 |
| §7.2 / §8.1 twist and earthquake | one cuff | `τ ⋅`: `t − ℓ`; `E^ℓ`: `t + ℓ`; the bullet's "Dehn twist with the sign of 7.2" gives `t − ℓ` | bullet inconsistent | R08 |
| §7.5 metric | Teichmüller disc | `K = (1+k)/(1−k)`, `d_T = ½ log K = artanh k`; `\|dz\|/(1−\|z\|²)` has curvature `−4` | correct | none |
| §8.4 dimension | `ℤ/3` on genus 3 with `(1;3,3)`; `h` in genus 2; pole | `4 = 3(0 + 4/3)`, dimension 2; `(0;2⁶)` gives 3; `dz² = dw²/(4w)` | correct | R10 |
| §8.5 genus-two kernel | `r = 6 − 3h` | `h=1`: `2 ≥ \|K\|·3/2 ≥ 3`, impossible; `h=2`: `\|K\| = 1`; `h=0`: any `mᵢ ≥ 3` gives `\|K\| ≤ 12/7` | complete | none |
| §9.2 finiteness | Borel 8.1 and 8.2; `(0;2,3,m)` | p. 25 case `a=1, b=0`; p. 26; covolume `2π(1/6 − 1/m) < π/3` for every `m ≥ 7` | theorem cited correctly; Check 3 false | R07 |
| §10.1 minimum area | `(2,3,7)`; `(2,3,8)`; Bolza | `1/42`; `1/24`; isometry group 96 against `84(g−1) = 84` | Check 3 false; inequality at the pin | R03, R06 |
| §11.1 common locus | `g = 2`; three open dense sets | the Layer 8.5 locus is empty; a finite intersection of open dense sets is open dense | correct | none |
| `exists_pl_approximation_open` | `φ = 1/q`; `x ↦ ‖x‖x` | the infimum over every neighbourhood is 0, so continuity forces `g = f`; `x‖x‖` is not PL at 0 | hypothesis needed | R09 (wording) |
| `exists_pl_approximation_halfPlane` | `(x₀,x₁) ↦ (x₀, x₁+x₀²)` | preserves `x₀ ≥ 0` and fixes `x₀ = 0` pointwise | Check holds | none |
| `image_boundary` | closed disc vs `S²` | boundaries `S¹` and `∅` | true | none |
| `PLStructure`, `IsCombinatorialManifold 2` | one-triangle disc | corner links are arcs: Tau Ceti allows ball links (`CombinatorialManifold/Basic.lean` lines 214–217) | boundary admitted | none |
| `PLStructure.nonempty_of_compactSurface`, `plHomeomorphic` | tetrahedron vs octahedron | 4 vs 6 vertices; common refinement by great-circle arcs | consistent | none |
| `IsCompatible`, `exists_smoothing` | one-triangle disc; its barycentric subdivision | rank `≤ 1` at a corner; subdivision is smoothable | consistent | none |
| `exists_isotopic_diffeomorph`, `…Rel_…` | torus `(x, y+u(x))` | `t·u` isotopy to the identity | true | none |
| `StandardSurface.word`, `model` | `orientable 0 1`; `nonorientable 1 0`; sphere | side 0 at `e^{2πit/3}`, side 2 at `1−t`: `e^{−2πit/3}` (fold); `e^{iπt}` vs `−e^{iπt}` (antipodal); `χ = 1, 1, 2` | correct | none |
| `isSurface_model`, `eulerChar_model`, `homeomorph_unique` | annulus; Dyck word | `(1+2) − 4 + 1 = 0`; `1 − 3 + 1 = −1` | consistent | none |
| `classification_of_surfaces`, `homeomorph_iff_invariants` | torus vs Klein; vs genus 2; vs annulus | `χ` 0 and 0; 0 and −2; boundary count 0 and 2 | each invariant needed | none |
| `Surface.genus`, `eulerChar_eq_two_sub_two_mul_genus` | Klein; torus; non-surface | genus 2, 1; `sInf ∅ = 0`; `χ(T²) = 0 = 2 − 2·1` | correct | none |
| `IsBranchedCover`, `local_degree_unique`, `exists_degree` | `z²`; identity with `e = 2` | 2 preimages near `0` in every small chart; the power model fails for the identity | well defined | none |
| `riemannHurwitz` | `zⁿ` on `Ĉ`; `zⁿ` on the closed disc; double cover of `ℝP²` | `2 = 2n − 2(n−1)`; `1 = n − (n−1)`; `2 = 2·1` | consistent | none |
| subgroups, `MappingClassGroupFull/Rel/Plus` | annulus twist; disc conjugation | `([θ+st],t)` trivializes it in Full; conjugation reverses orientation | Checks hold | none |
| `MappingClassGroupPL.toTop_bijective` | annulus reflection `(θ,t) ↦ (θ,1−t)` | homotopic to the identity but not isotopic; bijectivity starts from isotopy, so Epstein 6.4's orientation clause is not needed | true | none |
| `exists_diffeomorph_mapOfEq_eq` | torus shear; `S²` | `(1,0) ↦ (1,1)`; `π₁ = 1` | true | none |
| `contractibleSpace_discDiff_two`, `exists_homotopyEquiv_…_two` | `2πt` spliced rotation; `π₀` | null in `π₀`; `π₀ O(3) = ℤ/2 = π₀ Diff(S²)` | true | R02 (owner) |
| `smoothIsotopic_of_isotopic`, `MappingClassGroupSmooth.toTop_bijective` | `S⁶` | 28 smooth classes vs 1 topological | dimension used | R02 (owner) |
| `mcg_sphere_full`, `mcg_torus_full` | reflection·antipodal; `−I`; swap | rotation by `π`, `det = 1`; `det(−I) = 1` with four fixed points; `det = −1` | true | none |
| Nielsen realization, lifting form | probe statement | elaborates | statable | R04 |

**One-tactic probe.** I replaced every `sorry` with `first | rfl | simp | infer_instance | trivial | decide` in a scratch copy. All 29 theorems fail, so nothing is padding.

**Signature check.** I appended `#check @` for every declaration to a scratch copy and elaborated it once; the name errors in that run come from my script, not the file. The 11 binder drops that `signatures.md` flags are all in definitions:
- `ChartedSpace` is dropped by the PL definitions, whose bodies never use it;
- `IsManifold` is dropped by `smoothIsotopicToIdSubgroup`, `MappingClassGroupSmooth` and `.toTop`, whose bodies do not need it.

Every theorem carries the binders its README statement needs. For example:
- `baer_epstein_smooth`: `IsClosedConnectedSurface` and `IsManifold (𝓡 2) ∞`;
- `isotopicRel_of_homotopicRel`: `T2Space` and `CompactSpace M`;
- `riemannHurwitz`: compact, connected and Hausdorff on both sides.

Nothing changed.

**Library declarations resolved at the pins.** 81 names from the two contracts:
- 66 were elaborated by `#check`;
- 15 sit in modules without built object files and were read in source:
  - `barycentricSubdivisionRealizationHomeomorph_trans` (`SmoothTriangulation/Subdivision.lean` line 63);
  - `alexanderIsotopyClosedBall` (`Isotopy/Alexander.lean` line 132);
  - `IsCombinatoriallyTriangulable` (`Topology/CombinatoriallyTriangulable.lean` line 44);
  - `IsJordanCurve.exists_homeomorph_image_sphere` (`Jordan/Schoenflies.lean` line 122);
  - `eulerChar_eq_mul_of_isCoveringMap` (`EulerCharacteristic/Covering.lean` line 140);
  - `eulerChar_sphere` (`EulerCharacteristic/Sphere.lean` line 62);
  - `UniversalCover.deckSubgroupQuotientProjEquivOfNormal` (`Classification/DeckGroup.lean` line 95);
  - `UpperHalfSpace` and `isPretransitive_isom` (`Hyperbolic/UpperHalfSpace/Basic.lean` lines 91, 488).

Also opened: Tau Ceti `loopDeck` and `deckFundamentalGroupEquiv_symm_op` (`Deck/FundamentalGroup/UniversalCover.lean` lines 52, 112), `monodromy_basepointLift` (`UniversalCover/Action.lean` line 172), `IsPLOn` (`PL/Map.lean` line 187), `IsCombinatorialManifold` (line 214), `DiscDiff` and `WatanabeTheorem` (`Diffeomorphism/Disc.lean` lines 63, 77), `SmaleConjecture`, which concerns `S³` and so is not a duplicate (`Diffeomorphism/Smale.lean` line 46), and `RelativeDiff` (`FixingSubgroup/Basic.lean` line 149). From Mathlib: `glAction` and `σ` (`MoebiusAction.lean` lines 91, 181), `FundamentalGroup.mul_def` (line 44) and `IsCoveringMap.monodromy` (`Lifting.lean` line 388).

**Cross-roadmap citations resolved on main (`7bf4638`).** The supplier folders are unchanged since the previous review's main.
- ComplexCurveModuli D0 items 1–5 (lines 27–51), D3 items 3–6 (82–103), D4 items 1 and 4 (107–114), D6 item 2.
- FuchsianOrbifolds Layer 0 items 2–3, Layer 1 items 1–3, Layer 4 item 5, Layer 5 items 1, 3 and 6 (main lines 198–339).
- GeometricTopology Layer 3 (Diff(M), smooth families, reference inclusion), Layer 1, and the smoothing-and-triangulation comparison item 1 (main line 938).
- AlgebraicTopology Stages 1, 6 and 7; CharacteristicClasses C2.2–C2.3; RiemannianGeometry R4.7; PDE Lane B items 8–10; ModularForms 10B; Completed/UniversalCovers.

The 18 `roadmaps resolve` leads are this roadmap's own names, declared inside `namespace StandardSurface`, `Surface.*` or `PLStructure.*`.

**Supplier order.** Every supplier is on main, and TeichmullerGeometry is line 283 of the merge order. FuchsianOrbifoldsPartII (line 299) and MappingClassGroupsAndCanonicalRepresentations (line 287) come later and are not cited.

**Ownership against open pull requests**, checked at the heads the brief gives:
- GeometricTopology #903 and FuchsianOrbifolds #1168: see R02, R03 and R11.
- GroupActionsOnRiemannSurfaces #1728 cites §§5.6, 8.4 and 10.1, all of which exist.
- QuaternionArithmetic #1722 defers the general arithmetic Fuchsian lattice to §9.1 (its line 84).
- StableReductionPartII #1841 uses Teichmüller *level* structures only.
- SurfaceTopology and PlanarTopology (#271) are excluded as suppliers by the brief, so Layer 0 is correctly not citing them.

## Not verifiable

- **Paywalled books, cited by locator as uncertified:** Moise (Theorems 6.2–6.4, 8.2, 8.3, 8.5), Massey (Chapter 1), Munkres (Definition 8.3, Theorems 10.5–10.6), Farb–Margalit (§§2.2, 2.3, Chapters 7, 8, 11), Imayoshi–Taniguchi, Hubbard, Hirsch (Chapter 8).
- **Uncertified papers:** Ahlfors–Bers 1960, Douady–Earle 1986, Wolpert 1979 (Lemma 3.1).
- **Waived:** Kerckhoff 1983, Theorem 1 (§8.2).
- **Sampled target §7.5:** its locators are all to uncertified texts.
- **Openly available but not re-read this round** (outside the sample): Smale 1959 (§5.3), Greenberg 1963 (§10.4), Takeuchi 1975 (§9.1).

## Source issues

- **Error** in epstein1966 at Theorem 6.4 a), p. 101: the source asks for orientation preservation only for the plane and the open and closed cylinders (lines 604–607). It should also ask it for the closed disc, where complex conjugation is homotopic but not isotopic to the identity; affects nothing.
