# Review of ReductiveGroups (pull request #1332 at 0864778)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/README.md` (4724 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (437 lines, 32 declarations, 13 sorried theorems). The head is the one r82 read. The pins are those of the branch's `lake-manifest.json`: Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`. Main's manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, and the branch merges on main's manifest. R01 is about that gap.

## Previous findings (r82)

- **r82 R01** (no merge order against the open pull requests that change this folder): **not repaired.** The description still reads "The dependency order is #1332, then #447, then #1334". It still says "existing Lean prototypes, helper, metadata and configuration are untouched". It names no order against #1676, #1797, #1807, #1808 or #1854. Carried as R03.
- **r82 R02** (inventory clause of the §7.3 Bruhat paragraph): **repaired.** Lines 54–57 are unchanged since r82 confirmed them. The clause still holds at `a91d3aaf`: `TauCeti.GeneralLinear.diagonalNormalizerQuotientMulEquivWeylGroup`, `TauCeti.SpecialLinear.diagonalNormalizerQuotientMulEquivWeylGroup` and `TauCeti.Symplectic.diagonalNormalizerQuotientMulEquivWeylGroup` are present, and `Algebra/AlgebraicGroup` has no Weyl group of a given `(G,T)`.

## R01 (P2) — The folder mixes two Tau Ceti versions: a cited theorem is missing at the pin, and five headlines are already proved at main's pin

**Location.** `Suggested.lean` lines 26–28: "Conjugacy of Borel subgroups … is proved in the pinned Tau Ceti, `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` in `TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`, and is consumed, not restated." The same claim appears at README lines 225–227 and 1711–1713. The RootSystems contract at README lines 381–383 names `TauCeti.weylCoxeterHom_injective` and `TauCeti.weylCoxeterSystem`.

**Claim.** The README and `Suggested.lean` are written against one pinned Tau Ceti.

**Witness.** At `a91d3aaf`, `Borel/` has no `Conjugacy/` directory and no `IsBorelOverAlgClosed.exists_conjugate_eq`. The pinned `exists_conjugate_eq_of_isBorelOverAlgClosed` (`Borel/Conjugation.lean:161`) assumes `hcontain`. At `2fd255d9`, `TauCeti.SchemeAction` proves all four `AlgebraicOrbits` theorems.

**Evidence at each pin.**
- **At the branch pin `a91d3aaf`.**
  - The Borel-conjugacy headline is statable and is absent from `Suggested.lean`. `TauCeti.HopfIdeal.IsBorelOverAlgClosed` is defined at `Borel/Basic.lean:148`. The statement `∃ g : WithConv (H →ₐ[k] k), I.conjugate g = J` for `hI hJ : IsBorelOverAlgClosed k H _` elaborates against `TauCeti.Algebra.AlgebraicGroup.Borel.Basic` and `HopfIdeal.Conjugation` in a scratch file, with only the `sorry` warning.
  - The only pinned theorem, `exists_conjugate_eq_of_isBorelOverAlgClosed`, assumes that every Borel subgroup can be conjugated into a fixed candidate `D`. This is the same conditional shape that lines 247–248 reject for maximal tori.
  - `TauCeti.weylCoxeterHom_injective` and `TauCeti.weylCoxeterSystem` are absent. `Coxeter/Presentation.lean` has `weylCoxeterHom` and its surjectivity (lines 57–82) but neither of these, and `Inversions/Length.lean:67–68` says that `weylCoxeterSystem` is not there.
- **At main's pin `2fd255d9`, where the branch merges.** Five sorried headlines are already proved natively, and the classical-point topology is native:
  - `TauCeti.SchemeAction.isLocallyClosed_orbit` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:177`), `topologicalKrullDim_orbitBoundary_lt` (`:213`), `exists_isClosed_orbit_subset_orbitClosure` (`ClosedOrbit.lean:150`) and `exists_isClosed_orbit` (`:178`). They are stated on the same `𝟙_ (Over (Spec k)) ⟶ X` points and have no smoothness or separatedness hypothesis.
  - `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:118`), with geometric connectedness only.
  - `TauCeti.SchemePointTopology.topology` (`Topology/Algebra/PointTopology/Scheme.lean:127`), the chart topology on points, which `ClassicalPoints.classicalPointTopology` re-implements.
  - `TauCeti.HopfIdeal.IsParabolic` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean:248`). With it the §7.2 Levi theorem becomes statable, so the docstring sentence at lines 50–52 is false there.
  - The Borel and Coxeter names cited above do exist at this pin: `Borel/Conjugacy/Existence.lean:133` and `Coxeter/Presentation.lean:158, 167`.

