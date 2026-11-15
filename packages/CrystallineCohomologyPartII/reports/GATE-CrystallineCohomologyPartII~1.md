# GATE-CrystallineCohomologyPartII~1: answers to human review

One comment, one point. Files changed: `TauCetiRoadmap/CrystallineCohomologyPartII/README.md` (new section `## Provenance: existing formalizations outside Tau Ceti` before `## References`, and one new References entry). `Suggested.lean` is unchanged. Commit `edf9add8`, not pushed.

## H01 (mycaule) — applied differently

The overlap is real, but it is with this roadmap's suppliers, not with its own targets. At AxiomMath/Stacks commit `c496df0d9beea9deaeabcea8492605f9a0a2313b` (head of main and the last commit touching the directory), `StacksFrontier/AlgebraicGeometry/Crystalline` has 1009 Lean files following the Stacks chapter *Crystalline Cohomology*: PD envelopes (Tags 07H8–07HE), the crystalline sites, 07MW, 07LG, 07N5 and 07Q9–07QB. It contains no occurrence of Witt vectors, isocrystals, slopes, rigid cohomology, tubes, zeta functions, Chow groups, theta divisors or finite-field point counts, so it proves none of the targets of Layers 0–6 and none of the 5 theorems in `Suggested.lean`.

Change: README, new section `## Provenance: existing formalizations outside Tau Ceti` (line 1812), plus a References entry `AxiomStacks` pinned at that commit (line 1843). The section says what the directory formalises and what it lacks. It notes two points of contact. The PD-envelope universal property used in step 2 of §3.2 is supplied here by DerivedDeRhamCohomology §PD.6; §3.2 applies it to an ideal containing p, which is the case `dividedPowerEnvelope` covers (its hypothesis is `A.ideal.map f ≤ J`). Crystalline cohomology enters only through CrystallineCohomology §CR.4.7 and PadicDifferentialEquationsAndRigidCohomology §RD.4.37 and §RD.4.38. No target was dropped or re-scoped, because no target of this roadmap is proved there.

## Evidence (for the worker; not part of the reply)

The repository was read as data: a sparse, blob-filtered clone of the one directory into the job's scratch space. Nothing from it was built or run, and nothing from it was copied into the roadmap. The directory's Lean files number 1009 (`find … -name '*.lean' | wc -l`), which matches the reviewer's "(1009)".

Statements the repair adds, each checked against that commit:

