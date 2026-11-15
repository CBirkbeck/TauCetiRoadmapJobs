# Review of CohomologyComparisonsPartII (pull request #1364 at 0d00ac6)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 0d00ac6. The folder is unchanged; this round read the title and the description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` declares nothing: its module docstring names the eleven headline groups (§§1.6, 2.3, 3.4, 4.3–4.5, 5.2–5.3, 6.4, 6.5, 6.6, 7.3, 7.4, 7.5) as not statable" and "the targeted Lake build succeeds with no warning".
- R02 — repaired: "The layers are in dependency order. Results are cited from Besser and Huber–Kings (rigid syntomic fibre), Ertl–Nizioł, Nekovář–Nizioł, Colmez–Nizioł and Tsuji (log-syntomic complexes and period maps), Hyodo–Kato and Nekovář–Nizioł (adapters) and Asakura–Miyatani (relative coefficients)."

## Verified sound

### The description against the head

| Sentence of the description | Head | Result |
|---|---|---|
| Title "CohomologyComparisonsPartII: roadmap"; "adds the roadmap"; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | folder not on `origin/main`; the diff adds exactly these three files, 1005 insertions, 0 deletions | agrees |
| "`Suggested.lean` declares nothing … eleven headline groups (§§1.6, 2.3, 3.4, 4.3–4.5, 5.2–5.3, 6.4, 6.5, 6.6, 7.3, 7.4, 7.5)" | `Suggested.lean` lines 9–35: 11 bullets, with exactly these section numbers in this order; lines 40–42: empty namespace | agrees |
| "Results are cited from Besser and Huber–Kings (rigid syntomic fibre)" | Layer 2 locators: BesserI 27, HuberKings 13, no other source | agrees |
| "Ertl–Nizioł, Nekovář–Nizioł, Colmez–Nizioł and Tsuji (log-syntomic complexes and period maps)" | Layer 3: EN 12, NN 8; Layer 4: EN 33, CN 31, NN 5, TsujiNearby 4 | agrees |
| "Hyodo–Kato and Nekovář–Nizioł (adapters) and Asakura–Miyatani (relative coefficients)" | Layer 5: HK 14, NN 14; Layers 1, 6, 7: AM 22, 37, 13 (Layer 7 also BesserI 4) | agrees |
| "consumer restrictions such as p>2 do not narrow them" | README line 19: the curve application of PadicHodgeRegulators keeps p>2; "These consumer restrictions do not narrow the classical producers" | agrees |
| "PadicHodgeRegulators and EllipticRegulators are consumers, and ColemanIntegrationPartII and PrismaticCohomologyPartIII are named only to fix ownership boundaries" | lines 942–943 (consumers); line 945 ("requires no construction from this Part II"); line 17 (PrismaticCohomologyPartIII §§6.9, 6.29–6.32 owns the prismatic theory); neither has a `From` subsection | agrees |
| `Depends on`: seven open suppliers | 13 distinct `### From TauCetiRoadmap.*` suppliers (lines 64–170); 6 are on main (AdicSpacesPartIV, RigidAnalyticGeometry, EnhancedDerivedSheaves, EtaleCohomologyFoundations, DerivedModuleAlgebra, GrothendieckEulerForms); the other 7 are the seven listed | agrees |
| "the targeted Lake build succeeds with no warning … gate passes with every counter 0 … dependency check shows 0 problems" | rerun below: all counters 0, `0 problem(s)`, elaboration silent | agrees |
| summary block: producers, period ranges, adapters, exact category, residues, specialization, §7.4 comparison over W(k), §7.5 absolute values | README Summary (line 3), Conventions lines 23–25, §7.4, §7.5 | agrees |

### Adversarial rows for statements the description cites

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| "filtered Frobenius connections are not abelian" (hence exact-category Yoneda Ext, §1.3) | rank 1 over a field K, trivial connection and Frobenius: V with F⁰=K, F¹=0; V′ with F¹=K, F²=0; identity V→V′ | F⁰V=K⊂F⁰V′=K, F¹V=0⊂F¹V′=K: a morphism. Kernel 0, cokernel 0. Inverse sends F¹V′=K to F¹V=0: not a morphism | mono and epi, not iso: not abelian; the identity is not strict, so the exact structure excludes it |
| "Over smooth affine bases with a Frobenius lift" only in the relative layers (Conventions line 25: valuation 1<e when e>1) | e=1; e=3 with π³=p, p=2 and p=5 | e=3: F_V(π)³=p·unit gives v(F_V(π))=1; v(π^p)=p≥2; v(F_V(π)−π^p)=1<3=v(p): no lift. e=1: bound reads 1<1, false; Witt Frobenius exists | obstruction exactly for e>1, as stated |
| eleven headline groups, each "not statable" | grep of the pinned libraries for the carriers | `FilFMIC`: 0 hits; "rigid cohomology", `RigidCohomology`, `LogScheme`: 2 hits, both bibliography lines (`TauCeti/RingTheory/Dagger/IntegralWashnitzer.lean` line 81, `TauCeti/RingTheory/Dagger/Omega/Basic.lean` line 57); no declaration | docstring and description agree; nothing statable is absent |

The rows for every statement of the folder stand as in the previous review, of `0d00ac6`: the diff changes no statement.

- Gate rerun at 0d00ac6 against `origin/main`: every counter 0, `OK`, exit 0; the worker's record also has build=0.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean`: exit 0, no output. No declaration, so no signature to `#check` and nothing for the one-tactic probe.
- `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. Folder change since the previous review: 0 lines.
- Source locators: none re-read (no changed passage; no sampled target falls in one). Locators counted per layer for the table above: 8 sources, Layers 1–7.
- Cross-roadmap citations: the overlap lead "RigidAnalyticGeometry §8.4 dropped by its open revision" stands as resolved in the previous review (that head maps §8.4 to AdicSpacesPartIII R3.7, on main); the lead "HuberKings §2.2" is a source locator, not a roadmap citation.
- Remark, untouched text: the README states contract `local-period-koszul-resolution` (line 158) with AInfCohomology §AI.1.7 for the commuting Γ′_R directions; the package's declared gap of the same slug names QWittVectors §1.7 there.

Overlap check: read PadicHodgeRegulators, CohomologyComparisons, CstConjectureForDaggerVarieties; nothing shared (as in the previous review; neither this folder nor the overlap list changed).

Source independence: changed passages only: 0 passages compared (the folder did not change); largest share AM, 159 of 572 counted locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "AI assistance" sentence (three review rounds and two red-team rounds on the job board): the board's history is not among the files of this review.
- The cited sections of AInfCohomology, CohomologyComparisons, ColemanIntegration, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology and PrismaticCohomologyPartIII are not on main and their heads are not among the files given: ownership against those pull requests was not checked again. BesserII remains settled as uncertified.

## Source issues

- none

## For the human reviewers

- none