The file is therefore wrong at either pin. r70 recorded the Borel and Coxeter names as a note for the approver ("the branch merges on main's manifest, where the citations resolve"). That reasoning also forces the duplications listed above, so this is a finding. The other open pull requests on this folder have already adapted: #1676 (lines 38–42 of its `Suggested.lean`) and #1797 (lines 41–45) cite the `TauCeti.SchemeAction` names instead of restating them.

**Repair.** Rebase the branch onto main, so that the manifest pins Tau Ceti `2fd255d9`, and then reconcile the folder with that pin:
1. Delete `AlgebraicOrbits.Points`, `orbitMorphism`, `geometricOrbit`, `orbitClosure`, `orbitBoundary`, `orbitDimension` and the four orbit theorems, and delete `reductive_iff_linearlyReductive`. Cite the five native names above in the Tau Ceti contract, in §3A.4a (README lines 869–877) and in §6.2 (lines 1416–1418), and list them in the docstring as consumed.
2. Restate `compact_complexPoints` on `TauCeti.SchemePointTopology.topology` with `R = ℂ`, and delete the three `ClassicalPoints` definitions.
3. State the §7.2 Levi-complement theorem on `TauCeti.HopfIdeal.IsParabolic`, in Hopf coordinates as §6A does, and delete the docstring's §7.2 sentence.
4. Re-run the gate and the build at the new pin.

If the branch stays at `a91d3aaf` instead, add the unconditional Borel-conjugacy theorem above to `Suggested.lean` (§7.1). Then replace the Borel claims in the docstring and at README lines 225–227 and 1711–1713 with `TauCeti.HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed` and its `hcontain` hypothesis, and drop the two Coxeter names from lines 381–383.

## R02 (P3) — `CoverLifts.exists_characterKernelEquiv` is a generic group-extension lemma, not a headline

**Location.** `Suggested.lean` lines 286–335 (`liftSubgroup`, `LiftGroup`, `projection`, `exists_characterKernelEquiv`) and docstring line 17, "the character kernel of central-cover lifts". README §9A.1a-L, lines 3367–3375.

**Claim.** The theorem is one of the roadmap's headline theorems.

**Witness.** The statement quantifies over arbitrary groups `E Q A`, any central `ℤˣ`-extension and any action `ρ`. No algebraic group, root datum or ADE cover occurs. The proof is direct verification: `φ_χ(e)=ι(χ(π e))e`, with multiplicativity coming from centrality.

The ADE statement that README §9A.1a-L actually owns (lines 2865–2885) is a different theorem. On the signed cover `Q×ℤˣ` with cocycle `ε` of §9A.1a, every Gram isometry lifts, and the kernel is `Hom(Q,{±1})`. The generic lemma is only the kernel step of that proof.

**Repair.**
- Delete the four `CoverLifts` declarations from `Suggested.lean` and the docstring clause on line 17.
- In README lines 3369–3373, remove the backticked Lean names. The statement stays as a §9A.1a-L target.
- In the docstring, add the §9A.1a-L ADE lift theorem (surjectivity onto the shell-preserving Gram isometries, with kernel `Hom(Q,{±1})`) to the not-statable list, naming the signed ADE cover as the missing carrier. Alternatively, state it here on that cover, which is a simple definition with a real body.

## R03 (P3) — No stated order against the five open pull requests that change this folder

**Location.** The pull request description (data): "The dependency order is #1332, then #447, then #1334"; "exposes its simply connected point specialization in `ChevalleyModelTargets.lean`"; "Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched."

