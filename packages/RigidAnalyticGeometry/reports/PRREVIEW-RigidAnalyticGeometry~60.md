# Review of RigidAnalyticGeometry (pull request #1807 at 4722dba)

**Verdict:** accepted

This is an incremental re-review. `TauCetiRoadmap/RigidAnalyticGeometry/` has 0 changed lines since `6fcc928`. The commits since then changed seven other folders that belong to this pull request. Of those, this README cites only AdicSpacesPartIII, which changed in commit `a8777164`. I found no finding.

## Previous findings

- The review of `6fcc928` raised no finding, so there is nothing to carry over.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3: `A→A_L` is faithfully flat and `A_L⊗_A M≅L⊗̂_K M`. Part III *affinoid-completed-field-extension* (line 10718) cites it. | `A=K⟨T⟩/(T²−T)≅K×K`, `M=A/(T)` | `A_L=L×L`. The maximal ideals extend to `0×L` and `L×0`, both proper. `A_L⊗_A M=L=L⊗̂_K K`. | true | none |
| §1.3, inseparable case | `K=𝔽_p((t))`, `L=𝔽_p((t^{1/p}))`, `A=K⟨T⟩/(Tᵖ−t)=K(t^{1/p})` | `A_L=L[T]/(T−t^{1/p})ᵖ` is local of length `p` and free of rank `p` over `A`, hence faithfully flat. It is nonreduced, and §1.3 claims no reducedness. | true | none |
| Line 74 (§7.5 → Part III *proper-cohomology-adic-completion*, line 10627, unchanged), degree one | `A=K⟨T⟩`, `X=P¹_A`, `F=𝒪(−2)`, `a=T`, `i=1` | `M=A`, `H¹(F/TᵏF)=A/Tᵏ` because `H²=0`. `R_k=TᵏA`, `Q_k=0`, and `M^∧_T=K⟦T⟧=lim K[T]/Tᵏ`. | true | none |
| Line 74, torsion coefficients | `X=Sp K⟨T⟩`, `F=𝒪⊕𝒪/(T)`, `a=T`, `i=0` | `M=A⊕K`. `R_k=TᵏA⊕0=TᵏM` for `k≥1`, and `aR_k=R_{k+1}` for all `k≥0`. `Q_k=0`. Both sides are `K⟦T⟧⊕K`. | true | none |
| Line 74, a general ideal | `A=K⟨T₁,T₂⟩`, `F=𝒪`, `i=0`, `J=(T₁,T₂)` | `M^∧_J=K⟦T₁,T₂⟧`, and `lim A/Jᵏ=lim K[T₁,T₂]/(T₁,T₂)ᵏ` is the same ring. | true | none |
| Line 74 locators against [Kiehl-E] | Definition 3.1, Theorem 3.4, Theorem 3.7, the Rees ring | p. 206 (KiehlE lines 632, 647–660). p. 210 (lines 809–815). Rees-ring finiteness on pp. 207–208 (lines 679–715). These match the README. | true | none |
| Lines 47–61 and 71–75: the sections of the 16 cited Part III targets | The section boundaries at this head | R3.3 (lines 9485–9667) holds *surjection-small-perturbation* (line 9499). R3.6 (10087–10860) holds the 12 cited targets (10323–10793). R3.7 (10861–11171) holds 3 (10904–11133). | resolved | none |

The rows for statements that this change does not touch stand as in the review of `6fcc928`.

- **Gate.**
  - The worker's gate passes every check, with `build=0`.
  - My own run reports `outside-folder=24`. All 24 hits are the README and `Suggested.lean` of the twelve folders the brief names as this pull request's own.
  - `git diff --stat origin/main...HEAD` with those folders excluded is empty.
  - Between `6fcc928` and `4722dba`, neither the folder nor `lake-manifest.json` changed.
- **Dependency check (verbatim):** `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`.
- **Elaboration.**
  - `lake env lean` on `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` exits 0.
  - Its only output is twelve `declaration uses sorry` warnings, at lines 94, 110, 127, 136, 154, 169, 190, 204, 229, 242, 264 and 282.
  - The file and the pins are unchanged, so the earlier `#check @` comparison and padding probe still hold. `signatures.md` reports 0 dropped binders.
- **Cross-roadmap citations.**
  - All 16 Part III target names and the headings R3.2–R3.4, R3.6 and R3.7 resolve at this head.
  - The Part III diff since `6fcc928` has no line naming RigidAnalyticGeometry or the two targets that cite it. Its R3 hunks touch only Checks for differentials, `GlueingSquare`, the traces, and `IsNoetherianType`.
  - Part III cites §§1.3, 2.3, 6.3 and 8.1 and Layers 3–5 of this roadmap, and all of them exist (README lines 774, 1055, 1754, 1931 and 1135–1652).
- **Source locators:** 4 [Kiehl-E] locators checked against the text, as in the table.
- **Overlap check:** I read AdicSpacesPartV, ClassicalAdicEtaleCohomology, PadicFunctionalAnalysis, LocallyAnalyticDistributions and PerfectoidTowers (open), and AdicSpacesPartIV, AdicSpacesPartII and RestrictedPowerSeries (main). The shared objects and their owners:
  - The §7.2 slope predicates are pinned Tau Ceti `Polynomial.IsSlopeLE` and `ContinuousLinearMap.IsSlopeDecomposition`. Their geometric comparison is owned by LocallyAnalyticDistributions §4.16.
  - The affinoid carriers and the rigid category belong to this roadmap. Parts II, IV and V consume them.
  - Restricted series belong to RestrictedPowerSeries.
  - Countable-type splitting belongs to PadicFunctionalAnalysis §2.4.
  - ClassicalAdicEtaleCohomology and PerfectoidTowers share nothing with this roadmap.
  - Part V cites §§7.3–7.4, which stays valid through the old → new table at lines 69–75.
- **Description.**
  - The summary sentence, the loop sentence and the RigidAnalyticGeometry paragraph match this head: twelve headlines, the seven items named not statable, the §§7.1, 7.3–7.5 and 8.4 table, no CompactOperators supplier, and §§4.3, 5.3 and 8.2 present.
  - Part III's "drops 31 of 66" matches the head: 66 named declarations on main, 37 at this head.
  - The earlier remark about "change only in comments" is resolved.
- **Remark on untouched text (no change asked):** lines 53–54 say Part III's *almost-noetherian-integral-affinoid-modules* "consumes §2.3's presentation-ring integrality". At this head, and at `6fcc928`, its *Needs:* (Part III line 10804) does not cite §2.3. Part III cites §2.3 from *affinoid-power-bounded-integral* (lines 5152 and 5197).

## Not verifiable

- [BGR] 6.1.1 and 6.1.1/12, cited in §1.3: the manifest records them as `uncertified` (paywalled), and they are settled.

## Source issues

- none