| Claim in the new section | Evidence at `c496df0` | Result |
| --- | --- | --- |
| Apache-2.0; formalizes the Stacks project on Mathlib | `LICENSE` (Apache License 2.0); repository `README.md` | holds |
| Envelope of an ideal containing the image of the base PD ideal, universal property (07H8/07H9) | `DividedPowerEnvelope/Quotient.lean:163`, `dividedPowerEnvelope … (hJ : A.ideal.map f ≤ J)` | holds |
| Factorization, quotients, presentations, base change (07HA–07HE) | `Quotient.lean:286` (07HA), `:380` (07HB); `PolynomialPresentation.lean:56`, `PresentationKernel.lean:94` (07HC); `EnvelopeBaseChange.lean:305` (07HD); `BaseChange.lean:52` (07HE) | holds |
| Small and big crystalline sites | subdirectories `SmallSite/` (437 files), `BigSite/` (59 files) | holds |
| Crystals, connections on smooth liftings (07MW) | `SmoothLifting.lean:335` (07MW (1)); `SmallSite/SmoothLiftingConnection.lean:125` (07MW (2)) | holds |
| Affine computation by de Rham complex of the completed envelope (07LG) | `SmallSite/CrystalDeRhamDerived07LG.lean:128`: `M ⊗^∧_D Ω*_D ≅ RΓ(Cris(X/S), F)` for `X = Spec C` affine over affine `S` with `p` nilpotent, `D` the completed envelope of a polynomial presentation | holds |
| Frobenius of a nondegenerate F-crystal, isomorphism after inverting p (07N5) | `SmallSite/Frobenius07N5Theorem.lean:268`: for `X → S_0` proper smooth over a p-adically complete Noetherian base | holds |
| Iterated α_p-covers (07Q9–07QB) | `SmallSite/AlphaPCover07Q9Main.lean:111`, `SmallSite/CrisCohomologyBound07QAMain.lean:82`, `SmallSite/AlphaPCoverRelativeFrobenius07QB.lean:199` | holds |
| No Witt vectors, de Rham–Witt/Hodge–Witt, rigid cohomology, slopes, zeta functions, point counts | `grep -rl` file counts: `Witt` 0, `isocrystal` (case-insensitive) 0, `slope` 0, `rigid`/`Rigid` 0, `tube` 0, `overconvergent` 0, `zeta function` 0, `Chow` 0, `theta divisor` 0, `abelian variet` 0, `totalDegree` 0, `char_dvd_card` 0, `finite field` 0, `rational point` 0. `zeta` hits are a bound variable; `ZMod` hits are a `ZMod 2` toy complex and a ring-hom emptiness lemma | holds |
| §3.2 step 2 uses the envelope's universal property; J contains p | README §3.2 statement (J ⊂ O_P containing p) and route step 2; the base ideal (p) maps into J_n, so `A.ideal.map f ≤ J` holds | holds |
| Crystalline cohomology enters only through CR §4.7, RD §4.37, RD §4.38 | every `crys` occurrence in the README: §0.8 Check, §§3.2–3.5 (`*Needs:*` lines 776 and 830 cite RD.4.37/4.38 and CR.4.7), Layer 5 Checks, §6.13 route step 2 (CR.4.7). No section constructs a crystalline site | holds |
| `StacksFrontier` is the AI-written tier, not moved into human-reviewed `StacksCore` | repository `README.md`, section *Structure* | holds |
| Built on Lean and Mathlib v4.35.0, earlier than our pin | `lean-toolchain` `v4.35.0`, `lake-manifest.json` mathlib `inputRev` `v4.35.0`; our pin `v4.36.0-rc2` | holds |

The repair adds no mathematical statement, Check or Lean declaration, so the degenerate-case and convention items of the adversarial pass have nothing new to test. `Suggested.lean` is unchanged. Its elaborated signatures in `scratch/signatures.md` were compared with the README: none has lost a binder. That file's entry `under` (line 74) and the error "Unknown identifier `under`" are the extractor misreading the words "theorem under" across lines 73–74 of the module docstring. It is not a declaration, and the file builds.

Ownership and other roadmaps (leads; nothing edited outside this folder):

- `roadmaps grep 'AxiomMath/Stacks|StacksFrontier|AxiomStacks'` over main and the open heads finds citations only in ComplexComparisonPartII, DerivedDeRhamCohomology, HyperellipticCurves and CharacterSumsOverFiniteFields. None cites the `Crystalline` directory.
- Most of the directory's content (crystalline site, crystals, 07LG, 07N5, α_p-covers) belongs to the parent, CrystallineCohomology, which does not cite it.
- DerivedDeRhamCohomology's provenance section says no file in the three AxiomStacks directories it cites constructs PD envelopes. That is true of those directories, but `Crystalline/DividedPowerEnvelope` constructs them, which bears on its §PD.6.
- Both of these are for those roadmaps' authors, not for this one.
- The new key `AxiomStacks` is a pinned code repository, cited by commit URL as DerivedDeRhamCohomology does. It is not in `packages/CrystallineCohomologyPartII/sources.toml`, which this job may not edit; whether the manifest records code repositories is for the worker.

Untrusted text: the review comment contains no instruction, and none was found in the fetched repository files.

## Build and gate

`lake build TauCetiRoadmap.CrystallineCohomologyPartII.Suggested`: `Build completed successfully (18522 jobs).` There are 5 warnings `declaration uses 'sorry'`, at lines 95, 111, 123, 145 and 178, the five headline theorems.

Gate (after commit `edf9add8`):

    gate CrystallineCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable --pr 2265`):

    depcheck: 242 roadmaps, 2246 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.