**Claim.** The description states the merge order against every open pull request that changes this folder, and describes the folder as it is.

**Witness.** `scratch/overlaps.md` reports that #1676, #1797, #1807, #1808 and #1854 each conflict with this head in `README.md` or `Suggested.lean`. The folder has no `ChevalleyModelTargets.lean` or prototypes. Carried from r82 R01, unrepaired; no repair report marks it not actionable.

**Repair.** Add one sentence to the description saying which of #1676 and #1332 is rebased on the other, and that #1797, #1807, #1808 and #1854 carry this folder only as a copy to be dropped at rebase. Delete the two stale sentences. After R01's rebase, the overlap with #1676 and #1797 (both cite `TauCeti.SchemeAction`) shrinks to the remaining differences.

## R04 (P3) — Run-together cross-references, two of them supplier citations without a section sign

**Location.**
- README line 840: "Consume SchemeAndStackFoundations0.7 and native topological Krull dimension".
- README line 1050: "projective-space H⁰ calculation from SchemeAndStackFoundations0.3/2.6".

**Claim.** Cross-roadmap citations name the roadmap and its section.

**Witness.** SchemeAndStackFoundations §0.3, §0.7 and §2.6 exist on main (its README lines 551, 755 and 3437). The two citations run the roadmap name into the number and carry no "§", unlike every other supplier citation in this README.

The same typo appears in 91 in-roadmap references on 77 lines, for example "Layer1" (line 222), "Layers0–1" (785), "of6A"/"of7C" (1339), "of9B" (1834) and "In9B.2" (4639).

**Repair.**
- Line 840: "SchemeAndStackFoundations §0.7".
- Line 1050: "SchemeAndStackFoundations §§0.3 and 2.6".
- Insert the missing space, and "§" before subsection numbers, at lines 222, 570, 785, 786, 1066, 1339, 1341, 1473, 1474, 1491, 1492, 1494, 1509, 1521, 1539, 1547, 1592, 1626, 1628, 1834, 1840, 1854, 1858, 1860, 2544, 2551, 2554, 2555, 2736, 2814, 2819, 2831, 2866, 2954, 2964, 2970, 3050, 3059, 3069, 3104, 3113, 3227, 3230, 3280, 3295, 3302, 3303, 3321, 3474, 3529, 3554, 3581, 3640, 3707, 3709, 3710, 3716, 3722, 3741, 3748, 3800, 3806, 3852, 3947, 3961, 4132, 4217, 4413, 4422, 4430, 4441, 4489, 4490, 4497, 4637, 4639 and 4641.

## Verified sound

### Gate, build and dependency check

- **Gate.** The worker's gate at 0864778 is all zero. My own run of `gate … --base origin/main` printed: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- **Build.** `lake env lean` on `Suggested.lean` exits 0 in 21 s. It reports exactly thirteen `sorry` warnings, at lines 112, 121, 130, 140, 175, 187, 202, 226, 251, 272, 329, 417 and 431, and nothing else.
- **Dependency check.** The output is `depcheck: 239 roadmaps, 2316 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Diff outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Form.** Imports are `import Mathlib` plus nine `TauCeti.*` modules, all present at both pins. There is no `set_option`, `lemma`, sorried data, `#eval`, `#print` or `#synth`.

### Signatures and one-tactic probe

- **`#check` pass.** All 32 declarations were elaborated with `#check @TauCetiRoadmap.ReductiveGroups.<name>` in one scratch file. Each sorried theorem carries its own `IsAlgClosed`, `IsAffine`/`Smooth`/`QuasiCompact`, `LocallyOfFiniteType`/`QuasiCompact`/`IsSeparated`, `IsProper`, `CharZero`, `CharP` with `Fact p.Prime`, `Finite k`, `IsAlgClosed K` with `hF`, centrality, or `2 ≤ n` hypothesis, as its README statement says. No section binder is lost.
- **One-tactic probe.** On a scratch copy, each `sorry` was replaced by `first | rfl | trivial | infer_instance | decide | (simp; done) | (aesop; done) | sorry`.
  - Twelve declarations still report `sorry`.
  - On `exists_conjugate_eq_of_isMaximalTorus`, `simp` hits the heartbeat limit without closing the goal, as in r70.
  - No declaration restates a definition or mirrors a Check. R02 is about headline status, not the probe.

