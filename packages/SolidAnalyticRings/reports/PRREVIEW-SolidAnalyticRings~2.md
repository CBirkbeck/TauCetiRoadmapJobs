# Review of SolidAnalyticRings (pull request #1458 at 849039d)

**Verdict:** needs changes

Incremental re-review of the 4 lines changed since `5d395ae`, plus the pull request's title and description. Two P3 findings; no P1 or P2. The gate fails at this head on `statement-hygiene` (2 hits, one theorem), so the folder cannot be accepted until R01 is repaired. Conditional, as before, on the three declared supplier gaps (`gap:light-measure-site-comparison`, `gap:cardinal-interchange`, `gap:light-countable-ab6`).

## R01 (P3) — `letI` in the signature of `isLightSolid_closed_monoidal_reflection` (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/SolidAnalyticRings/Suggested.lean` lines 150 and 152: "`∃ m : MonoidalCategory IsLightSolid.{u}.FullSubcategory, letI := m ∃ s : SymmetricCategory …, letI := s`".

**Claim:** the statement installs the existentially bound monoidal and symmetric structures with `letI` inside the theorem's type.

**Witness:** gate at 849039d: `statement-hygiene=2 … FAIL`; "line 150: P3 `letI` in the signature of theorem `isLightSolid_closed_monoidal_reflection`", same at line 152. The rule's repair: an instance binder or a named instance in the signature.

**Repair:** replace lines 148–156 by the statement below, which passes the bound structures explicitly. Tested on a scratch copy with `lake env lean`: exit 0, the four `sorry` warnings only; `#check` prints `∃ m s, Nonempty (MonoidalClosed IsLightSolid.FullSubcategory) ∧ ∃ L, Nonempty (L ⊣ IsLightSolid.ι) ∧ Nonempty L.Braided`, the same mathematical statement. The docstring and README §1.5 need no change.

```lean
theorem isLightSolid_closed_monoidal_reflection :
    ∃ (m : MonoidalCategory IsLightSolid.{u}.FullSubcategory)
      (s : @SymmetricCategory IsLightSolid.{u}.FullSubcategory _ m),
      Nonempty (@MonoidalClosed IsLightSolid.{u}.FullSubcategory _ m) ∧
        ∃ L : LightCondMod (ULift.{u} ℤ) ⥤ IsLightSolid.{u}.FullSubcategory,
          Nonempty (L ⊣ IsLightSolid.{u}.ι) ∧
            Nonempty (@Functor.Braided _ _ _ _ _ _ m s.toBraidedCategory L) := by
  sorry
```

## R02 (P3) — §2.1: page of the added locator

**Location:** `TauCetiRoadmap/SolidAnalyticRings/README.md` line 245: "RC Example 4.6.4(1), p.43, RC line 2123".

**Claim:** item (1) of RC Example 4.6.4, and the cited line 2123, are on printed page 43.

**Witness:** the page-44 marker is at RC line 2117; item (1) runs RC line 2119–2124. Only the example's heading (RC line 2114–2116) is on p.43. The README's own References entry gives "Example 4.6.4, pp.43–44".

**Repair:** write "RC Example 4.6.4(1), p.44, RC line 2123, and Proposition 4.6.2(2), p.43, RC line 2092 (internal compactness, abelian model)". The page asked for in the previous review's R02 repair was wrong; the line numbers were right.

## Previous findings

