# Review of GeneralizedCohomology (pull request #2535 at 8d8d411)

**Verdict:** accepted

**Summary.** Accepted with no finding, no small correction and no format note. Both small corrections of the previous review are repaired: `rationalHurewicz` is now stated for a space in any universe, as G5.6 states it, and the last sentence of G3.9 names the formulas and comparisons it supplies to TangentialBordism, all of which G3.9 itself proves. The title and description agree with the head. One point about ownership against two open pull requests is left for a human to decide, as before.

## Previous findings

- The previous review, of `aa14dec`, raised no finding (no R01).
- C01 (small correction) — repaired: `theorem rationalHurewicz {X : Type u}` with `(C := ModuleCat.{u} ℚ) (ModuleCat.of ℚ (ULift.{u} ℚ))` (`Suggested.lean`, lines 204–211); it elaborates with only the `sorry` warning.
- C02 (small correction) — repaired: "The formulas π_n E_(p)=π_n E⊗Z_(p) and, for degreewise finitely generated π_*E, π_n E^∧_p=π_n E⊗Z_p, with the completed monoidal/module/ring comparisons above, supply …" (README lines 2422–2426).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| G3.9 closing sentence (README 2422–2426) | E=Hℤ; Hℤ/q, q≠p; Hℚ; where each formula is proved | Hℤ: ℤ_(p), ℤ_p. Hℤ/q: ℤ/q⊗ℤ_(p)=0=ℤ/q⊗ℤ_p. Hℚ excluded: completion 0, ℚ⊗ℤ_p=ℚ_p. Proved at lines 2399–2400, 2414–2415, 2416–2418. | Pass |
| G3.9 pointer to F2.2 (2420–2422) | X=Hℤ; X=KU; F2.2 on main | Both completions of Hℤ have π₀=ℤ_p. HF_p∧KU≃0, yet π₀KU^∧_p=ℤ_p. F2.2 states bounded-below and owns it (BordismFormalGroups 749–755). | Pass |
| `rationalHurewicz` in universe u (`Suggested.lean` 204–212) | k=0,1,2; X=S², x any; coefficient object | k=0: 2·0−1=0, nothing. k=1: only n=0 spanning. S², k=2: ℤ→ℚ kernel 0, spans; degree 3: π₃=ℤ→0 onto, kernel not claimed (Hopf map). `ULift.{u} ℚ` is ℚ, one-dimensional. | Pass |

The rows for the untouched statements stand as in the previous review, of `aa14dec`.

- Source locators checked against the text: 2, both for G5.6, the sampled section the change touches. HatcherSSAT line 2024 (Proposition 1.22, page 34) and HatcherAT line 15686 (Corollary 4.24, printed page 360) agree with the docstring and README lines 4228–4231.
- Library declarations opened at the pin: `HomotopyGroup.hurewiczHom` (Tau Ceti `AlgebraicTopology/Homotopy/Hurewicz/Basic.lean`), through the elaborated type: `∀ {X : Type u_1} [TopologicalSpace X] (x : X) (k : ℕ), …` with coefficients `ULift.{u_1, 0} ℚ`. Every binder of the README statement is present.
- Cross-roadmap citations resolved: BordismFormalGroups F2.2 on main (lines 749–755: the identification is owned there, G3.9 supplying the derived completion, its Hom/Ext sequence and its tensor formula); TangentialBordism's citations of G3.9 on main (lines 2145, 2198, 2284, 2384, 2429, 2437, 3422), none of which asks G3.9 for the nilpotent-completion comparison.
- Automatic checks: every check passes at this head. Nothing changes outside the folder; against main the folder changes by 11 insertions and 11 deletions, with no heading added or removed and one declaration restated.
- Dependency check output: `depcheck: 200 roadmaps, 2207 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: seven `sorry` warnings and nothing else. One-tactic probes (`simp`, `rfl`, `infer_instance`) do not close `rationalHurewicz`.
- Pull request text: the title names the G3.9 pointer; the description states that this revises a roadmap on main, the two changed sentences of G3.9, the supplied formulas, and the restatement of `rationalHurewicz` in universe `u`. Each agrees with the head; no section, supplier or declaration is added or removed.

Overlap check: read SimplicialCategories and EnrichedLocalization (#2269), Straightening, InfinityCategoryFoundations and LimitsAndKanExtensions (#2270), and StableHomotopyKTheory, TangentialBordism and AlgebraicTopology on main, as the previous review has them; the change adds no object. The comparison of derived and HF_p-nilpotent completion: owner BordismFormalGroups F2.2, cited here. The Bergner and Joyal model structures and straightening: owner here (G2.11, on main); see the note for the human reviewers.

Source independence: changed passages only; 3 passages compared with 3 sources (the new G3.9 sentence with SchwedeSymSpec Chapter II §9, the `rationalHurewicz` docstring with HatcherSSAT line 2024 and HatcherAT line 15686), none shared. Largest share and comparison of contents as in the previous review (LurieHTT, 28 of about 103; independent); no layer is added, removed or reordered.

Research link: Layers 2–3 give the stable homotopy category of Hovey, Shipley and Smith (2000) and the derived p-completion that BordismFormalGroups F2.2 uses for the Adams spectral sequence; G5.5 uses the operator model of KO of Joachim (2001) and Hebestreit–Sagave (2020). This rests on README lines 49–53 and 3732–3738 and on BordismFormalGroups F2.2.

## Not verifiable

- QuillenHA, ABSClifford, McDuffSegal, SegalCategories and JoachimKO are recorded as uncertified and were not read; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Open pull requests #2269 and #2270 plan the Bergner and Joyal model structures and straightening, which G2.11 on main owns (README lines 4685–4691), and neither cites G2.11. Which side keeps them is not settled in either text.