### Seeded sample, against the text at its locator

The `milne-iag` locators were read in Milne's *Algebraic Groups* (2017), `jmilne.org/math/Books/iAG2017.pdf` (author page, in the sources cache). There, printed page = PDF page − 12. Every page below matches the README.
- **0.3** — §5j: Def. 5.65 (flat sheaf) and Prop. 5.68 (sheafification), p. 116.
- **1.0a / 1.0b** — Remark 4.1, pp. 84–85; Thm. 4.9, p. 87. The native `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` is at `Representation/Tannaka/GroupFunctor.lean:138`.
- **1.1** — `jantzen-1985`, where printed page = PDF page − 5.
  - I.3.3, pp. 52–53: induction `(M⊗k[G])^H`, functions with `f(gh)=h⁻¹f(g)`, left translation.
  - I.3.9, p. 60: injectives and `I⊗k[G]`.
  - I.4.14–4.16, pp. 77–79a: the Hochschild complex `M⊗k[G]^{⊗n}`, the coface `Δ(f)−f⊗1`, and cohomology equal to `H•(G,M)` for flat `G`.
- **2.1** — Prop. 1.37, p. 18; §10.14, p. 190; Thm. 10.23, p. 193; Props. 10.28–10.29, pp. 195–196.
- **3.2** — Prop. 1.34, pp. 16–17; Prop. 2.37, p. 51; Def. 2.38, p. 52.
- **4.2** — Prop. 12.3, p. 231; Remark 12.5, p. 232 (smooth ⇔ no p-torsion); Thms. 12.8–12.9, p. 233; Def. 12.14, p. 236.
- **4.3** — Defs. 12.14 and 12.17, p. 236; Thm. 12.23 and Cor. 12.25, p. 240.
- **5.1** — Prop. 14.3, p. 280; Thm. 14.5, p. 281; Cors. 14.6, 14.7 and 14.9, p. 282; Cor. 14.12, p. 283; Cor. 14.18, p. 284; Thm. 16.30.
- **6.1** — Props. 19.1–19.2, pp. 397–398; Prop. 19.5, p. 398; Prop. 19.9, p. 399; Props. 19.10, 19.11 and 19.13, p. 400.
- **6.2** — Def. 12.52, Remark 12.53 and Prop. 12.54 with its footnote, p. 248; Remark 12.56, p. 249 (see Source issues); Prop. 22.41 and Thm. 22.42, p. 477; Cor. 22.43, p. 478.
- **7.1** — Cor. 1.39, p. 18; Def. 17.6, p. 353; Thms. 17.9–17.10, p. 354.
- **7.3** — Cor. 21.12, p. 430; §§21.17–21.18, p. 431; Thm. 21.32, p. 434; Prop. 21.75, p. 448; Thm. 21.80, p. 450. `conrad-feng` §§12.1–12.3 run over PDF pp. 120–127, with Prop. 12.3.1 on p. 127 (simply transitive `U(k)` action; unique Levi containing a maximal torus).
- **8.3** — §6.47 and Ex. 6.48, p. 136; Prop. 19.9, pp. 399–400.
- **11.0** — `sga1` XII, Théorème et définition 1.1, pp. 239–240: the completed local rings agree, which gives the cotangent isomorphism. Milne 10.23 and 10.28–10.29 as for 2.1.
- **Locators behind the headline docstrings.**
  - Milne 1.65(b) and 1.66, pp. 26–28. The errata entry for p. 26 concerns only the proof of 1.65(a).
  - Milne 17.96–17.97, p. 383. The source's `g F(g⁻¹)` becomes `g⁻¹F(g)` under `g↦g⁻¹`.
  - `mcninch` §3.1, p. 6 (Levi factor; existence in characteristic 0) and (3.2.1), p. 7 (`G(W₂)` has no Levi decomposition).
  - `sga1` XII Prop. 3.1(iii), (iv) and (viii), p. 244, and Prop. 3.2(v), p. 245.

