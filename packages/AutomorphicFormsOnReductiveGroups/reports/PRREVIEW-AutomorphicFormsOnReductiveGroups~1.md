# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at c00e220)

**Verdict:** needs changes

The gate fails at this head (six `<a id=` anchor residues; an UPWARD edge and a CYCLE with NoncompactQuantumSymmetry). Two further roadmap-level cycles are invisible to the dependency check because the other roadmap is not in the merge order. The §2.2 supplier citation points at material that exists only in a revision pull request of LieHighestWeight, not on main. The mathematics of the sampled targets and of the two Lean headlines checked out; the findings are structural and editorial.

## R01 (P1) — Dependency cycle with NoncompactQuantumSymmetry

Location: `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` lines 11, 37, 55, 301, 307, 370, 492 ("NoncompactQuantumSymmetry M4 supplies the normalized rank-one smooth models…"; "NoncompactQuantumSymmetry M0; this section compares its projectors").

Claim: NoncompactQuantumSymmetry M4 and M0 are prerequisites of §§2.1, 2.3–2.4.

Witness: the dependency check prints `UPWARD: AutomorphicFormsOnReductiveGroups (#61) -> NoncompactQuantumSymmetry (#137) at README lines [55, 492]` and `CYCLE among: AutomorphicFormsOnReductiveGroups, NoncompactQuantumSymmetry`. NoncompactQuantumSymmetry's README at its open head (#1015) consumes this roadmap: line 9 ("AutomorphicFormsOnReductiveGroups §2.1 for the topology-free finite-orbit-span predicate … and its strongly continuous compact-group Banach density theorem"), line 654 ("Consume the topology-free algebraic prefix of AutomorphicFormsOnReductiveGroups §2.1"), lines 892 and 988. Its M4 is "Poincaré and Lorentz representations" (line 2027); the rank-one induced models are at its line 2126.

Repair: make NoncompactQuantumSymmetry a consumer only. Delete every supplier citation of it (the Scope paragraph at line 11, the contracts paragraph at lines 37 and 55, the M0 row of the §2.1 table at line 301, the sentence at line 307, the M4 comparison block in §2.3 at line 370, the Layer 2 Dependencies entry at line 492). §2.3 keeps the general normalized induction, the inversion adapters `induction_inversion_covariance`, `induction_inversion_involutive`, `induction_inversion_rightTranslate` and the SL₂ Checks, stated on this roadmap's own induced space; the comparison with NQS's rank-one line-bundle models, circle convention and Casimir scalar then belongs to NoncompactQuantumSymmetry as the consumer (it already imports §2.1). Re-run the dependency check: no UPWARD or CYCLE line may remain.

## R02 (P1) — Dependency cycle with SmoothBanachRepresentations (not caught by the tool)

Location: README lines 7, 53, 116, 217, 300, 461–463, 492 ("RepresentationTheory/SmoothBanachRepresentations supplies Lie test functions, Banach smooth vectors…"; "SB0–SB3 supplies…"; "SB4 supplies smooth-vector density").

Claim: SmoothBanachRepresentations SB0–SB4 are prerequisites of §§0.2 and 2.7, while SB4 "consumes §2.1's independent generic complex Banach density theorem" (line 53).

