# Review of RigidAnalyticGeometry (pull request #1807 at 78bda3b)

**Verdict:** accepted

This is an incremental re-review. `TauCetiRoadmap/RigidAnalyticGeometry/` has not changed since `4722dba`. The one commit since then, `78bda3b9`, changes only `TauCetiRoadmap/AdicSpacesPartIII/README.md` and `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean`. This review finds nothing to fix.

## Previous findings

- The review of `4722dba` raised no finding, so there is nothing to carry over.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3: `A→A_L` is faithfully flat and `A_L⊗_A M≅L⊗̂_K M`. Part III *affinoid-completed-field-extension* (line 10676) cites it. | `K=ℚ₂`, `L=ℚ₂(√2)`, `A=K⟨T⟩/(T²−2)`, `M=A` | The roots `±√2` have absolute value `2^(-1/2)≤1`, so `A=K(√2)`. Since `√2≠−√2`, `A_L=L[T]/(T²−2)≅L×L`, of `K`-dimension `4=2·2`. `A_L` is nonzero and free over the field `A`, so the map is faithfully flat. Both sides are `A_L`. | true | none |
| §1.3, a torsion module over a non-algebraic `L` | `K=ℚ_p`, `L=ℂ_p`, `A=K⟨T⟩`, `M=A/(T−c)` with `c∈K` and `\|c\|≤1` | `A_L=L⟨T⟩`. The ideal `(T−c)` extends to the proper ideal `(T−c)L⟨T⟩`. `A_L⊗_A M=L⟨T⟩/(T−c)=L`, and `L⊗̂_K M=L⊗̂_K K=L`. | true | none |
| The §7.5 row of the table: Part III *proper-cohomology-adic-completion* (line 10585) with square-zero coefficients | `A=K⟨T⟩`, `X=P¹_A`, `F=𝒪_{P¹_{A/T²}}(−2)`, `a=T`, `i=1` | `M=A/(T²)` and `H¹(F/TF)=K`. `R₀=M`, `R₁=TM≅K`, and `R_k=0=TᵏM` for `k≥2`. `aR_k=R_{k+1}` for every `k`. `Q_k=0` because `H²=0`. `M^∧_T=A/(T²)=lim`. | true | none |
| Lines 47–61 and 71–75: the Part III sections cited at this head | Heading and target lines at `78bda3b` | R3.2 is at line 9163 and R3.4 at line 9622. R3.3 (9439–9621) holds *surjection-small-perturbation* at line 9453. R3.6 (10045–10818) holds the 12 cited targets (lines 10281–10751). R3.7 (10819–11129) holds 3 (lines 10862, 11058, 11091). | resolved | none |
| Part III's citations of this roadmap | Lines naming RigidAnalyticGeometry at `4722dba` and at `78bda3b` | Both heads have 21 such lines. Their text is identical; only the line numbers moved. | unchanged | none |

The rows for statements this change does not touch stand as in the review of `4722dba`.

- **Gate.**
  - The worker's gate passes every check, with `build=0`.
  - My own run reports `outside-folder=24`. These are the README and `Suggested.lean` of the twelve folders the brief names as this pull request's own.
  - `git diff --stat origin/main...HEAD` with those folders excluded is empty.
- **Dependency check (verbatim):** `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`.
- **Elaboration.**
  - `lake env lean` on `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` exits 0.
  - Its only output is twelve `declaration uses sorry` warnings, at lines 94, 110, 127, 136, 154, 169, 190, 204, 229, 242, 264 and 282.
  - The file and `lake-manifest.json` are unchanged since `4722dba`, so the earlier `#check @` comparison and padding probe still hold. `signatures.md` reports 0 dropped binders.
- **Part III diff since `4722dba`.**
  - It touches 113 lines added and 178 removed. None of those lines names this roadmap or any of the 16 cited targets.
  - Its `Suggested.lean` deletes `fracPowGE`, `fracPowLE` and `fracPow_inter_spa`. This README cites none of them.
- **Description.**
  - The RigidAnalyticGeometry paragraph and the summary's sentence on R3.6 match this head: twelve headlines, the seven items named not statable, the table for §§7.1, 7.3–7.5 and 8.4, the supplier set, and the headings §§4.3, 5.3 and 8.2.
  - The Part III sentence "R3.6 proves Kiehl's formal functions, citing RigidAnalyticGeometry §1.3" matches Part III lines 10585 and 10680.
  - Its "drops 34 of 66" rose by three since the last review, matching the three deletions above.
- **Overlap check:** I read AdicSpacesPartV, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicFunctionalAnalysis and PerfectoidTowers (open), and AdicSpacesPartIV, AdicSpacesPartII and RestrictedPowerSeries (main). The owners are as in the review of `4722dba`:
  - The §7.2 slope predicates are pinned in Tau Ceti. Their geometric comparison is LocallyAnalyticDistributions §4.16 (its line 3036).
  - Countable-type splitting is PadicFunctionalAnalysis §2.4.
  - Affinoid carriers belong to this roadmap. AdicSpacesPartV consumes them (its lines 74–91).
  - `overlaps.md` lists no dropped or revision-only id.
- **Remark on untouched text (no change asked):** lines 53–54 and the Downstream consumers bullet say that Part III's *almost-noetherian-integral-affinoid-modules* consumes §2.3. Its *Needs:* (Part III lines 10762–10764) still does not cite §2.3.

## Not verifiable

- [BGR] 6.1.1 and 6.1.1/12, cited in §1.3: the manifest records them as `uncertified` (paywalled), and they are settled.

## Source issues

- none