### Headline inventory

- **Stated.** Orbit local closedness; strict boundary-dimension drop; a closed orbit in each orbit closure; existence of a closed orbit; compactness of proper complex points; reductive ⇔ linearly reductive in characteristic 0; Nagata's torus criterion; the Hopf-coordinate Levi complement; conjugacy of maximal tori; Lang surjectivity; integral PBW for the full reductive frame; non-splitting of `B_n→S_n`. The cover-lift kernel is also stated but is not a headline (R02).
- **Consumed.** Borel conjugacy, whose cited name is wrong at the pin (R01).
- **Named as not statable, with the missing carrier.**
  - The signed ADE construction, the folding classification, the pinned integral model and the relative structure.
  - The §6B affine quotients, the highest-weight classification, spectral monodromy and smooth charts.
  - The §6A semidirect form, §7.2 Levi (true at `a91d3aaf`, false at `2fd255d9`, see R01) and §7.3 Bruhat.
  - §§7c–7e and §7g, §9C, and the §10 Weyl and Steinberg modules.

### Cross-roadmap citations resolved on main

- SchemeAndStackFoundations: §0.3 (README line 551), §0.7 (755), §0.9 (848), §1.1 (2071), §§1.14–1.18 (2458–2745), §2.6 (3437), §4.12 (5613).
- ModularCurves: §0B (688), §0E (839), §0F (886; finite locally free Weil restriction, lines 4 and 18 of the section).
- RootSystems (`RepresentationTheory/RootSystems`): §2.1 (616), §2.2 (656), Layer 4 (804), §5.1 (907; the `W⋊D≃Aut(P)` statement agrees with README lines 391–399), Layer 6 (1035).
- SmoothBundlesConnections: B1.0 (221), B1.1 (315), B1.4 (421).
- LieGroups: Layer 7 (787), Layer 8 (1078).
- On main without a cited section: DGFloer, LieHighestWeight, ReflectionInvariantTheory, SchubertGeometry, NilpotentOrbits, AlgebraicVectorBundles, ChevalleyGroups, CFSGStatement.
- FormalConnectionsOpers §3A.5 is a consumer; it appears in the open revision at line 1235.
- No never-cite roadmap is named.

### Ownership and overlaps