Witness: SmoothBanachRepresentations at its open head (#1145), README line 43: "AutomorphicFormsOnReductiveGroups §2.1 … owns the common topology-free orbit-span API and generic complex Banach compact-group G-finite density … SB4 consumes that interface"; its SB4 section (line 96 onward): "consume the same shared §2.1 orbit-span predicate and Banach density theorem". So each roadmap names the other as a supplier. The dependency check reports 208 roadmaps and no problem here only because SmoothBanachRepresentations is absent from the merge order (it lists AutomorphicFormsOnReductiveGroups at line 62 and has no SmoothBanachRepresentations line), so its edges are not loaded: a false negative of the tool, not a clean bill.

Repair: one direction of supply. Either (a) this roadmap stops consuming SmoothBanachRepresentations (then §0.2's `AdelicTestFunction`, §2.7's `smoothVectors`, `smoothVectorTopologyEquiv` and the Sobolev comparison must be constructed here, and SmoothBanachRepresentations stays a consumer of §2.1), or (b) this roadmap gives up ownership of the generic compact-group density prefix of §2.1 (delete `IsGFinite`, `gFiniteSubmodule`, `gFiniteSubmodule_dense`, `gFiniteSubmodule_dense_locallyConvex` here and cite the owner), which requires SmoothBanachRepresentations or CompactGroups on main to own it and its author's agreement. The README must not list the same roadmap under both "prerequisites" (line 37) and "Downstream consumers" (line 1282) for the same objects. Whichever direction is chosen, say in the report which roadmap owns the generic theorem.

## R03 (P1) — Dependency cycle with QuaternionicModularForms (not caught by the tool)

Location: README lines 11, 37, 49, 1195–1199, 1239–1241, 1278 ("QuaternionicModularForms §§2.1 and 3.1 owns the abstract level-form carrier…"; "Specialize QuaternionicModularForms §2.1's common `Forms` submodule").

Claim: QuaternionicModularForms §§2.1 and 3.1 are prerequisites of §§7.4–7.6.

Witness: QuaternionicModularForms at its open head (#934), README line 39, dependency table: "AutomorphicFormsOnReductiveGroups … §7.4's `inverseActionHeckeEquiv` and rational covariance model, §7.5's `automorphicEquiv`, §7.6's central-character carrier … the dependency is at the theorem level in both directions"; lines 604 and 643 consume `inverseActionHeckeEquiv` and `LevelAlgebraicModularForm`. QuaternionicModularForms is also absent from the merge order, so the dependency check loads no edge for it.

Repair: break the cycle by ownership. The natural owner of the inverse-action Hecke adapter is the owner of the Hecke action (QuaternionicModularForms §3.1): state `inverseActionHeckeEquiv` there and import it here, so that §§7.4–7.6 are pure specializations and QuaternionicModularForms never cites §§7.4–7.6. The alternative, owning the abstract carrier `Forms` here, contradicts line 11 and re-plans §2.1 of the other roadmap. Record the move in the report and have both READMEs agree.

## R04 (P1) — §2.2 consumes a LieHighestWeight section that exists only in a revision pull request

Location: README line 337 ("Consume LieHighestWeight Layer 9, 'Reductive enveloping centers and the actual invariant maps': `productEnveloping` and `splitEnveloping` supply `U(𝔤)≃S(𝔷)⊗U(𝔤')`, and `tensorCenterInclusion`, …"), repeated at lines 7, 41, 51, 81, 341 ("*Needs:* LieHighestWeight Layer 9, reductive enveloping centers, for the reductive centre and Harish-Chandra isomorphisms").

Claim: LieHighestWeight Layer 9 supplies `Z(U(𝔤))≃S(𝔷)⊗Z(U(𝔤'))`, the full reductive raw/dot and translated/ordinary Harish-Chandra isomorphisms and the named declarations.

Witness: on main, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` lines 1432–1534 (Layer 9: reductive Lie algebras and `gl_n`) contain the centre/derived-ideal decomposition, reductive irreducibles, `gl_n` weights, the `sl↔gl` transfer, the Pieri rule and the trace-form Casimir, and nothing about `Z(U(𝔤))`, a Harish-Chandra isomorphism for reductive `𝔤`, or any of the six named declarations; `grep` for `productEnveloping|splitEnveloping|tensorCenterInclusion` in that README and in its `Suggested.lean` finds nothing. The heading "#### Reductive enveloping centers and the actual invariant maps" and those names exist only at the head of pull request #1220 (its README line 1751), which revises a roadmap already on main. The brief's rule: a pull request that revises an existing roadmap is never a dependency; the roadmap is cited as it is on main. The pull-request description's statement that the maintainer granted the dependency on that revision is data for the human approver, not a resolution the README can rely on.

Repair: either declare the input as a supplier gap on LieHighestWeight Layer 9 with a precise `needs` sentence (reductive `𝔤 = 𝔷 ⊕ 𝔤'`, `𝔤'` Killing-semisimple over a characteristic-zero field with a splitting Cartan: the centre isomorphism `Z(U(𝔤)) ≃ S(𝔷) ⊗ Z(U(𝔤'))` and the ordinary-invariant Harish-Chandra isomorphism `Z(U(𝔤)) ≃ S(𝔥)^W` with `ρ` extended by zero on `𝔷`), stated under the LieHighestWeight subsection of "Exact supplier contracts" as `What LieHighestWeight must provide (gap:<slug>): …` and in the plan's `gaps`; or restore the reductive Harish-Chandra prefix as targets of §2.2 (the roadmap had it before commit ee18ae0d). Until then the six names at line 337 are citations of declarations that do not exist where they are cited.

## R05 (P3) — Anchor-tag residue and pseudo-subsections

Location: README lines 189, 201, 886, 900, 1131, 1181 (`<a id="invariants-hecke-operators"></a>` and five more); the bold-paragraph targets they label ("**Hecke operators on invariants (`invariantsHecke`, …)**", "**Coset systems and volume**", "**Universal anemic presentation…**", "**Galois eigensystems**", "**The shared adelic-lift predicate**", "**Arithmetic eigensystems and unitary conversion**"); the intra-document links at lines 1286 (`[the universal anemic eigensystems](#anemic-eigensystems)` and four more).

Witness: gate rule `residue`, six lines listed in the worker's gate output.

Repair: delete the six anchors; promote each bold-paragraph target to a numbered `### k.n` subsection (for example `### 0.6 Hecke operators on invariants`, `### 0.7 Coset systems and volume`, `### 5.9 Universal anemic presentations and eigensystems`, `### 5.10 Galois eigensystems`, `### 7.2a` → fold into `### 7.3`, `### 7.3a` → `### 7.4` and renumber), and replace the five anchor links in "Downstream consumers" by section numbers in prose.

## R06 (P3) — Markdown links to roadmap folders that are not on main

Location: README line 53 (`[SmoothBanachRepresentations](../RepresentationTheory/SmoothBanachRepresentations/README.md#sb4-…)`) and line 55 (`**[NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md).**`).

Witness: neither folder exists under `TauCetiRoadmap/` on main (both are open pull requests #1145 and #1015); commit c00e2203 says suppliers are cited by name, not by link, but these two links remain.

Repair: cite by roadmap name and section only (after R01 and R02 the NQS link disappears anyway).

## R07 (P3) — Source links on hosts that are not legal places

Location: README line 1302 (Kudla, *Tate's Thesis*, linked to a `platoeinsyu.github.io` page), line 1312 (Vogan, *Unitarizability…*, linked to `math.utah.edu/~ptrapa/math-library`), line 1314 (Kostant 1961, linked to `people.tamu.edu/~jml`), line 1308 (Lapid, linked to a CiteSeerX document id).

Witness: a personal GitHub page and two third-party "math library" pages are neither author pages, institutional repositories, open repositories nor publisher archives; the Annals papers and the Birkhäuser chapter are paywalled.

Repair: cite each by DOI and locator without a link (recorded as `uncertified` in the manifest); keep the author-page, arXiv, Numdam, Clay and Milne links, which are legal.

## R08 (P3) — Four locators point at the wrong place

Location and witnesses:

- §0.1, line 91: "(Getz, §5.1, pp.22–23 …)" for the definition of smooth finite-level functions on `G(𝔸)`. getz lines 1090–1102 (§5.1) define smooth vectors of a Hilbert representation of an archimedean group. The adelic smoothness definitions are Definition 3.3, line 846 (locally constant at finite places) and Definition 6.12, line 1564 (p.31).
- §4.2, line 616: "(… Getz, §11, pp.53–55)" for the cuspidal Hilbert space and discrete occurrences. getz lines 2637–2742 (§11) are the local philosophy of cusp forms (Jacquet functors, supercuspidals). The global material is §6.3, lines 1583–1597 (`L²₀`, Definition 6.15, density of `∪A₀(ξ,J)`), p.32.
- §1.1, line 223: "(… Vogan–Zuckerman, §1, Proposition 1.3, p.54, for the relative cohomology of unitary representations)". vogan-zuckerman lines 132–136: Proposition 1.3 is the K-type statement (a `δ` occurring in both `π` and `Λ𝔭⊗F`); the identification of continuous cohomology with `H*(𝔤,𝔨; H_K⊗F)` is Proposition 5.4, lines 690–696, p.74, which §5.2 already cites.
- §5.5, line 808: "compare Calegari–Geraghty, …, proof of Theorem 7.11, pp.39–40". calegari-geraghty-minimal lines 1815–1845: that proof is a Hochschild–Serre dimension count for `H⁰(X_Δ, ω(1,3−a))`; the temperedness/Mirković input is the proof of Theorem 5.5, lines 1067–1091, p.22.
- §3.5, line 570: "The source prints the conclusion as an equality … (Getz, §8, Proposition 8.6, p.39)". getz line 1981: Proposition 8.6 is "Gelfand pair iff `C_c^∞(G//K)` commutative" and prints no dimension statement; the claimed misprint is not at this locator.
- §4.5, lines 681–700: the Duke–Imamoğlu–Tóth page numbers 961–963 are those of the printed Annals version; the legally readable copy is the author preprint, where (5.6)–(5.11) are on pp.11–12 (duke-imamoglu-toth lines 476–513). Add "preprint pp.11–12" or cite the version read.

Repair: correct the six locators as above.

## R09 (P3) — Trace-form Casimir formula copied without its indexing convention

Location: README line 356: "This matches LieHighestWeight Layer 9's scalar `Σ_iμ_i(μ_i+n−1−2i)` at `μ=0` and `μ=(1,1)`."

Witness: with the one-based `i` of the Conventions (line 31, `ρ_i=(n+1)/2−i`, `1≤i≤n`) the displayed sum at `μ=(1,1)`, `n=2` is `1·(1+2−1−2)+1·(1+2−1−4) = 0−2 = −2`, contradicting the Check's correct value `2` two lines earlier. LieHighestWeight on main, README line 1493, writes the same sum with the qualifier "(zero-based)"; zero-based it gives `2+0 = 2`. The one-based form is `Σ_iμ_i(μ_i+n+1−2i)` (`1·3+1·(−1) = 2`).

Repair: write "(zero-based `i`)" after the sum, or restate it one-based as `Σ_iμ_i(μ_i+n+1−2i)`.

## R10 (P3) — Module docstring wording

Location: `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` lines 6–8 and 39 ("The statements here suggest Lean forms for headline milestones; discharging them finishes neither a layer nor the roadmap"; "These signatures are deferred until those carriers can express the stated mathematics").

Witness: the required form says the file states the roadmap's headline theorems against the pinned APIs and which are not statable and what each lacks; "deferred" is process wording the README style bans.

Repair: replace by "This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti; the following headlines are not statable at the pins because the named carriers are absent".

## Verified sound

**Gate and build.** The worker's gate at c00e220 fails only on `residue` (6) and `depcheck` (2); all other checks are 0. `lake env lean` on `Suggested.lean` elaborates in 10 s with `sorry` as the only two warnings. A scratch file with `#check @IsGFinite`, `#check @gFiniteSubmodule`, `#check @gFiniteSubmodule_dense`, `#check @gFiniteSubmodule_dense_locallyConvex` elaborated: the four types are exactly those of `scratch/signatures.md`; no section binder is lost (both theorems carry `[CompactSpace K] [T2Space K] [CompleteSpace E]` and the local-convexity instances explicitly). One-tactic probes on copies (every `sorry` replaced by `simp`, by `infer_instance`, by `rfl`): all six fail ("simp made no progress", "type class instance expected", "rfl failed"), so neither theorem is padding. `gFiniteSubmodule` has a real body (closure under `0`, `+`, scalars, proved). No `set_option`, no `lemma`, single `import Mathlib`, no sorry'd data.

**Lean against the pins.** Mathlib `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean` line 54) is a bare `G →* V →L[R] V` with no continuity in `G`, and `toRepresentation` (line 72) forgets to `Representation`; so the hypothesis `hπ : ∀ v, Continuous (k ↦ π k v)` of `gFiniteSubmodule_dense` and the joint-continuity hypothesis of the locally convex theorem are necessary and not redundant. `IsScalarTower ℝ ℂ E` pins the real structure to the restriction of the complex one (`(r•1)•e = r•e`), so `LocallyConvexSpace ℝ E` is the intended condition; `IsUniformAddGroup E` forces the uniformity to be the additive-group one, so `CompleteSpace E` is completeness of the topological vector space. README §2.1 (lines 305, 307) states the two theorems at the same generality as the Lean: compact Hausdorff `K`, complex Banach `E` with continuous orbit maps; complete Hausdorff locally convex `E` with jointly continuous action.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `gFiniteSubmodule_dense` (§2.1) | trivial `K`; `E=0`; `K=S¹` on `C(S¹)`; `K=∏C₂` on `C(K)`; `ℤ` regular rep | trivial `K`: every orbit span 1-dim, submodule `=E`; `C(S¹)`: trig polynomials dense, `‖R(θ)−I‖=2` so operator-norm continuity absent but orbit maps continuous; `∏C₂`: locally constant functions dense; `ℤ` (non-compact): point mass has infinite orbit span, `CompactSpace K` excludes it | true as stated | none |
| `gFiniteSubmodule_dense_locallyConvex` (§2.1) | `E=ℂ^ℕ` product topology; `E` Banach (agreement) | `ℂ^ℕ` is complete, Hausdorff, locally convex, not normable; Haar integration coordinatewise; joint continuity needed since Banach–Steinhaus is unavailable without barrelledness | true as stated | none |
| §0.1 level conjugation | `S₃`, `J=Stab(2)`, `y=(012)`, `j=(01)`, `f(g)=g(2)` | `R(y)f(1)=f(y)=0`; `R(y)f(y⁻¹jy)=f(y⁻¹jy²)=2`; `σ(01)σ⁻¹=(12)`, `σ⁻¹(01)σ=(02)` | invariance under `yJy⁻¹`, not `y⁻¹Jy` | none |
| §0.2 idempotent normalization | `vol(J)=2`; trivial group | `e_J*e_J=(1/4)(2·1_J)=(1/2)1_J=e_J`; `1_J*1_J=2·1_J`; `dim G∞=0` gives unit `1` | consistent | none |
| §0.3 volume exponent | `ℝ_{>0}`, `dt/t`, `H=max(t,1/t)`; `SL₂(ℝ)` | `∫H^{−r}dt/t=2/r`, diverges at `r=0`; density `sinh 2s`, `H=e^s`, converges iff `r>2` | `r₀` as stated | none |
| §0.4 `Gₘ²` height | `H'=H₀+(t₁−t₂)²`, `φ=t₂²η(t₁/t₂)` | on supp `η`: `t₂²≤4(t₁−t₂)²≤4H'`; `H₀≤H'≤H₀+H₀²≤5H₀²`; translate by `(2,1)` at `(t,t)`: value `t²`, `H'=t` | exponent-1 piece not translation invariant | none |
| §1.1 differential and relative cohomology | `sl₂` trivial coefficients; `(sl₂,SO(2))`, `(sl₂,O(2))`; `GLₙ(ℂ)/U(n)` | `dω(X,Y)=−ω(H)=−1`; `Λ^q𝔭` weights `0;±2;0` give `ℂ,0,ℂ`, reflection acts by `−1` on `Λ²𝔭` so `H²=0`; `𝔤_ℂ=𝔤𝔩ₙ⊕𝔤𝔩ₙ` relative diagonal gives `Λ(x₁,…,x_{2n−1})` | all Checks hold | none |
| §1.2 cocycle test | `f(x)=x²`, trivial action, `(1,2)` | `f(2)−f(3)+f(1)=4−9+1=−4` | matches | none |
| §2.2 Casimir and parameters | `gl₂`, `μ=0,(1,1)`; `det^m` | `Σ E_ijE_ji` on `det`: `1+1+0+0=2`; one-based formula gives `−2`, zero-based `2`; `ρ=(1/2,−1/2)`, `det^m ↦ (m+1/2,m−1/2)` | Check value right, displayed formula mis-indexed | R09 |
| §2.3 induction normalization | `a=diag(t,1/t)`, `t=2`; constants; parity | `δ_P(a)=t²`, covariance `t^{ν+1}`; constants need `ν=−1`; reducible iff `ν∈ℤ`, `ν≡ε+1 (2)`: `(1,0)` yes, `(0,1)` yes, `(0,0)` no; casselman-sl2 line 1228 says the same (`s` integer of parity `n−1`); Casimir `(s²−1)/4` (line 1203) equals `Ω=(ν²−1)/4`, so `q_B=−Ω=(1−ν²)/4`; `D_k⊂I(ε,k−1)` has `((k−1)²−1)/4=k(k−2)/4` | consistent with §2.6 and NQS convention sentence | none (R01 removes the NQS comparison) |
| §2.4 discrete-series criterion | `SO(3,3)`, `SO(n,n)` odd `n`, `SO(2n,2n)`, `Sp₂ₙ`, `SL₂(ℂ)`, `SO(1,1)` | ranks `3` vs `2`; `n` vs `n−1`; `2n=2n`; `n=n`; `2` vs `1`; `1−1=0` | matches | none |
| §2.5 Weil group | `j·2`; `|x|^s sgn^ε`; unipotent parameter | `(j2)²=2̄·j²·2=−4`; `norm(j2)=(−1)·4=−4`; `z↦|z|^{2s}`, `j↦(−1)^ε`; `((1,log|norm|),(0,1))` unbounded, not semisimple | matches knapp-archimedean lines 372–414 | none |
| §2.6 compact Cartan matrices | `H_c=−iJ`, `X_c=(A+iB)/2`, `Y_c=(A−iB)/2` | `[A,B]=2J`, `[X_c,Y_c]=−(i/2)·2J=−iJ=H_c`; `[J,A]=−2B`, `[J,B]=2A`, `[H_c,X_c]=iB+A=2X_c`; `exp(θJ)=r_θ`; on `v_ℓ`: `[X_c,Y_c]v_ℓ=ℓv_ℓ`; `Ω v_k=(k²−2k)/4` | relations and Casimir hold | none |
| §3.1 components | `GL₂/ℚ`, `K₀(N)`; `GL₁/F` | one double coset, stabilizer `Γ₀(N)` after `det>0`; class group indexes components | matches getz line 1574 `(6.3.1)` | none |
| §3.4 restricted tensor | empty stage; zero reference | empty tensor `=ℂ`; zero `w⁰_v` kills every tensor through the transition map | hypotheses necessary; getz Remark 7.1 (line 1793) on rescaling agrees | none |
| §4.2 cuspidality vs square-integrability | constants on `SL₂`; `E₄` | Borel constant term `1≠0`; `y^{k/2}E₄ ~ y²`, `∫y⁴dxdy/y²` diverges | matches | locator R08 |
| §4.3 standard character | `x=1/3`; adele `(1/2;0,0,…)` | `e^{2πi/3}·e^{−2πi/3}=1`; pairing with `1` gives `e^{πi}=−1` | matches | none |
| §4.5 Bessel and Hecke | `K_{1/2}`, `u=1`; `T_p²`; `p=2`; dataset | `11/4−3/2−5/4=0`, sign flip gives `1/2`; `T_p²=T_{p²}+T₁`; raw `3`, normalized `3/√2`; `a(p²)=a(p)²−1`; duke-imamoglu-toth lines 483–487 (factor `2y^{1/2}`, `a(1)=1`), 488–489 (parity), 511–513 (`91.14134,…`, third even) | matches | none |
| §5.1/5.2 algebraicity and coefficients | newform weight `k`; `D_k(μ)⊗V_{(a,b)}` | parameter `((k−1)/2,−(k−1)/2)`: C-alg iff `k` even; `a−b=k−2`, `a+b=−μ` from `χ_{D_k(μ)}=χ_{V^∨}`; `k=12`: `Sym¹⁰⊗det⁻⁵` at `μ=0` | matches | none |
| §5.3 defect | `Res PGLₙ`, real/complex places; CM degree `2d`; real-quadratic torus | `ℓ₀=⌊(n−1)/2⌋`, `n−1`; `2q₀=d(n²−1)−d(n−1)` gives `q₀=dn(n−1)/2`; torus: `ℓ₀=2−0−1=1`, `q₀=0` | matches | none |
| §5.5 purity arithmetic | `n=2`, `k=12` | raw sum `−10`, `w_C=−11`, twist `5`: `−10+10=0`; `D₁₂(0)` parameter `(11/2,−11/2)`, Casimir `12·10/4=30` | matches; chenevier-taibi lines 522–534 define algebraic by `±1` on `ℝ×⊂W_ℝ` | none |
| §5.8 eigensystems | `T=ℤ[X]`, `H=ℤ/8`, `c=4`; `𝔽₇` twist | `P(1)−P(−1)` even kills `4`; `(2,3)·χ=2 ↦ (4,12 mod 7=5)` | matches | none |
| §6.1 Hermitian datum | `SL₂`; `GSp₄` | weights `±2` on `𝔭^±`; `dim 𝔭⁻=3`, compact root `(1,−1;0)`, `K^h/A_h≃U(2)` mod signs; balanced weights `w,−w` sum to `0` | matches boxer-pilloni lines 150–156 and bcgp21 lines 3486–3494 | none |
| §6.3 GSp₄ coordinates | positives `(1,−1;0),(0,2;−1),(1,1;−1),(2,0;−1)`; `μ=(3,2;0),(4,2;−3),(3,2;1)` | sum `(4,2;−3)`, `ρ_T=(2,1;−3/2)`, `c_H=2+1−3=0`; `σ=(−2,−3;5)`, `λ=(2,0;−5)`, `λ∨=(0,−2;5)`; `(−2,−4;0),(3,0;0),(0,−3;0)`; `(−2,−3;7),(2,0;−7),(0,−2;7)`; chambers: `(4,2)∈C₀`, `(4,−2)∈C₁`, `(2,−4)∈C₂`, `(−2,−4)∈C₃` | matches calegari-geraghty-minimal lines 1056–1090 (`σ`, `λ`, `−w₀λ`, degree `3−j`) | none |
| §6.4 components | `ε=diag(1,1,−1,−1)`; `E(4,2)` | `ε²=1`, `ν(ε)=−1`; `E(k,l)^ε=E(−l,−k)`: `(4,2)↦(−2,−4)↦(4,2)` | matches pitale-schmidt lines 517–534 | none |
| §6.5 degree rule | `C_i` dual in `C_{3−i}` | `Ψ∩R_n^+` for `C₃,C₂,C₁,C₀` has `0,1,2,3` elements, so undualized `C_i ↦` degree `i` | consistent with Harris's formula as used by CG lines 1082–1086 | none |
| §6.6 separation | `(20,10),(12,12),(12,2),(5,0)`, `R=5` | pairings `11,19,27,8`; `1,11,21,10`; `11,11,11,0`; `5,5,5,0` | as stated; bcgp21 lines 3395–3398 hypothesis `k−l>R`, `l=2` or `l>R`; three-case list lines 3531–3539 | none |
| §6.6 Pilloni sign | `λ=(λ₁,0;c)`, standing `0>λ₁` | printed `λ₁≥R` empty; `k=−λ₁−1`, Thm 15.2.3.1 uses `k≥R−1` | README's reading correct | source issue below |
| §6.7 Kostant set | `g=1`, `κ=−k` | `κ+ρ=1−k`; `w=1`: `k−1≥0`; `w=s`: `1−k≥0`; `k>1 ⇒ {1}`, `k=1 ⇒ {1,s}`; `κ=1 ⇒ {s}` | matches boxer-pilloni line 122 | none |
| §6.8 scalar series | `Sp₄`, `k=3`; `U(2,2)`, `k=2` | `(2,1)+(3/2,3/2)−(1/2,−1/2)=(3,3)`, sign flip `(4,2)`; `(3/2,1/2,−1/2,−3/2)` | matches | none |
| §7.2 raising operator | identity, `y=1` | `R(H)φ=kf+2if'`; `R(X+Y)φ=2f'−ikf` (derivative of `(i cosh t+sinh t)/(i sinh t+cosh t)` at `0` is `2`); `U`: `kf+2if'=2iδ_kf`; `j(r_θ,i)=cosθ−i sinθ=e^{−iθ}` | matches | none |
| §7.3 Hecke normalization | `Δ`, `p=2` | `2^{1−6}·(−24)=−3/4`; `(t,s)=(−24,1024)`, constant term `2048`; converted `s'=1/2`, constant term `1` | matches getz lines 1674–1690 for the adelization | none |
| §7.4 inverse-action order | `S₃`, `f(g)=g(0)` | `(W_aW_bf)(1)=f(ab)=1`, `(W_bW_af)(1)=f(ba)=2`; scalar `a=2` gives `f(gu)=f(g)/2` | matches bcgp25 lines 5902–5907, ding lines 2930–2935 (`f(gu)=u⁻¹f(g)`) | none |

**Sources read at their locators (sampled targets).** getz (author page; §§3.1–3.4 lines 808–934, §6.3 lines 1562–1597, §§6.4–6.5 lines 1598–1721, §7.1 lines 1760–1800, Prop 8.6 line 1981, §11 lines 2637–2742); bernstein-krotz (arXiv v3; §2.4.2–2.5 lines 331–452, Thm 4.2–4.4 lines 780–841, Prop 9.6 line 1525, Thm 10.6 line 1722, Thm 1.1 line 56); bpcz (arXiv v1; 2.5.1–2.5.10 lines 758–903, 2.7.1 lines 1081–1096, A.0.2–A.0.3 lines 4962–4994); wockel (p.4 lines 136–175, Prop 2.8 line 383, §3 lines 457–562, Thm 3.3 line 552); knapp-archimedean (OCR; Thm 1 line 320, §3 lines 372–453, Thm 2 line 450, Thm 5 line 551); casselman-sl2 (§10 lines 1061–1241, §12 lines 1575–1625); vogan-zuckerman (Prop 1.3 line 132, Thm 5.3–5.6 lines 679–716, Thm 6.16 line 935, Prop 6.19 line 969); chenevier-taibi (§2.1 lines 508–548); calegari-geraghty-minimal (Thm 5.5 lines 1061–1091, Thm 7.11 lines 1815–1845); boxer-calegari-gee (v3; intro lines 14–33, Remark 1.2 lines 138–175); bcgp25 (§5.7 lines 5865–6022, Def 5.7.2 line 5909); ding (v2; §4.2.2 lines 2911–2962); duke-imamoglu-toth (author preprint; lines 474–513); pilloni-duke (author version; §5.1.6 lines 969–978, §§15.2.1–15.2.3 lines 4896–4951); boxer-pilloni (§1.3 lines 108–159); pitale-schmidt (§2.3 lines 428–441, §2.4 lines 516–543); bcgp21 (v3; §3.10 lines 3369–3547). Each supports the statement it is cited for, with the locator slips listed in R08.

**Library declarations opened at the pins.** Mathlib: `ContRepresentation` and `toRepresentation` (`RepresentationTheory/Continuous/Basic.lean` 54, 72); `Submodule.IsLattice` (`Algebra/Module/Lattice.lean` 67: `fg` and `span_eq_top`); `banach_steinhaus` (`Analysis/Normed/Operator/BanachSteinhaus.lean` 36, needs `CompleteSpace`); `Matrix.charpoly_fin_two` (`LinearAlgebra/Matrix/Charpoly/Coeff.lean` 228); `continuousCohomology` (`RepresentationTheory/Homological/ContCohomology/Basic.lean` 131) and `homogeneousCochains`; `IsHeckeTriple` (`NumberTheory/HeckeRing/Defs.lean`); `isotypicComponent` (`RingTheory/SimpleModule/Isotypic.lean` 178); `Subalgebra.centralizer_range_includeRight_eq_center_tensorProduct` (`Algebra/Algebra/Subalgebra/Centralizer.lean` 170, hypothesis `Module.Free R A` as the README says); `TestFunction` (`Analysis/Distribution/TestFunction.lean`). Tau Ceti: `exists_isMollifier` (`RepresentationTheory/Compact/ApproximateIdentity.lean` 211), `dense_representativeSubmodule` (`…/RepresentativeDensity.lean` 117), `haarAverage` (`…/Averaging.lean` 59), `haarProb` (`…/Haar.lean` 93), `stdPeterWeylBasis` (`…/PeterWeyl.lean` 711), `isotypicProjector` (`…/Character/IsotypicProjection.lean` 145), `range_isotypicProjector` (396) and `isotypicProjector_idempotent` (479), both with `IsUnitary` as the README states; `hcProjection` and `lift_hcProjection` (`Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean` 281, 305); `vermaCentralCharacter_dotAction` (`…/DotOrbit.lean` 180); `prodEquivTensor` (`Algebra/Lie/UniversalEnveloping/Prod.lean` 163); `symmetricAlgebraEquiv` (`…/Abelian.lean` 174); `HeckeCharacter` (`NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean` 70), `conductor` with its finite-order hypothesis (`…/Conductor.lean` 74), `finiteComponent` (84), `conductorExponent` (179), `conductorExponent_le_iff` (191), `conductorExponent_eq_zero_iff` (199), `eventually_conductorExponent_eq_zero` (211), `finiteConductor` (251), `count_finiteConductor` (275) in `…/FiniteComponent.lean`; `normPow` (`…/Shift.lean` 80); `normCharacter` (`…/Algebraic.lean` 141); `heckeSlashModularFormEnd` (`NumberTheory/ModularForms/HeckeSlash/ModularForm.lean` 127); `twistedHeckeSlashModularFormCharEnd` (`…/Nebentypus/ModularForm.lean` 161); `multiplicity_def` (`NumberTheory/HeckeRing/Multiplicity/Basic.lean` 76); `single_mul_single` (`…/Multiplication.lean` 124); `closure_range_toSpecialLinearGroup_eq_top_of_field` (`LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean`, over a field); `unitFiltration` (`NumberTheory/LocalField/MultiplicativeGroup.lean`). No Tau Ceti declaration states finite-dimensional orbit spans or K-finite density, so §2.1's objects are not duplicates at the pins.

**Cross-roadmap citations resolved.** On main: EtaleCohomologyFoundations F.4.0 (README line 850; `Suggested.lean` lines 275 `exists_stable_lattice_iff`, 298 `GaloisLattice.IntegralModel`, 360 `nonempty`, 365 `exists_pow_le`); CompactGroups Layers 0, 2, 5, 6 (Layer 5 has representative-function density and the approximate-identity argument); LieGroups Layers 0, 2, 7, 9; LieHighestWeight Layers 1–4, 6, 7 and 9 (but see R04); RootSystems Layers 4, 6; ModularForms Layers 0, 2, 3, 4, 5, 8G; DifferentialGeometry Layers 0, 1, 6 (6.2 Poincaré lemma); BanachAlgebras A7; ReductiveGroups Layers 1, 5, 6, 7; ReductiveGroupsPartII RG2.0a, RG2.3, RG2.4; GlobalNumberFields (Completed) Layers 5, 10; OperatorTheory. At open heads earlier in the order: AdelicAlgebraicGroups §§0, 1.1, 1.3–1.5, 2.1–2.3, 3.1, 3.4–3.6, 4.1–4.5, 5.1–5.3 all present; SmoothRepresentationsOfLocalGroups SR.0.1–0.4, SR.0d, SR.1.1–1.3, SR.4.1–4.2 present; ArithmeticGaloisRepresentations §§2.1, 2.2 and §2.7 (standard trace character defined at its line 2143, diagonal self-annihilator at 2157) present, though no backticked `standardAddChar` name occurs there (use the section, not the name); ArithmeticLocallySymmetricSpaces ALS.F.1, F.5 (`LocallySymmetric.lieCochains`, `.relative`, `.baseChange`, `.invariantForms` at its lines 968–971), F.6 (`LocallySymmetric.AutomorphicForm` at 989), F.7 (`cohomologicalRepresentation.finiteInfinitesimalCharacter` at 1098), ALS.0.1–0.3, ALS.1, ALS.3, ALS.4.5, ALS.5a present. The dependency check output is quoted in R01; "moved:" lines: none.

**Ownership.** The generic compact-group density theorem and orbit-span predicate are claimed by this roadmap and consumed by NoncompactQuantumSymmetry and SmoothBanachRepresentations; no roadmap on main states them (CompactGroups Layer 5 states density of representative functions in `C(G)` and `L²(G)`, not K-finite density in a Banach representation). Ownership against open pull requests whose files the brief did not give me was not checked.

**Principles.** No route-specific shortcut, no computational algorithm (the Maass dataset is a numerical Check with its source), no copied passages found in the sampled sections, no `set_option`, no sorry'd data, no edit outside the roadmap folder (`git diff --stat origin/main...HEAD` outside the folder is empty), `metadata.toml` carries only `topic`.

## Not verifiable

- Borel–Jacquet, Corvallis vol. I, §§4.1–4.6 (cited at §§0.1, 3.1, 3.2, 4.2, 7.1, 7.7): the DOI resolves to an AMS access-controlled page; no open copy found. Listed in `needs-references.toml`.
- Flath, Corvallis vol. I, Theorems 1–4 (§§3.3–3.5, 7.7): same.
- Langlands, *On the notion of an automorphic representation* (§3.2): the DOI returns 404 at Crossref and at the resolver; not sampled, listed for completeness.
- Harris, Ann Arbor vol. II, Theorems 3.4–3.5 (§§6.1, 6.2, 6.5, 6.7) and Clozel, Ann Arbor vol. I, Lemmes 3.14 and 4.9, Théorème 3.13 (§§5.2, 5.5, 5.7): the Milne-hosted scanned volumes are legal copies, but their OCR had not finished when this review closed; both statements are quoted consistently through calegari-geraghty-minimal lines 1076–1086 (Harris Thm 3.5 and the BHR degree formula) and chenevier-taibi lines 531–534 (Clozel's purity lemma), which is all this review relied on.

## Source issues

- **Misprint** in pilloni-duke at Theorem 15.2.2.1(2), author version p.108 (line 4927): the source says the constant `R` bounds `λ₁ ≥ R` for the family with `λ₂ = 0`, `0 > λ₁`; it should be `−λ₁ ≥ R` (equivalently `k ≥ R−1` with `k = −λ₁−1`, as in Theorem 15.2.3.1); affects a stated result.
- **Misprint** in pilloni-duke at §15.2.1, author version p.107 (line 4897): the source says the parameter satisfies `−λ₁ ≥ λ₂ > −λ₁`, which no `λ` satisfies; it should be `−λ₁ ≥ λ₂ > λ₁` as in §5.1.6; affects nothing.
