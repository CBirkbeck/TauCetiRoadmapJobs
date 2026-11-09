# Review of ComplexKahlerGeometry (pull request #1398 at 1038b16)

**Verdict:** needs changes

A full review of this head. It is byte-identical to the head the previous review read, so none of that review's five findings is repaired (R01, R02, R05, R06, R07 below). The full pass adds five findings: two two-owner conflicts with open roadmaps (P2), and three P3 items. Paths are relative to `TauCetiRoadmap/ComplexKahlerGeometry/` unless they are library paths or another roadmap's. "Branch pin" means this head's `lake-manifest.json`: Tau Ceti 358314d4, Mathlib f6090c70. "Main's pin" means the content repository's manifest: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.

## R01 (P1) — The README's Tau Ceti contract is written against main's pin; this head pins 358314d4 and conflicts with main

**Location.** `lake-manifest.json`. `README.md:195–345` (From Tau Ceti) and the layer citations, e.g. `:81` "The type projections on forms are Tau Ceti's `TauCeti.SmoothAlmostComplexStructure.typeProjection`".

**Claim.** Of the 219 backticked library names in the README that resolve at either pin, 118 resolve only at main's pin, none only at the branch pin. `Suggested.lean` and the gate run at the branch pin, so 118 cited supplier declarations do not exist where they are cited. The pull request cannot merge as it stands.

**Witness.** Branch-pin `TauCeti/` has zero files containing `deRhamCohomology`, `IsFilledIn`, `typeProjection`, `conjWirtingerDeriv`, `formHodgeStar`, `codifferential`; main's pin has them (`DeRham/Basic.lean:127`, `Topology/FilledIn.lean:61`). `git merge-tree origin/main HEAD`: "CONFLICT (content): Merge conflict in …/Suggested.lean".

**Repair.** Move the head to main's pin: merge `origin/main`, keeping this head's `Suggested.lean`, or carry out the rebase onto #1234 that the description announces (#1234's manifest already pins 2fd255d9 and 1b1ccf4b). Then re-elaborate and apply R02 and R08. The previous review elaborated this `Suggested.lean`, which has not changed since, at main's pins: exit 0, ten `sorry` warnings.

## R02 (P2) — After R01: three headlines statable at main's pin are absent, and three statements re-encode library objects