- The closest open roadmaps — SchubertGeometry (#1224), ClassicalGroupsPartII (#1492), RootSystemsPartII (#1731) and FormalConnectionsOpers (#1056) — cite ReductiveGroups as owner (34, 47, 22 and 58 mentions). FormalConnectionsOpers owns only the affine Iwahori–Bruhat decomposition (lines 1258–1285), which is a different object.
- `scratch/overlaps.md` reports that no cited id is dropped elsewhere and that this pull request drops no cited id. The five conflicting heads are R03.

### Library declarations opened

- **At `a91d3aaf`.** `Torus/Maximal.lean:50` (`IsMaximalTorus`), `Torus/Conjugation.lean:156`, `Borel/Basic.lean:148`, `Borel/Conjugation.lean:161`, `HopfIdeal/Coinvariants/Basic.lean:92`, `Unipotent/Radical/Construction.lean:72`, `Reductive/Basic.lean:70`, `LinearlyReductive.lean:64`, `Torus/Basic.lean:107`, `Connected/CommHopfAlgCat.lean:61`, `Kostant/Form.lean:185`, `Braid/Basic.lean:304`, `Module/Rat.lean:34`, `Dynamic/Parabolic.lean:44`, `AffineGroupScheme/Components/Finite.lean:47`, `Fppf/Quotient/Basic.lean:154`, `Fppf/Quotient/Coinvariants.lean:48`, `Connected/GroupScheme.lean:141, 172`, `Representation/Embedding.lean:213`.
- **At `2fd255d9`.** The R01 list above, plus `Solvable/LinearlyReductive.lean:86`, which proves Nagata only for solvable groups, so `linearlyReductive_iff_torus` is not duplicated there.

### Adversarial pass

Each row gives the values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| 0.3 base change | μ₂ from ℤ to 𝔽₂ and to ℚ; αₚ to k(s^{1/p}) | t²−1=(t−1)², dim 2, nonreduced; ℚ×ℚ reduced, dim 2; K[t]/(tᵖ), dim p | holds | none |
| 1.0a dictionary | Gₘ weight 3 at a=2; dual; weights 1⊗2; Gₐ translation; character tᵖ | 8v; 1/8; 8·(1/8)=1; 2·4=8; t↦t+a, not t−a; kernel μₚ of degree p, injective on k̄-points | holds | none |
| 1.0b reconstruction | Gₘ point t↦2; tensor unit; trivial group | 2³=8; acts by 1; one element under the universe lift | holds | none |
| 1.1 Hochschild | H=A=M; ℤ[t,t⁻¹] weight 1 | d⁰=1−1=0, d¹=1−1+1=1, d²=0, so H⁰=A, H¹=0, H²=A/A=0; d⁰(1)=1⊗(t−1), last-factor form (t−1)⊗1 | holds | none |
| 1.1 induction | trivial subgroup of constant C₂ over ℤ; f=id; M=0 | ℤ² with the swap; equalizer M; 0 | holds (Jantzen I.3.3) | none |
| 2.1 Lie | Frobenius on Gₘ in char p; μₚ; SL₂ | d(tᵖ)=0, kernel μₚ; dim Lie=1 vs dim 0; [E₁₂,E₂₁]=diag(1,−1) | holds | none |
| 3.2 π₀ | S₃; μ₂/𝔽₂; μ₂/𝔽₃; μ₃/ℝ; αₚ×ℤ/2 | degree 6 and (12)(23)=(123)≠(132); degree 1; degree 2; ℝ[t]/(t³−1)=ℝ×ℂ, 3 geometric and 1 real point; G°=αₚ, degrees p and 2 | holds | none |
| 4.2 D(M) | ℤ/p in char p; character 3 on cocharacter −2; ×2 on ℤ | k[u]/(uᵖ), tangent dim 1, not smooth (Remark 12.5); t↦t⁻⁶; kernel μ₂ of length 2, also in char 2 | holds | none |
| 4.3 lattices | real norm-one torus; μₚ; Gₐ | X=ℤ with −1, X^Γ=0, (−m)(−n)=mn; X=ℤ/p, X_*=0; X=0 but dim 1 ≠ dim D(0)=0 | holds | none |
| 5.1 unipotence | Gₐ→U₂; μₚ coaction; GL₂ upper Borel on diag(2,3) | (tE₁₂)²=0; v⊗t≠v⊗1 since t≠1 in k[t]/(tᵖ−1); quotient characters 2 and 3 | holds | none |
| 6.1 radicals | Gₐ; Gₘ; SL₂ in char 2 | dims (R, Rᵤ) = (1,1) and (1,0); centre k[t]/((t−1)²), length 2 | holds | none |
| `reductive_iff_linearlyReductive` | trivial H; Gₐ; constant ℤ/2 in char 0 | both sides true; both false (ke₁ has no stable complement); ℤ/2 is linearly reductive but excluded by `hconnected` | holds; native at `2fd255d9` | R01 |
| `linearlyReductive_iff_torus` | μₚ; constant ℤ/ℓ with ℓ≠p; norm-one torus of 𝔽_{p²}/𝔽ₚ; SL₂ Sym² in char 2 | linearly reductive, not smooth; ℓ components; nonsplit torus that is linearly reductive; lift defect (t+βt²)x²≠0 | `hsmooth` and `hconnected` needed and present | none |
| `exists_levi_complement` | reductive G; Gₐ; Gₘ⋉Gₐ; SL₂(W₂) in char p | coinvariants O(G), J=0, identity; coinvariants k, J=augmentation, k→k (J=0 gives k→k[x], not onto); L={(0,t)}, conjugate {(a(1−t),t)}; no Levi (McNinch (3.2.1)) | `CharZero` needed and present | none |
| §7.1 Borel conjugacy (R01) | GL₂ upper and lower Borels | conjugate by [[0,1],[1,0]]; the pinned theorem needs `hcontain`; the unconditional form elaborates at `a91d3aaf` | statable, absent | R01 |
| `exists_conjugate_eq_of_isMaximalTorus` | G trivial; μₚ×Gₘ; SL₂/ℝ | g=1; the only maximal torus is Gₘ; real eigenvalues vs e^{±iθ}, no real conjugator | `IsAlgClosed` needed and present | none |
| `lang_surjective` | Gₐ/𝔽₂; K=k; Gₘ/𝔽₃; constant C₂ | g²+g=a solvable over K̄; image {0} when K=k; g⁻¹g³=g², onto over K̄; g⁻¹F(g)=1 misses the nontrivial element | `IsAlgClosed K` and `hconnected` needed and present | none |
| `compact_complexPoints` | ∅; Spec ℂ; ℙ¹; 𝔸¹; subbasis with f=t and W the unit disc, f=0 | compact; one point; compact; 𝔸¹ not proper, ℕ⊂ℂ unbounded; the disc; all points or ∅ | `IsProper` needed and present; native topology at `2fd255d9` | R01 |
| orbit theorems | Gₘ on 𝔸¹ at x=1 and x=0; Gₘ on ℙ¹; C₂ on two points | D(t) with closure 𝔸¹ and boundary dim 0<1; {0} closed with boundary ⊥<0; closed orbits {0},{∞}; closed two-point orbit | hold; native at `2fd255d9` | R01 |
| `integral_pbw` | m=r=0; Y=ℤ with no roots; A₁ monomial (1,0,1) | {1} spans ℤ⊂ℚ; binom(h,n) is a ℤ-basis; fe, and ef=fe+h | holds; nonvacuous | none |
| `permutation_extension_nonsplit` | n=2; n=1; n=3 | B₂=ℤ→ℤ/2: 2a=0 forces a=0, but a must be odd; S₁=1 splits, so `2≤n` is needed; a lift of (12) has odd exponent sum and its square is not 1 | holds | none |
| `exists_characterKernelEquiv` (R02) | ℤˣ×ℤ with χ(n)=(−1)ⁿ; Q₈→C₂²; non-central ι | (1,1)↦(−1,1); i↦−i, j↦j, ij↦−ij; twist not multiplicative | true but generic | R02 |
| 7.3 Bruhat | GL₂(𝔽₂); ℙ¹(𝔽_q) | 6=2+4; 1+q cells, 3 at q=2 | holds | none |
| 8.3 Res_{K/k}Gₘ | 𝔽₂(t), K=k(√t); 𝔽₃(t), K=k(t^{1/3}) | (1+aε)(1+bε)=1+(a+b)ε, dim 1; ε²-coefficient b+d+ac, dim 2 | holds | none |
| 11.0 dictionary | Gₐ with v=1; u=2t; Gₘ; SL₂ | exp(t)↦1, t²↦0; 2·(1/2)=1; D(t⁻¹)=(0·1−1·1)/1²=−1; [E,F]=diag(1,−1) | holds | none |

## Not verifiable

- **The `milne-iag` manifest entry** records `iAG200.pdf` (version 2.00, 2015), whose numbering differs from the README's 2017 locators: for example, it has no 5.65, and the Bruhat theorem is 22.67 there. All 2017 locators above were verified against the author-page `iAG2017.pdf`, which is in the cache. The manifest URL should name that file. The manifest is outside this folder, so this is not a finding.
- **Uncertified texts.** `waterhouse`, `borel` and `springer` are uncertified; they are cited without locators, for no statement.
- **Not re-read this round.** Humphreys (1972) §26, Serre's GAGA §2 no. 5, Conrad–Gabber–Prasad and SGA 3 XIX.

## Source issues

- **Error** in milne-iag (2017 edition) at Remark 12.56, p. 249: the source says that over characteristic p an algebraic group is linearly reductive iff its identity component is a torus and p does not divide the index; it should be that the identity component is of multiplicative type (μₚ is linearly reductive by Prop. 12.54 and connected, but is not a torus), or the statement should be restricted to smooth groups; affects nothing.