- R01 — repaired: "For f(j)=j the stage ∏_j K_(f(j)) has π₁(*)=∏_ℕℤ/2 in the marked-fiber model, whereas image subgroups p^(f(j))π₁A_p would give the single coordinate ℤ/2; the colimits agree".
- R02 — repaired, with a wrong page (this report's R02): "RC Example 4.6.4(1), p.43, RC line 2123, and Proposition 4.6.2(2), RC line 2092 (internal compactness, abelian model)". The source lines support the claim.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.4 last Check, stage-level discriminator (changed) | p = 2, f(j) = j, singleton blocks; p = 3 | marked: π₁K_r(*) = π₁A_p(*) = ℤ/2 for all r, stage ∏_ℕℤ/2; image: 2^j·(ℤ/2) = ℤ/2 at j = 0, 0 for j ≥ 1, stage ℤ/2; both colimits ⊕_ℕℤ/2; p = 3: π₁ = 0 | holds; the two models differ at the stage | none |
| §6.4 Check against the §6.4 target (line 637) | notation and transition maps | K_r = fib(A_p → A_p/p^r) ≃ A_p; transition ×2^(f(j)−g(j)) is 0 on π₁ = ℤ/2 when f(j) > g(j), matching "lowering kills those coordinates" | consistent with the target and with the other Checks | none |
| §2.1 colimit preservation of Hom(N,−), added locator | RC line 2092, 2123; pages | RC line 2123: P internally compact projective, case (2) of Proposition 4.6.2; RC line 2092: Hom(A,−) commutes with sequential colimits; page-43 marker at RC line 2072, page-44 marker at 2117 | source supports the abelian model; page wrong | R02 |
| §1.5 headline `isLightSolid_closed_monoidal_reflection` | signature with `letI` versus explicit `@` arguments | both elaborate to ∃ m s, Nonempty (MonoidalClosed …) ∧ ∃ L, Nonempty (L ⊣ ι) ∧ Nonempty L.Braided; L ⊣ ι with L monoidal fixes m(LX,LY) ≃ L(X⊗Y) | statement unchanged by the repair | R01 |

The rows for the untouched statements stand as in the previous review, of `5d395ae`.

- Gate, re-run at 849039d: every check 0 except `statement-hygiene=2` (R01); `FAIL`. The Lean file is unchanged since `5d395ae`; the rule is applied to it for the first time here.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SolidAnalyticRings/Suggested.lean` exits 0 with `sorry` warnings at lines 124, 137, 148, 161 and nothing else; the R01 replacement elaborates the same way on a scratch copy.
- Source locators checked against the text: 2 (RC line 2092, RC line 2123), with the page markers at RC line 2072 and 2117.
- Outside-folder diff against `origin/main`: empty. Folder: `README.md`, `Suggested.lean`, `metadata.toml`.
- Pull request text (title and description prose, read against the head): the consumer sentences agree with `## Downstream consumers` (HabiroRings §§1–6; RefinedTraceMethods §§1–2 and §6.4; HigherHidaAndColemanTheory §§7.2–7.4; LocallyAnalyticRepresentationsOfLocalGroups §7.4); "recover discrete animated Huber pairs" agrees with §7.3 (line 749); the validation counts agree with the gate (build, missing identifiers 0, `set_option` 0, sorry'd data 0, depcheck 0, outside-folder 0); the text says the folder is added, which the diff shows (1011 insertions, no deletion). No sentence contradicted, no removal or renumbering to state. No finding.
- Cross-roadmap: no other roadmap's `Suggested.lean` declares `IsLightSolid`, `nullShift` or `liftedSequence` (roadmaps grep over main and the open heads: this pull request only). Citing roadmaps at their heads: HabiroRings, RefinedTraceMethods, HabiroCohomologyFoundationsPartII, AnalyticStacks, HigherHidaAndColemanTheory, all consumers.
- Overlap check: read AnalyticStacks, HabiroRings, RefinedTraceMethods, HabiroCohomologyFoundationsPartII, VStackSheavesAndLisseCategories, EnhancedDerivedSheaves, StableHomotopyKTheory, BordismFormalGroups; nothing shared (AnalyticStacks and HabiroRings state in their scope that light solid coefficients, the Huber-pair summability structures and the two-index profile theorem are this roadmap's §1.5, §§7.1–7.3 and §5.2).
- Source independence: changed passages only; 2 passages compared with 1 source (RC), none shared (the added locator is a citation, the rewritten Check is a computation RC does not contain); the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- HTT printed page 394 for Proposition 5.3.3.3: the cached text has PDF page markers only (carried from the previous review; untouched).
- Whether the gate's `statement-hygiene` scanner accepts the R01 replacement: the scanner runs on the pull request's worktree only; the replacement contains no `letI`, `haveI`, `ULift` beyond the existing carriers, or `Nonempty (A ≅ B)` conclusion, and it elaborates.

## Source issues

- none

## For the human reviewers

- **Scope.** The source with most locators, RC (Rodríguez Camargo, Notes on Solid Geometry, arXiv 2603.03012v1), is an unpublished preprint; CS, AG are lecture notes and AS a lecture transcript. Refereed sources cited: HTT; Bosco is an arXiv preprint (2306.06100v1).
- **Licence.** MW is read from an author version dated 5 February 2026, and AS is a contributors' transcript of lectures; neither licence status was settled here.