**Location.** `Suggested.lean:19–31` ("Three of them are statable on carriers that the README's Tau Ceti contract names and that the Tau Ceti revision this file is built against does not have"); `:77–79` (`hRunge`); `:111–112` (the solver's ∂̄); `:185` (`IsDomain … ∧`).

**Claim.** At main's pin, the local Newlander–Nirenberg theorem, the local Dolbeault–Grothendieck lemma on a polydisc and the de Rham Hodge decomposition (unique harmonic representative) are statable on native carriers. All three are absent. `hRunge` is the body of `TauCeti.IsFilledIn K Ω`. The solver's left side is `TauCeti.conjWirtingerDeriv (fun w ↦ u ((p, q), w)) z 1`. The `IsDomain` conjunct is an instance, and it is also implied by the second conjunct: `UniqueFactorizationMonoid` extends `IsCancelMulZero`, and the stalk is a nontrivial local ring.

**Witness.** At 2fd255d9: `Symplectic/Manifold/Nijenhuis.lean:158` (`nijenhuis`), `Complex/AlmostComplexStructure.lean:76` (`ofComplexManifold`), `DifferentialForm/AlmostComplexType.lean:201` (`IsOfType`), `Dolbeault/Basic.lean:95` (`delBar`), `Riemannian/HodgeStar.lean:73`, `Riemannian/Codifferential.lean:88`, `DeRham/Basic.lean:127`, `Topology/FilledIn.lean:61–63`, `StructureSheaf/Domain.lean:93`.

**Repair.** After R01:
- State the three theorems on those carriers.
- Delete `:19–31`.
- Write `hRunge` as `TauCeti.IsFilledIn K Ω`, and the solver's equation through `TauCeti.conjWirtingerDeriv`.
- Drop the `IsDomain` conjunct.
- Import the three modules, and add the new names to `README.md:65–70`.

## R03 (P2) — The finite-rank Runge operator and planar complex two-form exactness have two owners: GlobalHolomorphicFunctions #992

**Location.** `README.md:29–30` ("Layer 2 owns finite-rank Runge approximation"), `:32` ("Layer 5 its planar de Rham consequence"), `:56–59` ("nothing is imported from them for those objects"); `Suggested.lean:74`; `§5.4` (`:1621–1629`).

**Claim.** #992 (head af99bc58) states the same operator as its own headline and names ComplexKahlerGeometry K2 as its consumer. It also says that K5a consumes its complex two-form exactness. This README says it owns both and imports nothing from #992, so each roadmap names the other as consumer. Main's version of this README consumes #992's GH0 and GH5.1 (main `README.md:35, 200`), so this pull request reverses the direction. The description does not name #992.

**Witness.** #992 `GlobalHolomorphicFunctions/README.md:1159`: "`exists_finite_rank_runge_operator`, the finite-rank linear Runge operator used by GH5 and CKG K2". It repeats the hand-off at `:2132–2135`. Its `Suggested.lean:150` has the quantifiers of `Suggested.lean:74`; the weights `w j` are absorbable into `g j`.

**Repair.** Give the objects one owner. If this roadmap, on main, keeps them (the README's choice):
- Name #992 in the description's merge-order paragraph.
- Record there that #992 replaces `README.md:58–59, 1159, 2132–2135` with citations of this roadmap's §2.1 and §5.4, and deletes its `Suggested.lean:150`.

Otherwise, consume GH0 and GH5.1 as main does and delete `finite_rank_runge_approximation` here.

## R04 (P2) — The open-pair relative de Rham comparison and compact-support integration formula have two owners: DeRhamCohomologyAndDuality #1768

**Location.** `README.md:46–48` ("§6.1 owns the boundaryless open-pair relative de Rham comparison and the compact-support integration formula"), `:59–63`, §6.1 "Relative integration contract" (`:2202–2246`).

**Claim.** #1768 (head 1b57dbe0) calls itself the single owner of these statements and lists this roadmap's K6.1 as their consumer. This README owns their boundaryless instances and calls #1768 downstream. #1768 consumes nothing from this roadmap: its suppliers are Mathlib, Tau Ceti, DifferentialGeometry and AlgebraicTopology. The description does not name #1768.

**Witness.** #1768 `DeRhamCohomologyAndDuality/README.md:70–76`: §§2.4, 3.1–3.3 and 4.1 "have a single owner, this roadmap … The open-pair comparison and compact-support formula that ComplexKahlerGeometry K6.1 uses … consumed from §§2.4, 3.1–3.3 and 4.1". `:695–700` repeats this; its supplier sections are `:113–178`.

**Repair.** Description only, the same repair the review of #1234's head asks for this folder:
- Name #1768 in the merge-order paragraph.
- Record that #1768 replaces its `README.md:70–76` and `:695–700` with a citation of this roadmap's §6.1 for the boundaryless instances, and keeps its corners extension and §4.2.

Nothing in this folder changes.

## R05 (P3) — Item 5.5a exists only in DifferentialGeometry's open revision #886, the description does not name it, and "open revision" is process wording

**Location.** `README.md:1192` ("its densities part, §5.5a in that roadmap's open revision"), `:1236` ("5.5 (densities; 5.5a in its open revision)"), `:1564–1565`; the description's dependency block.

**Claim.** Both ids resolve. Main's `DifferentialGeometry/README.md:528` has 5.5 with `RoughDensity`. #886 (e7464d11) has 5.5a at `:1250` and maps 5.5 to 5.5a/5.5b at `:38–39`. Citing 5.5a makes #886 a dependency the description must name. "In its open revision" refers to pull-request state and becomes false when #886 merges.

**Witness.** The description's dependency block names #1234, #1027 and #1028 only. `overlaps.md` flags DifferentialGeometry §5.5 as dropped by #886.

**Repair.**
- At all three places, write "§5.5 (densities, §5.5a)" without "open revision". It resolves before and after #886 merges, through #886's own map.
- Name #886 in the description's dependency block.

## R06 (P3) — The description's merge order is false at this head, it states no order for three conflicting heads, and it describes head b8db421

**Location.** The pull-request description: "#1234 merges first; this pull request is rebased onto #1234's branch … stated on top of #1234's K6.0"; "The new companion file …".

**Claim.** This head is not based on #1234: the merge base with #1234's head 3c407e05 is a0ad405, the same as with main. The two heads conflict in both files. No order is given against #1807, #1808 or #1854, which conflict here per `overlaps.md`. The description still describes head b8db421, which had a companion file and three admitted targets. The previous review's statement that the description gives no order at all was wrong about #1234.

**Witness.** `git merge-tree 3c407e05 HEAD`: CONFLICT in `README.md` and `Suggested.lean`. With #1854 (0ab19827): CONFLICT in `Suggested.lean`. The folder holds `PROGRESS.md`, `README.md`, `STATUS.md`, `Suggested.lean`, `metadata.toml`; ten admitted theorems.

**Repair.** Description only:
- Rewrite the summary for this head.
- Either do the rebase onto #1234 now (it also repairs R01 and R08) or word it as future ("rebases onto #1234 before either merges").
- State the order against #1807, #1808 and #1854.

## R07 (P3) — GeometricTopology 1.7 and 1.7.1 exist only at the head of open revision #903, which the description does not name

**Location.** `README.md:2559` ("GeometricTopology Layer 1.7 … smooth classification of compact surfaces"), `:2562` ("Layer 1.7.1 … polygon/CW model"), `:2635`, `:2835`.

**Claim.** The cited content supports the use (classification, genus, `rank H₁ = 2j`, one-vertex polygon), but only at #903's head. #903 revises an existing roadmap, so citing its numbering makes it a dependency the description must name.

**Witness.** Main's `GeometricTopology/README.md` Layer 1 (`:177–289`) has no surface classification and no 1.7 heading. #903 (5859c0dc) has `:1049` "### 1.7 Compact smooth surfaces" and `:1101` "### 1.7.1 Polyhedral surfaces…".

**Repair.** Name #903 in the description's dependency block. Nothing in the folder changes.

## R08 (P3) — At main's pin, K8's spectral sequence and K7.2's CW structure of ℂPⁿ are Tau Ceti's, but the README sources or rebuilds them

**Location.** `README.md:2642–2645` ("Consume DGFloer's generic filtered-complex spectral sequence … do not create another spectral-sequence object"), `:2763–2764`, `:2779`, `:2789`. `:2474–2477` ("construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension").

**Claim.** After R01, Tau Ceti provides:
- the spectral sequence of a filtered cochain complex, with its first-page differential, strong convergence for finite filtrations and the comparison on later pages;
- a complex projective space with an even-cell CW structure and its singular homology.

What exists at the pin is cited, not sourced from a roadmap or rebuilt. #1234's head already cites both.

**Witness.** At 2fd255d9:
- `Algebra/Homology/SpectralSequence/Filtered/FirstPage.lean` (`CochainComplex.spectralSequence_first_page_d_eq`), `Filtered/Convergence.lean` (`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`), `Comparison.lean`.
- `AlgebraicTopology/Cellular/ComplexProjective.lean` (`TauCeti.ComplexProjectiveSpace.cwComplex`, `singularHomologyIso`).
- #1234 `README.md:67, 2031–2042, 2159, 2513–2545`.

**Repair.** After R01:
- K8 consumes these Tau Ceti declarations, and DGFloer stops being cited for the generic spectral sequence.
- K7.1 adds the homeomorphism `[v] ↦ [v/‖v‖]` from `Projectivization ℂ (Fin (n+1) → ℂ)` to `TauCeti.ComplexProjectiveSpace n` as a target.
- K7.2 transports `cwComplex` and the additive homology along it, and keeps the cup ring, the normalisation of u and the de Rham comparison as its own targets.

## R09 (P3) — K5a no longer names the BundleTest, BundleDistribution and BundleSobolev carriers that roadmaps on main cite, and uses two of them undefined

**Location.** `README.md:1194–1205` (the test and distribution spaces are defined without names); `:1366` "the subspace of BundleDistribution(E)"; `:1545` "Prove BundleSobolev E 0 and B2's geometric L² …"; `:1411–1417` (real H^s, unnamed).

**Claim.** Main's version of this roadmap names `BundleTest`, `BundleDistribution`, `RealBundleTest` and `RealBundleSobolev` in its README and declares `BundleTest`, `BundleDistribution` and `BundleSobolev` in its `Suggested.lean`. Roadmaps on main cite these names. This head drops them without an old → new mapping, yet still uses two of them in `:1366` and `:1545` without a definition.

**Witness.** On main: `GeometricCurrents/README.md:43, 140` ("BundleTest(V_k* ⊗ D)"), `:162` ("BundleDistribution(V_k)"); `Hyperfunctions/README.md:270` ("K5a's BundleTest construction"); `SymplecticGeometry/HamiltonianReduction/README.md:319` ("K5's actual `BundleSobolev E s` carrier"); `Yamabe/README.md:113` ("RealBundleSobolev"). Open #848 cites them too (`README.md:155, 258–259, 3710, 3770`).

**Repair.** Name the carriers in prose where they are defined, without backticks, so that `Suggested.lean` is unaffected:
- §5.1: "the density-valued dual-bundle test space BundleTest(E)" and "the bundle-distribution space BundleDistribution(E)".
- §5.4: "H^s(M;E), written BundleSobolev E s".
- The real case: "RealBundleTest(V)" and "RealBundleSobolev V s".

## R10 (P3) — "The course's" pairing and norms refer to a source the roadmap never names

**Location.** `README.md:1434–1435` ("compare the course's Fourier-side bilinear pairing"), `:1443` ("the course's angular-weight norms with their chosen pairing constant").

**Claim.** No course is introduced in the README or listed in References. The only course notes cited are Rainer's complex-analysis notes, which contain no Fourier pairing. A reader cannot tell which normalisation "the course" fixes.

**Witness.** References (`:2854–2876`) list no Fourier or Sobolev course; `rainer-advanced-complex-analysis` contains the word "Fourier" zero times. `B_F` is defined in place (`:1435–1436`), and the angular weight `〈ξ〉^s` is defined at `:1516–1520`.

**Repair.** Delete "the course's" in both places, since both objects are defined in the text. Alternatively, name the source with a locator in References.

## Previous findings

- R01 (previous) — not repaired. The manifest still pins 358314d4, and `git merge-tree origin/main HEAD` still reports the `Suggested.lean` conflict (main now at 32a0bcc). Re-raised as R01, with the count of names that resolve only at main's pin.
- R02 (previous) — not repaired. `Suggested.lean` is unchanged (`:19–31`, `:77–79`, `:111–112`, `:185`). Re-raised as R02.
- R03 (previous) — not repaired: the description still omits #886. Re-raised as R05, which adds the timeless wording.
- R04 (previous) — not repaired. Re-raised as R06, corrected: an order with #1234 is stated, but its claim that this head is rebased onto #1234 is false.
- R05 (previous) — not repaired: `README.md:2559, 2562` are unchanged and #903 is not named. Re-raised as R07.

## Verified sound

### Gate, dependency check, build, signatures, padding

- **Worktree.** Clean at `1038b1677f1475f5ca42eefcc53825d1430eca32`. `git diff --stat origin/main...HEAD` outside the folder: empty. Folder diff since the previous review's head: empty.
- **Gate**, rerun from the worktree with `--base origin/main`; the worker's run at this head also reports `build=0`:

```text
gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- **Dependency check (movable).**

```text
depcheck: 239 roadmaps, 2324 edges, 0 problem(s)
```

  It reports no UPWARD and no CYCLE line. VariationalMethods (#1028) and UnboundedOperators (#1027) are new-roadmap pull requests named in the description's dependency block.
- **Elaboration at the branch pin.** `lake env lean Suggested.lean`: exit 0 in 15 s, with exactly ten ``declaration uses `sorry` `` warnings, at lines 74, 94, 123, 137, 155, 172, 181, 195, 208 and 226.
- **Signatures.** I ran `#check @name` for all ten declarations in one scratch copy, elaborated once. Every type equals `scratch/signatures.md` and the README statements (`:551–565`, `:611–624`, `:789–799`, `:869–881`, `:889–895`, `:909–914`). There is no `def` or `instance`, so no section binder can be lost. Nothing changed.
- **Padding probe.** I replaced every `sorry` with `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | decide | (constructor <;> infer_instance) | (exact ⟨inferInstance, inferInstance⟩)`. All ten fail, with errors at lines 88, 114, 130, 147, 167, 177, 188, 200, 217 and 235; line 188 fails to synthesize `IsDomain`/`UFM`, which is R02's pin difference. Mathlib's `PowerSeries/WeierstrassPreparation.lean` treats formal power series over complete local rings, not convergent germs, so `weierstrass_*` do not restate it.
- **Form.** `module`, `public import Mathlib`, one module docstring, one namespace, `theorem` only. There is no `lemma`, `set_option`, `example`, `#eval`, `#print` or sorry'd data.

### Seeded sample (every locator opened)

- **3.0 K3.0.** The section has no source locator. `DifferentiableOn.analyticOnNhd_of_finiteDimensional`, `TauCeti.analyticOnNhd_iff_differentiableOn_of_finiteDimensional`, `TauCeti.analyticAt_circleIntegral`, `TauCeti.analyticOnNhd_circleIntegral`, `AnalyticAt.restrictScalars` and `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` exist at both pins. `ContinuousOn.analyticOnNhd_of_differentiableAt_update` and the two `IsManifold.*restrictScalars_of_ne_zero` exist at main's pin only (R01). ComplexManifolds Milestone 1 is main `:172`; RealAlgebraicGeometry Layer 7 is `Completed/…:479`.
- **3.1 K3.HolomorphicStalk** (`demailly-agbook`; the page markers equal printed pages):
  - (2.1) p. 80, line 3794: order exactly s, unit times Weierstrass polynomial with `a_k(0)=0`.
  - (2.3)–(2.4) p. 80, lines 3804–3817: division with unique representation.
  - Th. 2.7 p. 81, line 3872; Th. 2.10 p. 82, line 3931.
  - (3.19) p. 89, line 4286; (4.22) p. 97, line 4742 (called Hilbert's Nullstellensatz, as the Lean docstring says).
  - (4.29) p. 99, line 4842; (4.31) p. 100, line 4929.
  - Griffiths–Harris is uncertified.
- **4.1 K4.** Demailly II (3.1)–(3.3), pp. 83–85, lines 3968, 4007, 4047: locally free sheaves, transition cocycles, vector bundles.
- **5.1 K5a.** The section has no source locator. DifferentialGeometry 0.1–0.4 (main `:272–294`), 5.5 (`:528`), 12.4 (`:923`); SBC B2.1–B2.4 (`:559–776`); PDO P1.0 (`:164`). `TestFunction.continuous_iff_continuous_comp`, `ContMDiffSection`, `TauCeti.riemannianVolume` and `TauCeti.isLocallyFiniteMeasure_riemannianVolume` exist at both pins; the star names are R01.
- **5.2.** Hörmander Th. 2.3.5 is uncertified (Not verifiable). The Checks are recomputed in rows 43–44. Hyperfunctions HF5 is main `:1102`.
- **5.3.** At the branch pin: `BoundedContinuousFunction.arzela_ascoli` (`ArzelaAscoli.lean:109`), and `MontelSpace` (`Montel.lean:45–47`, closed plus von Neumann bounded implies compact, as the README says, with no barrelledness). `ContinuousLinearEquiv.toCompactConvergenceCLM` is present.
- **5.4.** Demailly VI Th. 3.9 p. 292, line 14386: `d⋆=(−1)^(mp+1)⋆d⋆`. Tau Ceti `Codifferential.lean:80–88` at main's pin uses `(−1)^(m(j+1)+1)` on degree j; it agrees with the README (row 17). PDE A3 is `:769` and B9 is `:1148`. #1028 has `CompactFormPair.operatorDomainV` (`:845`), `…shifted_inverse` (`:849`) and `…_iff_summable` (`:884`). #1027 has UO-D06 at `:703` and `existsUnique_selfAdjoint_of_closed_form` at `:728`.
- **5.5.** Demailly VI (3.1)–(3.5) p. 291, lines 14323–14352; Th. 3.9 p. 292, line 14386; Remark 3.10 p. 293 (m even gives `−⋆d⋆`). Demailly I (3.1) p. 20, line 879. DifferentialGeometry 0.3 is `:284`, 0.4 is `:294` and 1.1 is `:315`.
- **5.6.** The section has no source locator. VariationalMethods §3.1 is #1028 `:562`.
- **5.8.** Demailly VI Th. 7.1–7.3 pp. 309–310, lines 15377, 15385 and 15390, on a compact Hermitian manifold (line 15369), not necessarily Kähler, as the README says.
- **6.0.** Demailly VI:
  - Def. 4.1 p. 296 (14652); (4.2) p. 296 (14675); Ex. 4.4 and 4.6 p. 297 (14688, 14700).
  - Th. 4.8 p. 298 (14736); (5.4)–(5.5) p. 300 (14871–14873); Cor. 5.9 p. 301 (14948), `[L,Λ]=(p+q−n)`.
  - Def. 5.11 and (5.15) p. 302 (14967, 14987); Th. 6.4 p. 305 (15156); Cor. 6.5 and Th. 6.7 p. 306 (15190, 15210).

  Demailly VII: Th. 1.1 p. 329 (16248); Cor. 1.3 p. 330 (16281); (6.1)–(6.3) p. 338 (16637–16652); (7.1)–(7.2) p. 341 (16819, 16828).
- **6.1.** `lojasiewicz-triangulation` §3 Th. 2, p. 464 (header line 504, theorem line 512). Its hypotheses are a countable real-analytic manifold and a locally finite semianalytic family; conclusions (a)–(c) give analytic simplices inside the strata, as the README requires.
- **7.2.** Demailly V (15.1)–(15.2) p. 277 (13691, 13699); (15.6) p. 278; (15.8) p. 279 (13780), `Θ(O(1))=d′d″log(1+|z|²)`; VI Ex. 4.4 p. 297.
- **8.1.**
  - `angella-iwasawa` §3.1, pp. 9–10, lines 480–533 (`dϕ3=−ϕ1∧ϕ2`, line 510).
  - `chevalley-eilenberg` §23 (23.1)–(23.2), p. 115, lines 1167–1183; its (23.4)–(23.6) force the reversed bracket sign the README states.
  - `sakane-parallelisable` §2 Th. 1, pp. 188–189, lines 85 and 102.
  - LieGroupoidsPoisson §G1.3a's standalone Lie-algebra complex is main `:636–661`.
- **8.2.** Sakane p. 189, lines 106–115: A is the last nonzero term of the descending central series. Line 112 cites Raghunathan p. 31 Cor. 1 and p. 23 Th. 1.13; Raghunathan is uncertified.
- **Rainer.** Th. 11.1 printed p. 25 (line 1338); Lemma 11.3 p. 27 (1437); Th. 11.7 p. 29 (1550).

### Adversarial pass

| # | Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1 | `finite_rank_runge_approximation` | K={0}⊂Ω=U=ℂ; K=∅ | A f=f(0): error 0≤εB; A=0 on f=1: error 1>ε for ε<1. K=∅: L=∅, N=0, conclusion vacuous | Holds; ownership R03 |
| 2 | `hRunge` | K={2≤\|z\|≤3}; Ω={\|z\|<4} vs {1<\|z\|<4} | first: component {\|z\|<2} has compact closure ⊆Ω, hypothesis false (period of 1/z is 2πi vs 0); second: closures {1≤\|z\|≤2},{3≤\|z\|≤4}⊄Ω, true, 1/z has error 0 | Holds; equals `IsFilledIn` body (R02) |
| 3 | Rainer 11.1(2) vs filled | text | "no component of U∖K relatively compact in U" (line 1343) = ¬(closure compact ∧ ⊆Ω) | Same; connectedness of U handled at `:566–569` |
| 4 | `mixed_parameter_solver` | f=1, P=Q=pt; f=pq on ℝ×(ℂ∖0) | u=z̄: (1+i(−i))/2=1; u=z: (1+i·i)/2=0 ✗; u=pq z̄: (pq+i(−ipq))/2=pq, ∂̄_q u=0 | Holds |
| 5 | solver ∂̄ vs `conjWirtingerDeriv` | v=1 | 2⁻¹(Dg(x)1+i·Dg(x)(i·1)) = `Suggested.lean:111–112` | Equal (R02) |
| 6 | Cauchy–Green weak normalization | radial φ=g(r), g(0)=1 | (1/(πζ))∂̄φ=g′(r)/(2πr); ∫=∫₀^∞g′=−1=−φ(0) (Demailly I line 923) | Holds |
| 7 | `weierstrass_preparation` | n=0, w²+w³; n=1, w²−z; 1+z+w; z | d=2,u=1+w,a=0; d=2,u=1,a₀=−z,a₁=0; d=0,u=f; f(0,·)≡0 so every iterated derivative is 0, `hd` false | Holds |
| 8 | `weierstrass_preparation_unique` | n=0 | a_i on a point with a_i 0=0 ⇒ a_i≡0; u wᵈ=u′wᵈ ⇒ u=u′ off w=0, at 0 by continuity | Holds |
| 9 | `weierstrass_division` | n=0, g=w², f=1+w+w² | q=1, r=(1,1); with degree ≤d allowed, q=0, r=1+w+w² also works | Holds; degree <d needed |
| 10 | `weierstrass_division`, d=0 | g(0,0)≠0 | remainder over `Fin 0` empty; q=f/g analytic, unique | Holds |
| 11 | `holomorphicStalk_noetherian` | E=0; E=ℂ | stalk ℂ (field); ℂ{z} principal, (z²,z³)=(z²) | Holds |
| 12 | `holomorphicStalk_factorial` | ℂ{z,w}; real smooth stalk | zw=z·w, nonassociate primes; real germs e^(−1/x)·1_{x>0} and its reflection, product 0 | Holds; `IsDomain` redundant (R02) |
| 13 | `ruckert_nullstellensatz` | f₁=z², g=z; k=0; f₁=1 | m=1: z∉(z²); m=2: z²=1·z²; k=0: g≡0 near x, empty sum; f₁=1: m=0, h₁=1 | Holds |
| 14 | `oka_coherence` | f=(z,z); k=0 | relations a₁z+a₂z=0 ⇒ (b,−b), r=(1,−1); empty family misses (1,−1); k=0: m=0 | Holds |
| 15 | `cartan_coherence_reducedIdeal` | f₁=z² at 0 | reduced ideal (z), g₁=z; (z²)⊊(z) | Holds |
| 16 | planar star (§5.5) | dz, dz̄ | ⋆dz=dy−i dx=−i dz; ⋆dz̄=dy+i dx=i dz̄ | Holds |
| 17 | codifferential sign | (m,k)=(2,1),(3,1),(3,2) | README (−1)^(m(k+1)+1): −1,−1,+1; Demailly (−1)^(mp+1), p=k−1: −1,−1,+1; Tau Ceti `Codifferential.lean:80` same | Agree |
| 18 | δ on 1-forms | x dx+y dy; x dy | δ=−(1+1)=−2, d=0; d=dx∧dy, δ=0 | Holds |
| 19 | δ on 2-forms | h=x²+y² | δ(h dx∧dy)=h_y dx−h_x dy=2y dx−2x dy | Holds |
| 20 | Δ_H sign | x²+y²; \|x\|³ | Δ_H=−4 vs div grad=+4; u_xx=6\|x\|, Δ_H=−6\|x\| | Holds |
| 21 | Δ_H coefficientwise on 1-forms | P dx+Q dy, C² | dx coefficient −P_xx−Q_yx+Q_xy−P_yy=−ΔP, using mixed-partial symmetry | Holds; C² needed |
| 22 | planar 2-form exactness | β=dx∧dy, u=z̄/(2i) | dz̄∧dz=2i dx∧dy; d(u dz)=2i·(2i)⁻¹dx∧dy=β; −u gives −β | Holds; ownership R03 |
| 23 | period of dz/z | Log_± | upper overlap Log_−−Log_+=0, lower 2πi; c_U=0, c_L=−2πi, Per=c_U−c_L=2πi | Holds |
| 24 | d^c convention | f=\|z\|² | d^c f=2x dy−2y dx; dd^c f=4dx∧dy; 2i∂∂̄f=2i(−2i)dx∧dy=4dx∧dy | Holds |
| 25 | h_T slots | u=1, v=i | h_T(1,i)=0+i·1=i; h_T(i,1)=−i=conj(i)h_T(1,1); h_src,tensor(1,i)=2h_T(i,1)=−2i | Holds |
| 26 | Chern A=h⁻¹∂h | h=exp(\|z\|²) | A=z̄ dz; Θ=dA+A∧A=dz̄∧dz | Holds |
| 27 | `[Λ,L]=(n−k)` | ℂ, k=0,2; ℂ², k=0 | 1; 0−ω=(1−2)ω; ΛL1=\|ω₁+ω₂\|²=2 | Holds (VI 5.9) |
| 28 | Kähler identities | ℂ, α=x dy | [Λ,d]α=Λ(dx∧dy)=1; −(d^c)*α=δ(⋆α)=δ(−x dx)=1; ∂α=½dx∧dy, [Λ,∂]α=½ | Holds |
| 29 | `[L,d*]=d^c` | f=x | −d*(x dx∧dy)=−(−dy)=dy; d^c x=(i/2)(dz̄−dz)=dy | Holds |
| 30 | Δ_d=2Δ_∂̄ | f=x²+y² | Δ_d f=−4; Δ_∂̄ f=−2 | Holds (VI 6.5) |
| 31 | Hodge–Riemann sign | n=k=1, α=dz on ℂ/(ℤ+iℤ) | i¹(−1)⁰∫dz∧dz̄=i(−2i)·1=2>0 | Holds |
| 32 | Nakano (n,k) bound | iΘ=aω⊗Id | [iΘ,Λ]=a[L,Λ]=a(n+k−n)=ka; a=−1, k=2: −2 | Holds (VII 7.1) |
| 33 | O(1) curvature | chart | −2πi·(i/2π)∂∂̄log(1+\|z\|²)=∂∂̄log(1+\|z\|²) = Demailly (15.8) | Agree |
| 34 | ∫_{ℂP¹}ω_FS | affine chart | (1/π)·2π·∫₀^∞r/(1+r²)²dr=2·½=1 | Holds |
| 35 | dim H⁰(O(k)) | (n,k)=(1,1),(2,2) | C(2,1)=2; C(4,2)=6 (V 15.6) | Holds |
| 36 | Serre on ℂP¹ | O(−1) | H¹(O(−1))*≅H⁰(O(1)⊗O(−2))=H⁰(O(−1))=0 | Holds |
| 37 | Hopf diamond | b_k, weights | b₁=1=0+1; b₂=0; b₃=1=1+0; weights 2^(d+1)≥2, 2^(1−m−n)≤½, none 1 | Holds |
| 38 | CE differential | [X,Y]=Z | dZ*(X,Y)=(−1)^(0+1)Z*([X,Y])=−1; source −½, factor 2 gives −1 | Holds |
| 39 | Iwasawa | Angella line 510 | dφ₃(X₁,X₂)=−1; h^(1,0)+h^(0,1)=3+2=5≠b₁=4 | Holds |
| 40 | K3.0 transitions | z↦iz; z↦z̄ | matrix ((0,−1),(1,0)), det 1; D(i)=−i≠iD(1)=i | Holds |
| 41 | §5.4 form Check | a(u,v)=2conj(u)v | (A+1)⁻¹u=u/3; 3conj(Fℓ)v=cv ⇒ Fℓ=conj(c)/3 | Holds |
| 42 | §5.6 assembly | ranks (0,1,2), (0,1,(1,i)) | 0+1+(1+1)=3 | Holds |
| 43 | §5.2 delta series | φ=1/(1+2x) near 0 | (−1)ⁿφ⁽ⁿ⁾(0)/n!=2ⁿ: 1,2,4; partial sums 1,3,7 | Holds |
| 44 | §5.2 normal jets | u=δ′, test 1 near 0 | ⟨xδ′,φ⟩=−(xφ)′(0)=−1=(−1)¹1! | Holds |
| 45 | §5.1 density | x↦−2x | density ×\|−2\|=2, orientation ×(−1) | Holds |
| 46 | §5.7 ∂̄* | f=z, z̄ | −⋆∂⋆(f dz̄)=−⋆(2f_z dx∧dy)=−2f_z: −2, 0 | Holds |
| 47 | ℂPⁿ cells | ℂP² | Tau Ceti main pin: cells 0,2,4, H₂ᵢ≅R for i≤2; README Check: Euler sum 1+1+1=3 | Agree; duplication R08 |
| 48 | central reduction | Heisenberg | last nonzero lower-central ideal ℝZ, quotient ℝ², fibre ℝ/ℤ; Sakane p. 189 A=C^m(G) | Holds |

### Library declarations opened

- **Branch pin.** `Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean:131–132`, `Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:109`, `Analysis/LocallyConvex/Montel.lean:45` and `RingTheory/PowerSeries/WeierstrassPreparation.lean`.
- **Main's pin.**
  - `TauCeti/Topology/FilledIn.lean:61–63` and `Analysis/Complex/Wirtinger/Basic.lean:80–81`.
  - `Geometry/Manifold/Complex/StructureSheaf/Domain.lean:93` and `Riemannian/Codifferential.lean:80–88`.
  - `Algebra/Homology/SpectralSequence/{Bicomplex,Comparison,Filtered/FirstPage,Filtered/Convergence}.lean`.
  - `AlgebraicTopology/Cellular/ComplexProjective.lean` and `Topology/ComplexProjectiveSpace/{Basic,Charts}.lean`.
  - `Geometry/Symplectic/Manifold/AlmostComplex/Eigenbundle.lean`: involutivity only, so K1's smooth eigen-subbundles are not duplicated.
  - `Geometry/Manifold/Distribution/Complex.lean`.
- **Name sweep.** 254 backticked names: 101 resolve at both pins, 118 at main's pin only, 0 at the branch pin only. The other 35 are this roadmap's own, module names or other roadmaps' names, each checked.

### Cross-roadmap citations resolved

- **On main (32a0bcc).**
  - ComplexManifolds Milestones 1–7 (`:172–319`) and ComplexTori Milestone 1 (`:130`).
  - SBC B1.0–B6.6 headings (`:221–1811`) and PDE A3/B9 (`:769`, `:1148`).
  - RealAnalyticGeometry R0–R5 (`:39–1007`, R3.2 item 0 `:734`) and RealAlgebraicGeometry Layer 7 (Completed `:479`).
  - LieGroupoidsPoisson §G1.3/G1.3a (`:636–661`, with K8 named as consumer at `:86`, `:2020`) and §G1.6 (`:738`).
  - AlgebraicTopology Stages 3–8 (`:471–1602`), `cwSubcomplexNeighborhoods` (`:755`) and `simplicialRealizationCW` (`:817`).
  - CharacteristicClasses C1.5 (`:63–100`) and Hyperfunctions HF5 (`:1102`).
  - PDO P1.0, P1.1, P2, P5, P7 (`:164`, `:507`, `:543`, `:927`, `:1598`).
  - DifferentialGeometry 0.1–0.4, 1.1–1.4, 5.2–5.5 (5.3 includes the `curveIntegral` agreement used at `:1604`), 8.3–8.5, 12.1 and 12.4.
  - GeometricTopology Layer 11 (`:831`) and DGFloer filtered complexes (`:226`, `:412`).
- **At open heads.** DifferentialGeometry #886 (R05); GeometricTopology #903 (R07); VariationalMethods #1028 and UnboundedOperators #1027 (above).
- **Overlaps.** The three `#k…` anchors this pull request drops are mapped at `README.md:349–361`. The DifferentialGeometry §5.5 lead is R05. The four conflicting heads are R06.

### Ownership

- CalibratedGeometry #946 consumes K1, K2, K4, K5a, K5b.0, K6.0 and K6.1 (its `README.md:116–119, 377–386`) and claims nothing this roadmap owns.
- ComplexComparisonPartII #848 consumes K2–K5a (`:29, 148–160`); its citations of the K5a carrier names are R09.
- GlobalHolomorphicFunctions #992 is R03 and DeRhamCohomologyAndDuality #1768 is R04.
- No declaration of `Suggested.lean` carries the fully qualified name of a declaration in another readable roadmap, except the other open copies of this same folder (R06).

## Not verifiable

- `webster-nn`, `hormander-alpdo1` (§5.2, Th. 2.3.5), `wells-dacm`, `griffiths-harris` and `raghunathan-discrete-subgroups` are settled as uncertified and are cited by locator; I did not open them.
- I did not re-run the elaboration of this `Suggested.lean` at main's pins in this round. The Lean command this brief allows uses the branch-pin worktree; the previous review reports exit 0 there.
- The three headlines R02 asks for were not elaborated in final form.

## Source issues

- **Misprint** in demailly-agbook at VI (4.9)–(4.10), Theorem 4.8, p. 298: the source says the fundamental form is i·Σ⟨∂/∂z_l,∂/∂z_m⟩dz_l∧dz̄_m, while its p. 296 definition gives (i/2)·Σh_lm dz_l∧dz̄_m for the same metric; it should be one normalisation (a factor ½, or the inner product doubled) throughout §4; affects nothing (rescaling the coordinates by √2 restores the stated normal form, and the README fixes its own normalisation).
