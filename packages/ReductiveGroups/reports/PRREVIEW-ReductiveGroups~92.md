# Review of ReductiveGroups (pull request #1332 at 7dbc27d)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/README.md` (4757 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (415 lines, 29 declarations, 13 sorried theorems) at `7dbc27d`, 521 lines changed since the head `0864778` that the previous review read. The pins are those of the branch's `lake-manifest.json`: Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`; the worktree's `.lake` directory is at exactly these revisions. Every citation of a pinned declaration below was checked at `a91d3aaf`. Two findings remain, both P3; no finding is blocking.

## Previous findings (r87)

- **r87 R01** (P2, the folder mixed two Tau Ceti versions: the cited Borel-conjugacy and Coxeter names were absent at the pin): **repaired**, by the second route the finding offered (stay at `a91d3aaf`). `Suggested.lean` lines 264–269 now state the unconditional theorem `BorelTori.exists_conjugate_eq_of_isBorelOverAlgClosed` on `TauCeti.HopfIdeal.IsBorelOverAlgClosed`; the docstring at lines 27–31 and README lines 224–234 and 1719–1727 cite the pinned `TauCeti.HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed` with its hypothesis `hcontain`; README lines 388–391 replace the two Coxeter names by "injectivity of the native surjection `TauCeti.weylCoxeterHom`". At `a91d3aaf` these resolve: `IsBorelOverAlgClosed` is `Borel/Basic.lean:148` (algebraic closedness and minimality among `IsBorelCandidate`, which is smooth, geometrically connected, geometrically solvable points, `Borel/Basic.lean:88–96`); `exists_minimal_isBorelCandidate` is `Borel/Existence.lean:100`; the conditional conjugacy theorem is `Borel/Conjugation.lean:161–171` with `hcontain` exactly as described; `weylCoxeterHom` and `weylCoxeterHom_surjective` are `Coxeter/Presentation.lean:57, 82`, and `Inversions/Length.lean:67–68` says `weylCoxeterSystem` is not there. The file now agrees with its pin. (At main's pin `2fd255d9` five of the headlines are proved natively, as r87 recorded; that is a merge-time matter for the approver and not a defect at the pins this head builds against.)
- **r87 R02** (P3, the generic cover-lift kernel lemma was not a headline): **repaired**. The four `CoverLifts` declarations are deleted; the docstring (lines 33–38) lists the §9A.1a-L lift theorem as not statable and names the signed cover as the missing carrier; README §9A.1a-L (lines 3392–3430) carries no backticked Lean name.
- **r87 R03** (P3, no stated order against the five open pull requests that change this folder): **not repaired**. The description is unchanged. Carried as R01.
- **r87 R04** (P3, run-together cross-references): **repaired**. A search for a roadmap name, "Layer", "Layers", "of" or "In" run directly into a digit finds 0 occurrences; lines 848 and 1058 now read "SchemeAndStackFoundations §0.7" and "§§0.3 and 2.6".

## R01 (P3) — No stated order against the five open pull requests that change this folder

**Location.** The pull request description (data): "The dependency order is #1332, then #447, then #1334"; "exposes its simply connected point specialization in `ChevalleyModelTargets.lean`"; "Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched."

**Claim.** The description states the merge order against every open pull request that changes this folder and describes the folder as it is.

**Witness.** `scratch/overlaps.md` (index of 2026-11-09) reports that #1676, #1797, #1807, #1808 and #1854 each conflict with this head in `README.md` or `Suggested.lean`. The folder contains only `README.md`, `Suggested.lean`, `metadata.toml`, `STATUS.md` and `PROGRESS.md`: there is no `ChevalleyModelTargets.lean` and no prototype. Carried from r82 R01 and r87 R03; no repair report marks it not actionable.

**Repair.** Add one sentence to the description saying which of #1676 and #1332 is rebased on the other, and that #1797, #1807, #1808 and #1854 carry this folder only as a copy to be dropped at rebase. Delete the two stale sentences.

## R02 (P3) — Two backticked names of this roadmap's own are not declared in `Suggested.lean`

**Location.** README line 437: "the *One constructor* paragraph (`pinnedModel`)"; line 3506: "`pinnedModel 𝓡` is constructed from the finite faithful weight family"; line 3707: "transfer the map to `pinnedModel`"; line 2175: "The dimension theorem is `finrank ℂ (indFromProjectedLevi P π M) = P.index * finrank ℂ M`".

**Claim.** A backticked name of this roadmap's own is declared in `Suggested.lean`.

**Witness.** `Suggested.lean` declares neither `pinnedModel` nor `indFromProjectedLevi` (its 29 declarations are listed under Verified sound), and neither identifier occurs in the pinned Mathlib or Tau Ceti (`grep -rw` over both trees at the pins). Every other backticked name of this roadmap's own in the README (the `AlgebraicOrbits`, `ClassicalPoints`, `LeviComplements`, `BorelTori`, `FiniteFieldPoints`, `IntegralPBW` and `BraidMonodromy` names, `reductive_iff_linearlyReductive`, `linearlyReductive_iff_torus`) is declared.

**Repair.** Write the two objects in prose, as the rest of §9B and Layer 7c do: at lines 437, 3506 and 3707 "the pinned model" (or "the pinned model of 𝓡"), and at line 2175 "the induced module has complex dimension `P.index` times that of `M`, by Tau Ceti's `finrank_indFDRep`". The statements stay as targets; nothing is added to `Suggested.lean`.

## Verified sound

### Gate, build and dependency check

- **Gate.** The worker's gate at 7dbc27d is all zero. My own run of `gate … --base origin/main` printed: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- **Build.** `lake env lean` on `Suggested.lean` exits 0 in 46 s with exactly thirteen `sorry` warnings, at lines 122, 131, 140, 150, 185, 197, 212, 236, 264, 280, 301, 395 and 409, and nothing else.
- **Dependency check.** `depcheck: 236 roadmaps, 2278 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. ReductiveGroups is on main, so it has no line in the merge order; every supplier it names is on main.
- **Diff outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Form.** `import Mathlib` plus ten `TauCeti.*` modules, all present at the pin (the new one, `TauCeti.Algebra.AlgebraicGroup.Borel.Basic`, included). No `set_option`, `lemma`, sorried data, `#eval`, `#print` or `#synth`. One module docstring naming each not-statable headline with its missing carrier; the three carrier claims I re-opened hold at the pin: `TauCeti.Pinning` (`Pinning/Basic.lean:88`) indexes its root-space generators by `torus.IsSimpleRoot borel α`; `CommHopfAlgCat.centerDefiningIdeal` (`Center/Basic.lean:301`) is in a section with `[Field k]`; `coinvariantsFppfQuotientIso` is for normal Hopf ideals (README 329–332 says so).

### Signatures and one-tactic probe

- **`#check` pass.** All 29 declarations were elaborated with `#check @TauCetiRoadmap.ReductiveGroups.<name>` appended to a scratch copy. The elaborated types carry every hypothesis the README states: the four orbit theorems `IsAlgClosed k`, `IsAffine G.left`, `Smooth G.hom`, `QuasiCompact G.hom`, `LocallyOfFiniteType X.hom`, `QuasiCompact X.hom`, `IsSeparated X.hom`; `compact_complexPoints` `IsProper X.hom`; `reductive_iff_linearlyReductive` `CharZero k`, `Algebra.Smooth k H`, geometric connectedness; `linearlyReductive_iff_torus` `Fact p.Prime`, `CharP k p`, smoothness, geometric connectedness; `exists_levi_complement` `CharZero k`, smoothness, geometric connectedness; the Borel theorem the two `IsBorelOverAlgClosed` hypotheses (which contain `IsAlgClosed k`); the torus theorem `IsAlgClosed k`; `lang_surjective` `Finite k`, smoothness, geometric connectedness, `IsAlgClosed K` and `hF`; `integral_pbw` `P.IsCrystallographic` with `D.reduced` a field; `permutation_extension_nonsplit` `2 ≤ n`. No section binder is lost. Nothing changed.
- **One-tactic probe.** On a scratch copy each `sorry` was replaced by `first | rfl | trivial | infer_instance | decide | (simp; done) | sorry`. All thirteen theorems still report `sorry`; none closes. No declaration restates a definition, mirrors a Check or computes a value.
- **Duplication at the pin.** At `a91d3aaf` there is no orbit local-closedness, closed-orbit, point-topology, Nagata, Levi-complement, Lang or integral-PBW theorem on these carriers: the only hits for the objects are `MultiplicativeType/LinearlyReductive.lean:61` (tori are linearly reductive, one direction of Nagata), `Kostant/Basis.lean:27–29` (simple-generator Kostant form and rational spanning, which §9A.2 cites), the dynamic Levi decomposition (`Dynamic/LeviDecomposition/Basic.lean`, pointwise) and the Weyl/Bruhat carriers of `GL_n`, `SL_n`, `Sp_2n` and the Kostant-form group schemes that the docstring lists.

### Seeded sample, against the text at its locator

Milne 2017 was read in the cache copy of `iAG2017.pdf` (the manifest's `milne-iag` entry is the 2015 version 2.00 file; see Not verifiable). In the 2017 copy printed page = PDF page − 12; the mapping was computed for every label below and all pages match the README.

- **0.2** — Prop. 3.6 (Hopf algebra iff `Spm` is an algebraic group) and Cor. 3.7 (`Spm` an equivalence to affine algebraic groups), pp. 66–67.
- **1.0a** — Remark 4.1 (representations are comodules), p. 84; Thm. 4.9 (faithful finite-dimensional subrepresentation of the regular representation), p. 87.
- **1.0b** — `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` present at the pin; Remark 4.1 as above.
- **1.1** — `jantzen-1985` (printed page = PDF page − 5): I.3.3 lines 1507–1536, `(M⊗k[G])^H`, functions with `f(gh)=h⁻¹f(g)`, left translation; 3.4 Frobenius reciprocity with `ε_M(f)=f(1)` lines 1548–1566; I.3.9 lines 1688–1695, injectives are summands of `I⊗k[G]`; I.4.14–4.16 lines 2102–2155, `Cⁿ(G,M)=M⊗k[G]^{⊗n}`, coface `Δ(f)−f⊗1`, cohomology equal to `H•(G,M)`; line 1487, `G` flat from 3.2 on, and 4.17 (line 2162) works over a general ring.
- **2.1** — Thm. 10.23 (p. 193), Props. 10.28–10.29 (p. 195), §10.14 (p. 190), Prop. 1.37 (p. 18).
- **3.1** — Thm. 5.13 (universal property of a quotient map), p. 101; Prop. 5.18 (every normal subgroup is a kernel with affine quotient), p. 103.
- **3.2** — Prop. 1.34 (identity component, geometrically connected, commutes with extension), p. 16; Prop. 2.37 and Def. 2.38 (π₀ universal among étale quotients, exact sequence, extension of the base field), pp. 51–52.
- **4.3** — Defs. 12.14 and 12.17, p. 236; Thm. 12.23 (equivalence with finitely generated Γ-modules, exactness) and Cor. 12.25 (purely inseparable extension), p. 240; §12g, p. 239.
- **5.1** — Prop. 14.3, p. 280; Thm. 14.5 (unipotent iff subgroup of `U_n` iff coconnected), p. 281; Cors. 14.6, 14.7, 14.9, p. 282; Cor. 14.12, p. 283; Cor. 14.18, p. 284; Thm. 16.30, p. 334.
- **5.2** — Cor. 14.8, p. 282; Prop. 6.42 and §6.46, pp. 134–135; Props. 19.9 and 19.11, pp. 399–400.
- **6.1** — Props. 19.1–19.2, pp. 397–398; Prop. 19.5, p. 398; Prop. 19.9, p. 399; Props. 19.10, 19.11, 19.13, p. 400.
- **6.2** — Def. 12.52, Remark 12.53, Prop. 12.54 with its footnote, p. 248; Remark 12.56, p. 249 (see Source issues); Prop. 22.41 and Thm. 22.42, p. 477; Cor. 22.43, p. 478.
- **7.2** — `conrad-feng` lines 2397–2401 (p. 58): `P=P_G(λ)=Z_G(λ)⋉U_G(λ)`, `R_{u,k}(P)=U_G(λ)` split and descending the geometric radical, `Z_G(λ)` a Levi `k`-subgroup; lines 5345–5346 (Prop. 12.3.1, p. 127): `U(k)` acts simply transitively on Levi factors and every maximal `k`-torus lies in a unique one.
- **8.2** — `conrad-rgs`: Def. 3.1.1 line 3334 (p. 81); Prop. 3.1.9 line 3518 (p. 85) and Cor. 3.1.11 line 3659 (p. 88); Thm. 3.2.6 line 3868 (p. 94, smooth quasi-affine scheme of maximal tori); Thm. 3.3.4 line 4072 (p. 98, centre of multiplicative type); Thm. 5.2.11 line 6592 (p. 157, smooth proper Borel scheme with ample `det(Lie B)*`); Thm. 5.3.1 line 6685 (p. 160, semisimple derived group); Thm. 6.1.17 line 8173 (p. 197).
- **8.3** — §6.47 and Ex. 6.48 (pseudo-reductive, `Res_{K/k}G_m`), p. 136; Prop. 19.9, p. 399.
- **Headline docstrings.** Prop. 1.65(b) and Prop. 1.66 with its proof, pp. 26–28; Cor. 1.39, p. 18; Cor. 17.3, Def. 17.6, p. 353; Thms. 17.9(b) and 17.10, p. 354; Thm. 17.96 and Cor. 17.97, p. 383, which write `g↦gF(g⁻¹)`; `mcninch` lines 236–252 (§3.1, p. 6) and 280–281 ((3.2.1), p. 7); `sga1` line 9399 (XII, Théorème et définition 1.1, p. 239, completed local rings agree), lines 9594–9608 (Prop. 3.1, p. 244, (iii) étale, (iv) smooth, (viii) separated) and 9639–9648 (Prop. 3.2(v) proper, p. 245).
- **Also opened.** Milne 23.25–23.26 (pp. 492–493), 23.55 (p. 501), C.53 (p. 624), 21.12 (p. 430), 21.32 (p. 434), 21.75 (p. 448), 21.80 (p. 450), 22.2 (p. 463), 22.21 and 22.27 (pp. 468, 470), 9.18 (p. 170), 9.19–9.21 (p. 171), 12.3, 12.5, 12.8–12.9 (pp. 231–233), 14.31–14.32 (pp. 288–289); `conrad-rgs` Thm. 6.1.16 (line 8159, non-empty base).

### Cross-roadmap citations resolved on main

- SchemeAndStackFoundations: §0.3 (README line 551), §0.7 (755), §0.9 (848), §0.29 Scheme Frobenius (1825), §1.1 (2071), §§1.14–1.18 (2458–2745), §2.6 (3437), §4.12 (5613).
- ModularCurves: §0B (688), §0E (839), §0F (886).
- RootSystems: Layer 1 (428), Layer 2 with §2.1 (616; its line 622 names `TauCeti.weylCoxeterSystem`) and §2.2 (656), Layer 4 (804), §5.1 (907), Layers 5–6 (905, 1035), `DynkinType.simplyConnectedRootDatum` (347).
- SmoothBundlesConnections B1.0 (221), B1.1 (315), B1.4 (421). LieHighestWeight Layers 3–4 (405, 537) and 7 (931). IntegralLattices `rationalizationIsometry`, `ofIntegralForm`, `carrierIsometry` (440). InductionRestriction Layer 2.1 and `Gassmann.almostConjugate_iff_permutation_equiv` (197–198). GroebnerGeometry G5 (394). AlgebraicTopology Stages 1 (289) and 4 (499). DGFloer Layer 1 item 2, which DGFloer itself calls Layer1.2 (157), with its based fibration sequence (503). LieGroups Layer 7 (787) and Layer 8 (1078). ReflectionInvariantTheory, NilpotentOrbits, SchubertGeometry, AlgebraicVectorBundles are on main. FormalConnectionsOpers, IntegralHeckeAndGaloisDeterminants and ReductiveGroupsPartII are named only as consumers.
- **Ownership.** ChevalleyGroups on main (lines 58–85) says its generic producers "live once in ReductiveGroups Layer 9A … and Layer 9B" and names `DynkinType.chevalleyGroupScheme` as that group; CFSGStatement on main (162–175) consumes §9B's named items, which the README's old → new list (431–444) maps. The five closest open roadmaps in `scratch/overlaps.md` cite ReductiveGroups as supplier (SchubertGeometry #1224 36 times, ClassicalGroupsPartII #1492 46, RootSystemsPartII #1731 22); LieHighestWeight #1220 and GroupSchemesOverABase #1522 have no checkout at the paths the brief lists, so ownership against those two heads was not checked. `scratch/overlaps.md` reports no cited id dropped elsewhere, no id defined only by an open revision, and nothing this pull request drops that others cite; the conflicting heads are R01.

### Pinned-name audit

Every backticked qualified or camel-case identifier in the README (219 of them) was searched, by its last component, in the pinned Mathlib and Tau Ceti trees. All resolve except the roadmap's own declared names and the two of R02.

### Adversarial pass

Each row gives the values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| 0.1 convolution | constant S₃; Gₘ at 2 over ℚ; zero test algebra | (12)(23)=(123), (23)(12)=(132); t↦2, t⁻¹↦1/2; one point with 0=1 | holds | none |
| 0.2 three views | Gₐ over k[ε]; trivial group; SL₂ | t↦ε survives, lost on k-points; one point everywhere; (I+E₁₂)(I+E₂₁)=[[2,1],[1,1]] vs [[1,1],[1,2]] | holds (Milne 3.6–3.7) | none |
| 0.3 base change | μ₂ to 𝔽₂, to ℚ; αₚ to k(s^{1/p}) | (t−1)², dim 2 nonreduced; ℚ×ℚ; K[t]/(tᵖ), dim p | holds | none |
| 1.0a dictionary | Gₘ weight 3 at a=2, dual, 1⊗2; Gₐ translation; tᵖ | 8v, 1/8, 2·4=8; t↦t+a; kernel μₚ, degree p | holds | none |
| 1.1 Hochschild | H=A=M; weight-one line over ℤ[t,t⁻¹] | d⁰=0, d¹=1−1+1=1, d²=0; H⁰=A, H¹=H²=0; d⁰(1)=1⊗(t−1) | holds (Jantzen 4.14–4.16) | none |
| 1.1 induction | trivial subgroup of C₂; f=id; M=0 | ℤ² with swap; equalizer M; 0 | holds (Jantzen 3.3) | none |
| 2.1 Lie | Frobenius on Gₘ in char p; μₚ; SL₂ | d(tᵖ)=0, kernel μₚ; dim Lie 1 vs dim 0; [E₁₂,E₂₁]=diag(1,−1) | holds | none |
| 3.1 quotients | (t−1),(t²−1) in k[t,t⁻¹]; (t−2) over ℚ; Gₘ/μ₂; αₚ×αₚ/αₚ | counits 0,0; counit −1; q(t)=t², 2 lifts only over ℚ(√2); k[y]/(yᵖ) | holds | none |
| 3.2 π₀ | S₃; μ₂/𝔽₂, /𝔽₃; μ₃/ℝ; αₚ×ℤ/2 | degree 6 nonabelian; 1 and 2; 3 with one real point; degrees p and 2 | holds | none |
| 4.1 Jordan | [[2,1],[0,2]]; I+E₁₂ in char 2 | 2I·[[1,1/2],[0,1]]; g²=I but g_u=g | holds | none |
| 4.2 D(M) | ℤ/p in char p; χ=3 on λ=−2; ×2 on ℤ | k[u]/(uᵖ), tangent dim 1; t↦t⁻⁶; kernel μ₂ even in char 2 | holds | none |
| 4.3 lattices | norm-one torus/ℝ; μₚ; Gₐ | (−m)(−n)=mn, X^Γ=0; X=ℤ/p, X_*=0; X=0 but dim 1 | holds (12.23) | none |
| 5.1 unipotence | Gₐ→U₂; μₚ coaction; Gₘ weight 1; SL₂ standard | (tE₁₂)²=0; v⊗t≠v⊗1; invariants 0; invariants 0 | holds (14.3–14.6) | none |
| 5.1 Lie–Kolchin | upper Borel of GL₂ on diag(2,3); norm-one torus/ℝ; constant S₃ | characters 2,3; no real stable line; no invariant line in dim 2 | hypotheses needed and present | none |
| 5.2 radicals | Gₐ; Gₘ; SL₂; Res_{K/k}Gₘ with p=2 | ideals 0, (t−1), (t−1)-type; dims 0 and 1 | holds (14.8, 19.9) | none |
| 5P exp/log | N=2E₁₂; E₁₂,E₂₃ in U₃/ℚ; E₁₂+E₂₃ in char 2 | I+2E₁₂; (1,3)-entries 1 vs 1/2; 1/2 absent | holds | none |
| 6.1 radicals | Gₐ; Gₘ; SL₂ in char 2 | (R,Rᵤ)=(1,1),(1,0); centre k[t]/((t−1)²) length 2 | holds (19.10) | none |
| `reductive_iff_linearlyReductive` | trivial H; Gₐ; constant ℤ/2 in char 0 | both true; both false (e₂+ae₁↦e₂+(a+t)e₁); excluded by `hconnected` | holds (22.42) | none |
| `linearlyReductive_iff_torus` | μₚ; ℤ/ℓ, ℓ≠p; norm-one torus of 𝔽_{p²}/𝔽_p; SL₂ Sym² in char 2 | linearly reductive, nonsmooth; ℓ components; nonsplit torus, linearly reductive; t·x² term, no splitting | `hsmooth`, `hconnected` needed and present | none |
| `exists_levi_complement` | G trivial; reductive G; Gₐ; Gₘ⋉Gₐ; SL₂(W₂) in char p | k→k with J=0; J=0 identity; k→k with J augmentation, J=0 fails (k→k[x]); L={(0,t)}, conjugate {(a(1−t),t)}; no Levi (McNinch (3.2.1)) | `CharZero` needed and present | none |
| 6A sign convention | H=Gₘ, V=Gₐ weight 1, b(t)=t−1 | db(s,t)=s(t−1)−(st−1)+(s−1)=0; reversed rule 2−2s | holds | none |
| 6B quotients | SL₂/T; Gₐ×Gₘ/Gₘ; Gₘ/μ₂; S₃/C₂; SL₂/B | xy=z(z−1) with z=ad, bc=z−1; k[x], dim 1; k[t²,t⁻²], degree 2; k³; ℙ¹ not affine, B not reductive | holds (Arzhantsev 2.2) | none |
| `exists_conjugate_eq_of_isBorelOverAlgClosed` | trivial group; GL₂ upper/lower; constant ℤ/2; μₚ; SL₂/ℝ | I=J=0, g=1; w=[[0,1],[1,0]] gives [[d,0],[b,a]]; only trivial Borel; G_red trivial; predicate false since ℝ not closed | holds (17.9(b) via (G_red)°, 1.39) | none |
| `exists_conjugate_eq_of_isMaximalTorus` | trivial G; μₚ×Gₘ; SL₂/ℝ | g=1; only torus Gₘ; real vs e^{±iθ} eigenvalues | `IsAlgClosed` needed and present | none |
| 7.2 parabolics | upper Borel of GL₂; P=G; λ=diag(t,1) over 𝔽₂ | upper entry a(t−s); one Levi; E₁₂↦tE₁₂, E₂₁↦t⁻¹E₂₁ | holds (Conrad–Feng 12.3.1) | none |
| 7.3 Bruhat | Gₘ; SL₂ root/coroot; GL₂(𝔽_q) | Φ=∅, W=1; pairing 2 in every char; 1+q cells, 3 at q=2 | holds (21.80) | none |
| 7C root subsets | A₂, w=s₁; w₀s₁; s₁w₀ | A={α₂,α₁+α₂}, I={α₁}; A_{w₀s₁}={α₂}; A_{s₁w₀}={α₁} | holds | none |
| 7C action, cocharacter, chart | (h,j)·u=huj⁻¹; 2ρ∨ in A₂; GL₂ n₀=[[0,−1],[1,0]] | hh′u(jj′)⁻¹ both ways; pairings 2,2,4; u(a)n₀e₁=(a,1) | holds | none |
| `lang_surjective` | Gₐ/𝔽₂ at a²+a+1=0; K=k; Gₘ/𝔽₃; constant C₂ | F(a)−a=1; x^q−x=0 on k; t↦t², √−1↦−1; constant 1 | `IsAlgClosed K`, `hconnected` needed and present | none |
| 7b intersections | P=Q; B⁺,B⁻ of GL₂; u=[[1,1],[0,1]]; GL₃ line/plane | L⋉U; T, two cosets; T∩uTu⁻¹ scalars; factors (2,3),(1,2),(1,3), cosets sizes 4,2 | holds (Dudas–Michel 8.9) | none |
| 7c–7f finite groups | GL₂(𝔽₂)=S₃, upper Borel; sign rep; S₃/C₂ counting | rank 3, trace 1; e_U=0; 3·2=6·1, 1·2=2·1, 0·2=3·0 | holds | none |
| 7e corner units | S₃, U=⟨(12)⟩, V=⟨(13)⟩ | z_U=cos²(π/3)=1/4 on the 2-dim irreducible, inverse (1,4) | holds | none |
| 7g Steinberg | unitary twist on GL₁, T of GL₂ | a^{q+1}=1, q+1 points; (q+1)² on T; σ²=F_{q²} | holds | none |
| 8.1 classification | rank 0 and 1 root-free; SL₂ vs PGL₂; diag(2,1) | dims 0,1; kernel μ₂ length 2; I+aE₁₂↦I+2aE₁₂ | holds (23.25–23.55) | none |
| 8.2 relative | SL₂/ℤ centre; Spec 0; S=Spec k⊔Spec k | μ₂ nonsmooth at 2, 3 points of ℙ¹(𝔽₂); empty group; ranks (1,1) vs (2,1) | holds (Conrad 3.3.4, 5.2.11) | none |
| 8.3 Res_{K/k}Gₘ | K=k; 𝔽₂(t), √t; 𝔽₃(t), t^{1/3} | Gₘ; (a+b)ε, kernel dim 1; ε²-coefficient b+d+ac, dim 2 | holds (6.48) | none |
| 9A.1a signed cover | A₂, order α₁<α₂ | ε(α₁,α₂)=1, ε(α₂,α₁)=−1, ε(α₁+α₂,−α₁−α₂)=−1, x_{−α₁−α₂}=−E₃₁; [ê,f̂]=−1=(−1)^{B}; Jacobi terms 0,−x_{α₂},x_{α₂} | holds | none |
| 9A.1a order change | A₂ reversed; A₃ fully reversed | ε′/ε=−1=σσ/σ; ratio 1, wrong −1 if {1,3} included | holds | none |
| 9A.1b folding | A₃, A₄, D₄ Cartan matrices; D₄→G₂, E₆→F₄ dims | [[2,−2],[−1,2]], [[2,−1],[−2,2]], [[2,−3],[−1,2]]; 6+6+2=14, 24+24+4=52 | holds | none |
| 9A.3 straightening | A₁: E^{(1)}E^{(1)}; HE; EF at a=b=1 | 2E^{(2)}; E(H+2); FE+H | holds (Humphreys 26.2) | none |
| `integral_pbw` | m=r=0; Y=ℤ no roots; A₁ tuple (1,0,1) | {1} spans ℤ; binom(h,n) basis, binom(h,2)∉ℤ[h]; fe, ef=fe+h | holds, nonvacuous | none |
| 9B charts | SL₂ a unit; Weyl translate; ℤ[x] point; 𝔽₂ count | [[a,b],[c,(1+bc)/a]]; n=[[0,1],[−1,0]]; det 1, no chart; 4+4−2=6 | holds | none |
| 9B.2–9B.3 | GL₂ block inverses; SL₂→PGL₂ on ℚ; D₄ triality pullback | det·det⁻²; diag(2,1) not in image; 4 vs 1 | holds | none |
| 9C distributions | Gₘ jets; Gₐ Frobenius; SL₂→PGL₂ tori; μ₀ at p=2; contraction p=3 | H·H=H+2binom(H,2); γ_k↦γ_{k/p}; binom(H,2)↦4binom(H′,2)+H′; 0,1,0; 0,0 but 1 | holds | none |
| 10A–10B weights, induction | binom(3,2); α=−1/3 digits; Gₘ λ=3; SL₂ λ=±1, char 2 Δ(2) | 3; 1,0,1,0,…; weight +3; dims 2,0; head dim 2 | holds | none |
| 10B contravariant form | SL₂ λ=2 basis v,Fv,F^{(2)}v | diag(1,2,1), rank 2 over 𝔽₂ | holds | none |
| 10C binary forms | p=3,n=4; p=2,n=2; R₂* at p=2 | socle 4-dim missing x²y²; y²↦c²u²+a²v², xy generates; 2ab=0 | holds | none |
| 10D Peter–Weyl, SL₂/N⁺ | (a,b)·t^λ; s_a n(−1/(ac)); u_c−u_a | a^{−λ}b^λ; s_c; 1/(ac) | holds | none |
| 11.0 dictionary | Gₐ exp(t); u=2t; Gₘ D(t⁻¹); SL₂ | 1, 0; 2·(1/2)=1; −1; [E,F]=diag(1,−1) | holds | none |
| 11A half-twist | (a,b)↦(aba⁻¹,a); square; S₃ with a=(12), b=(23); mirror rule | product ab; conjugation by ab; (123) vs (132), Hurwitz pair ((13),(12)); inverse | holds | none |
| `permutation_extension_nonsplit` | n=2; n=1; n=3 | 2a=0 forces a=0 but a odd; S₁ splits, so `2≤n` needed; square of a lift of (12) has nonzero exponent sum | holds | none |
| 11B–11F | A₁ cover; A₁×A₁; 𝔤𝔩₂ invariants; SL₂ differential at H; action w⁻¹t in A₂; ⟨s₁α₂,α₂∨⟩ | degree 2; (2a,2b); tr²−4det=(t₁−t₂)²; −2,2,1, det −4; w²t≠t for w=s₁s₂; 1≠2 | holds | none |
| Worked SL_n example | S(x_ij), Δ(x_ij) | adjugate; Σ x_ik⊗x_kj left factor first | holds | none |

## Not verifiable

- **The `milne-iag` manifest entry** records `iAG200.pdf` (version 2.00, 2015), whose numbering differs from the README's 2017 locators. All 2017 locators above were verified against the cache copy of the author-page `iAG2017.pdf`. The manifest is outside this folder; the entry should name the 2017 file.
- **Uncertified texts.** `waterhouse`, `borel` and `springer` are uncertified; they are cited without locators, for no statement.
- **Not re-read this round.** Humphreys (1972) §26 beyond Lemma 26.2's formulas, Serre's GAGA §2 no. 5, Conrad–Gabber–Prasad, SGA 3 XIX, Dudas–Michel, Ernst, Arzhantsev, Fang–Lim–Tan, Gros–Kaneda, Hedén (the last six were verified in earlier rounds and their passages are unchanged).

## Source issues

- **Error** in milne-iag at Remark 12.56, printed page 249: the source says that over characteristic p an algebraic group is linearly reductive iff its identity component is a torus and p does not divide the index; it should say that the identity component is of multiplicative type, or restrict to smooth groups, since μₚ is connected and linearly reductive (Prop. 12.54) but not a torus; affects nothing.
