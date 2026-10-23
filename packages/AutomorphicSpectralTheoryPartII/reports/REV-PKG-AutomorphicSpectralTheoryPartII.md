<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1008#issuecomment-6376166821 -->
Review (claude) of 90985e7

Verdict: needs changes

1. **F01** (P1) §3.2 factorized relative character has the wrong parameter in the second slot

   **Location.** `packages/AutomorphicSpectralTheoryPartII/README.md:981`: "prove the factorized relative-character identity J_B(λ,f)=Σ_v B(I_P(λ,f)v,I_P(conj λ,g₁*)v)+Σ_v B(I_P(λ,f*Z)v,I_P(conj λ,g₂*)v)"; the Check at line 987 repeats "overline λ".

   **Claim.** Moving `I_P(λ,g_i)` from the first slot to the second slot produces its Petersson adjoint.

   **Witness.** For K-type-preserving `T`, `Σ_v B(ATv,v)=Σ_v B(Av,T*v)`, and `I_P(λ,y)*=I_P(−λ̄,y⁻¹)` (unitary on `i𝔞_P*`). Model `I(λ,x)=e^{λx}`, `g=1_[0,1]`, `λ=1`: adjoint `∫g e^{x}=e−1≈1.718`; README slot `∫g e^{−x}≈0.632`.

   **Repair.** Replace `I_P(conj λ,g_i*)` by `I_P(−conj λ,g_i*)` in both sums (on `i𝔞_P*` this is `I_P(λ,g_i*)`), and change the Check to "the second slot uses −λ̄ and conjugate inversion". On the model, `I(−1,g*)=∫g(−x)e^{−x}dx=e−1`, equal to the adjoint. The printed bpcz formula carries the same slip (see Source issues).

2. **F02** (P2) gap `nash-schwartz-analysis` asks for what this roadmap and its parent already plan

   **Location.** `packages/AutomorphicSpectralTheoryPartII/README.md:47`: "Supply the Nash Schwartz product and embedding comparisons, complete-target integration, strong duality between the continuous rapid zeroth-order space and polynomially weighted Radon measures, and the weak-convolution comparison with norm-smooth measure vectors".

   **Claim.** A gap asks only for what no roadmap here or earlier provides, and states one contract.

   **Witness.** Line 829 makes the duality §2.12's own target ("identifies with the continuous sesquilinear dual of S₀⁰"); line 865 makes the norm-smooth measure comparison §2.13's route. Parent §0.12 already integrates continuous maps into quasi-complete targets.

   **Repair.** Delete the duality and weak-convolution clauses (owned by §§2.12–2.13 here) and the integration clause (cite AutomorphicSpectralTheory §0.12 in the *Needs:* of §§1.2 and 2.12). Keep one `needs`: the Nash Schwartz product and embedding comparisons on real algebraic groups, section §0.14. Make the same change to the slug's entry in `design/plan.json` `gaps`.

3. **F03** (P2) three more gaps are compound, and two clauses are already supplied

   **Location.** `packages/AutomorphicSpectralTheoryPartII/README.md:51` (`vector-holomorphy-slf`), `:87` (`kostant-minimal-types`), `:99` (`quotient-height-cusps`).

   **Claim.** Each `needs` names one precise result with its section.

   **Witness.** Line 51 bundles five results over parent §§0.11–0.15; its first (weak-to-strong holomorphy, locally bounded) is parent §0.15 `regularize` with E=ℂ. Line 99 requests "compatible exponential Siegel weights" and "restriction-compatible depth functions", which §§2.2–2.3 (lines 599, 625) construct here.

   **Repair.** Drop the clauses already supplied (cite parent §0.15; §§2.2–2.3 keep ownership). Split the remainder into one gap per result with its own section, for example `kostant-centralizer` (AutomorphicFormsOnReductiveGroups §2.2), `generic-tensor-semisimplicity` (§2.3), `minimal-type-detection` (§2.4), `k-type-growth` (§2.1); `slf-isotypic-sums` and `frechet-open-mapping` (parent §0.11); `cusp-fiber-bounds` and `deep-cusp-uniqueness` (AdelicAlgebraicGroups §3.6). Use the same slugs in the README contracts and in `design/plan.json` `gaps`.

4. **F04** (P3) §0.10 leaves the constant's quantifier unstated

   **Location.** `packages/AutomorphicSpectralTheoryPartII/README.md:415`: "There are M_S>0 and a real exponent shift r_S≥0 such that, for all M>0,r∈ℝ, `p_{1,M,r}(Sμ)≤C p_{1,M+M_S,r+r_S}(μ)`".

   **Claim.** As written, `C` reads as uniform in `M` and `r`.

   **Witness.** bplzz line 659: the constant is chosen after `M` and `r` (it depends on S, M and r).

   **Repair.** Write "there is `C_{S,M,r}>0` with `p_{1,M,r}(Sμ)≤C_{S,M,r}p_{1,M+M_S,r+r_S}(μ)`", and the same for the maximum over θ.

5. **F05** (P3) supplier and source locators that do not match the cited place

   **Location.** `README.md:921` "AutomorphicSpectralTheory §1.9 pseudo-Eisenstein EP_P^Q"; `:991` "its orthogonal decomposition from AutomorphicSpectralTheory Layer 4"; `:855` "T([G]_P)=⋃_N T_{n_P^N} from AutomorphicFormsOnReductiveGroups §0.4"; `:11`, `:157`, `:1449` "Isobaric strong multiplicity one"; `:479` "Kostant 1975, Theorems 4.8–4.9".

   **Claim.** Each cited section states the cited object.

   **Witness.** Parent pseudo-Eisenstein series are §1.6 (Paley–Wiener sections, Q=G only); the orthogonal cuspidal-data sum is §1.10 `cuspidal_data_orthosum`; AutomorphicFormsOnReductiveGroups §0.4 defines `T_sm([G])` only; the AL.3 item is titled "Strong multiplicity one for isobaric sums"; `sources.toml` has no Kostant entry.

   **Repair.** Cite parent §1.6 and say the intermediate `EP_P^Q` on the new spaces is constructed in §2.16; cite §1.10 at line 991; write "AutomorphicFormsOnReductiveGroups §0.4 for P=G; the [G]_P version is defined here"; use the exact AL.3 title; add Kostant 1975 to `sources.toml` through the sources service or cite it only as "as cited in BPLZZ".

6. **F06** (P3) two definitions have fewer than three Checks

   **Location.** `README.md:929` (§2.16 extended constant term and pseudo-Eisenstein maps: one Check); `:975–977` (§3.1 relative character `J_B`: two Checks).

   **Claim.** Every definition carries at least three discriminating Checks.

   **Witness.** The two Check lists at those lines.

   **Repair.** §2.16: add "for a compactly supported φ on `[G]_P` the sum `Σ_{P(F)\Q(F)}φ(γx)` has finitely many nonzero terms at each x" and "the adjunction `⟨CTφ,ψ⟩=⟨φ,EPψ⟩` fails if one side omits the quotient-measure normalization (factor vol)". §3.1: add "for B the Petersson form, `J_B(λ,f)=tr I_P(λ,f)`; f=0 gives 0; a non-orthonormal basis of one K-type changes the sum, a unitary change does not".

7. **F07** (P3) §3.7 is narrower than its source and than the module docstring

   **Location.** `README.md:1071`: "Let G be a finite product of `Res_{K_i/F}GL_{n_i}`" … "The statement for arbitrary reductive groups requires Lapid's hereditary property (HP); it is not asserted unconditionally here."; `Suggested.lean:22`: "Lapid inversion under hereditary (HP), including the GL products".

   **Claim.** README generality equals the source's and the docstring's.

   **Witness.** lapid line 924: Theorem 4.5 holds for every G satisfying (HP); BPCZ Theorem 2.9.8.1 is its GL-product instance.

   **Repair.** State §3.7 for every G satisfying (HP) and regular χ, with the GL products as the unconditional instance supplied through `hereditary-intertwining-bounds`; the docstring then matches.

8. **F08** (P3) §5.7 Check does not say which PGL₂ component can be dropped

   **Location.** `README.md:1467`: "For PGL₂ the residual constant representation can be separated from the continuous component associated with the trivial torus character".

   **Claim.** The refinement works in one direction only.

   **Witness.** bplzz lines 1490–1492: a T-character can keep the Borel component and drop the residual one, never the converse; the trivial representation's character occurs in the Borel datum at s=ρ.

   **Repair.** "A T-character on the unitary axis keeps the continuous Borel component and kills the residual constant representation; no T-character keeps the residual one while killing the Borel component."

9. **F09** (P3) downstream consumers precede this roadmap; transfer preservation has no owner

   **Location.** `README.md:1480`: "EndoscopicTransferAndUnitaryTraceComparison consumes the Schwartz kernel and support interfaces when extending compact trace comparisons."; `:17`: "Preservation of relative transfer is a separate comparison theorem, not a conclusion of scalar spectral normalization."

   **Claim.** Named consumers consume this roadmap and come after it; every needed result has one owner.

   **Witness.** The merge order lists EndoscopicTransferAndUnitaryTraceComparison at line 167, GanGrossPrasadUnitaryGroups at 261, this roadmap at 279. EndoscopicTransfer… cites nothing here. GanGrossPrasadUnitaryGroups' `gap:spectral-isolation` asks this theory to preserve transfer (BPLZZ Proposition 4.8); no roadmap plans that.

   **Repair.** Delete the EndoscopicTransfer sentence. In Scope, say that BPLZZ §4.2 Proposition 4.8 (base-change-compatible multipliers preserve smooth transfer) is not planned here, and that it must become a GanGrossPrasadUnitaryGroups §6.4 target using §4.3's scalar action. The intake should place this roadmap right after AutomorphicSpectralTheory, its last supplier, so that GanGrossPrasadUnitaryGroups' request points down.

10. **F10** (P3) the parent's Franke weighted spaces are not acknowledged

   **Location.** `README.md:699–701` (§2.6 smooth vectors in weighted L²) and `:883` (§2.14 `S_w`); Scope, lines 7–17.

   **Claim.** The same object owned elsewhere is cited, with the difference stated in one clause.

   **Witness.** Parent §5.7a's `S_log([G])=⋃_n S_{w^(−n)}([G])` (one n makes `w^(−n)Df` square integrable for all D) and §§5.1, 5.8–5.9's `S_p([G])` are smooth weighted-L² spaces on [G] for Franke weights.

   **Repair.** In Scope add: "AutomorphicSpectralTheory §§5.1–5.9 owns Franke's admissible-weight spaces on [G]; §§2.6 and 2.14 here are BPCZ's general-weight spaces on [G]_P and agree with them at P=G for Franke weights". Add a §2.6 Check: at P=G with `w=p²`, `(L²_w)^∞` is the parent's `S_p([G])`.

The package is a genuine Part II: it imports the parent AutomorphicSpectralTheory by section and plans none of it again; the dependency check is clean, `Suggested.lean` elaborates at the pins with only the three `sorry` warnings, and its three theorems are true, non-padding headlines. The blocking problems are one false displayed identity (§3.2, a sign inherited from a source misprint) and two supplier-gap defects (gaps that ask for what this roadmap or its parent already plans, and compound `needs`). Ten findings: one P1, two P2, seven P3.

## Verified sound

**Principles.** The parent was read in full by headings and at every cited section; it plans no Schwartz-multiplier, isolation or BPCZ §2.5 quotient-space theory, and its §7.0c "spectral isolation" is the Hecke-only base-change separation, a different object. Part II's Scope says where the parent stops (README:7). No route shortcut, no copied passage (spot-checked §§2.10, 4.2, 5.4 against bpcz line 1298, bplzz lines 1091 and 1105), no algorithm, no sorry'd data, no `set_option`, imports `Mathlib` only. A style scan found no process words, PR numbers, LaTeX delimiters, field-list tables or machine paths.

**Dependency check** (run with `--movable` against the merge order):

```text
depcheck: 28 roadmaps, 242 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: AutomorphicSpectralTheory (order 98), AutomorphicFormsOnReductiveGroups (80), AdelicAlgebraicGroups (38), SmoothRepresentationsOfLocalGroups (28), AutomorphicLFunctionsAndLocalFactors (96); on main: ReductiveGroups, RepresentationTheory/LieGroups, PDE, OperatorTheory/OperatorIdeals, OperatorTheory/SelfAdjointSpectralTheory, NoncommutativeGeometry; new-roadmap PRs of other authors: GlobalHolomorphicFunctions, ZerosOfLFunctions, VonNeumannAlgebras.

**Elaboration.** `lake env lean` on `packages/AutomorphicSpectralTheoryPartII/Suggested.lean`, run from the content checkout: exit 0. The only diagnostics were `declaration uses sorry` at lines 85, 98 and 108 (8 s). No Tau Ceti module is imported, so nothing was built. The pins match the manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

**Binder audit.** A scratch copy with `#check @name` for all ten declarations elaborated once. The types carry Λ, p and the rank bound; n, q and holomorphic ψ with its order bound; n, k, a, b, linear independence and finite A. There are no section variables. Each type matches its README statement; nothing changed.

**Headlines and padding.** Headlines are listed in the module docstring (15 not statable, each with its missing carrier). There is no reductive-group Schwartz algebra, adelic quotient or automorphic carrier at either pin; Tau Ceti has no automorphic modules; Mathlib's only "Weierstrass" file is power-series preparation. Three are stated: §0.2 `finite_rank_weierstrass_product`, §0.3 `polynomial_zero_fiber_interpolation` and `affine_lattice_interpolation`. One-tactic probe on a scratch copy, with `simp`, `rfl`, `infer_instance` and `exact?` on each theorem: 12 attempts, none closes (`simp` made no progress or left the goal; `exact?` could not close it). All seven definitions have real bodies and are used by a theorem. No padding, and no statable headline is missing.

**Sample of locators** (15 targets; theorem number, printed page, hypotheses and line checked against the extraction):

| Target | Locator checked | Result |
| --- | --- | --- |
| 0.8 | bplzz Lemma 2.10, p.11, line 495 | correct; README adds finite θ, which the proof needs |
| 0.10 | bplzz Lemmas 2.20–2.21 pp.14–16, 2.23 p.17, line 656 | correct; constant quantifier (R04) |
| 1.3 | bplzz Prop A.1, Lemma A.2 pp.43–45, line 2099 | correct; README adds W-invariance and the G⁰_der kernel |
| 1.6 | bplzz Prop 2.24 pp.17–19, line 803 | correct (README's max over θ∪{1} is implied by the source's max over θ) |
| 1.8 | bplzz Lemma 2.18 p.13, Remarks 2.17/2.26, line 590 | correct |
| 2.3 | bpcz (2.4.4.19), Lemmas 2.4.4.1–2.4.4.2 pp.206–208, line 1000 | correct; restriction-of-scalars Check recomputed (4 vs 2) |
| 2.10 | bpcz §2.5.7 pp.212–213, (2.5.7.6); §2.5.12 p.215; line 1298 | correct |
| 2.11 | bpcz §2.5.8 p.213, (2.5.8.7); lapid §2 | correct |
| 2.16 | bpcz §2.5.13, Lemma 2.5.13.1 pp.215–216, line 1415 | correct (supplier locator R05) |
| 2.18 | bpcz Prop 2.5.15.1, Cor 2.5.15.2 pp.218–220, line 1536 | correct |
| 3.2 | bpcz Prop 2.8.4.3 p.229, line 2043 | number and page correct; displayed formula carries a source sign misprint (R01) |
| 4.5 | bplzz Remark 3.10, Def 3.11 p.25, line 1231 | correct |
| 5.3 | bplzz Theorem 3.19 pp.29–30, line 1428 | correct |
| 5.4 | bplzz Theorems 3.6–3.7 p.23, line 1120; proofs p.30 | correct |
| 5.7 | bplzz Remark 3.20 pp.30–31, line 1459 | correct; Check direction (R08) |

The author flagged no unverified locator. Printed pages equal PDF pages for bplzz; for bpcz printed = PDF + 182; for lapid printed = PDF − 1 (Theorem 4.5 on printed p.22 ✓).

**Gaps.** All 18 slugs appear in both the README contracts and `design/plan.json` `gaps`, with identical `needs` text (mechanical comparison) and a named supplier. Fourteen are precise and minimal. Four are findings R02–R03. `hilbert-schmidt-nuclear-composition`, `local-sobolev-evaluation` and `real-plancherel-characters` were checked against OperatorIdeals (OI-B29–B41: no composite-to-trace-class theorem), PDE Lane A (Morrey for p>n only) and AutomorphicFormsOnReductiveGroups §§2.1–2.7 (no Plancherel). Each is a real gap.

**Library declarations opened at the pins.**
- `SchwartzMap`: Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75 (normed-space domain only).
- `Differentiable`: Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170.
- `Multipliable` / `Summable`: Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:114 (summation filter, default unconditional).
- `MeasureTheory.Lp`: Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89 (an a.e. quotient subgroup).
- `CentroidHom`: Mathlib/Algebra/Ring/CentroidHom.lean:56 (no topology).
- `ContinuousLinearMap.isOpenMap`: Mathlib/Analysis/Normed/Operator/Banach.lean:228 (Banach only, so the Fréchet open mapping is rightly a gap).

**Cross-roadmap citations resolved.**
- AutomorphicSpectralTheory: read at the head of its open roadmap pull request; it is absent from the main checkout dfdf9a3. §§0.11–0.15, 1.5–1.10, 2.1–2.5, 3.1–3.4, Layer 4, 4.7–4.14 and 6.1–6.4 exist.
- AutomorphicFormsOnReductiveGroups §§0.1–0.5, 2.1–2.7, 3.4–3.5 and 4.1–4.2 exist.
- AdelicAlgebraicGroups §§2.1–2.3, 3.1, 3.4–3.6 and 4.6–4.7 exist.
- SmoothRepresentationsOfLocalGroups SR.1.1–SR.1.3, SR.2.2, SR.3 and SR.4.1–SR.4.2 exist.
- AutomorphicLFunctionsAndLocalFactors AL.3: the isobaric construction and the isobaric strong multiplicity one item exist (title, R05).
- On main: ReductiveGroups Layer 7, LieGroups Layers 6–7, PDE Lane A, OperatorIdeals OI-B29–B41, B84 and Part C, SelfAdjointSpectralTheory Parts A–E, NoncommutativeGeometry N1 (completed projective tensors).
- VonNeumannAlgebras V4.Core (Hilbert–Schmidt pairings and trace class).
- GlobalHolomorphicFunctions "Preparatory primary factors and locally uniform products": it owns E_p, locally uniform products and the exact divisor, not the global growth bound, so §0.2's retained variant is justified.
- ZerosOfLFunctions standing finite-order convention and Layer 5.1–5.6: genus at most one only.
- ModularCurvesPartII §1.4a; CongruenceSpectralGap CSG.0–CSG.5 (board design); GanGrossPrasadUnitaryGroups §§6.3–6.4.
- AnalyticNumberTheoryPartI §§0.15 and 0.23 owns the finite-order Hadamard factorization and a small-|w| log-tail estimate, not the rank-bound global estimate: no overlap.

**Ownership against open work.** Checked through the roadmap service over main and all 331 open heads, and by grep over the board packages. Searched objects: canonical product, quasi-cuspidal, isolation, Harish-Chandra Schwartz space, T-multiplier and sharp symbols, typical cuspidal data, Delorme multipliers, multipliers with transfer. There is no second owner of a Part II target except R10. No declaration of `Suggested.lean` reuses another roadmap's fully qualified name.

**Adversarial pass** (one row per statement; values computed on both sides):

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: linear-first pairing | scalars 1, i | ∫1·conj(i)=−i; Mathlib ⟪1,i⟫=conj(1)·i=i | consistent | none |
| Conv.: δ_P^{±1/2} | GL₂ Borel, diag(a,1), \|a\|=4 | δ=4, δ^{1/2}=2, δ^{−1/2}=1/2 | consistent | none |
| Conv.: t_λ, L(X) | f=z; additive line | t₁z=z−1; π_t(L(X)f)=it·π_t(f): i, 2i | consistent | none |
| Conv.: ℝ/ℤ convolution | f=e_{−n} | kernel e_n(x)conj(e_n(y)); n=0→1, n=1→e^{2πi(x−y)} | consistent | none |
| L `HasRankBound` | ∅; ℤ (p=0,1); {1/(n+1)} | 0 sum ✓; Σ1/\|n\|=∞, Σ1/n²=π²/3 ✓; terms (n+1)^{p+1} not summable | correct | none |
| L `elementaryFactor` | p=0,1,2; w=0,1,2 | 1,1,1; 0,0,0; −1,−e²,−e⁴; E_p'(1)=−1,−e,−e^{3/2}; range p gives j+1≥1 | correct | none |
| L `canonicalProduct` | ∅; {0}; {0,a}, p=0 | 1 (no zero at 0); z; z(1−z/a), deriv 1 at 0, −1 at a | correct | none |
| L `partialCanonicalProduct` | Λ={0,1,2}, p=0, z=3 | ∅→3; {1}→−6; {1,2}→3 | correct | none |
| L `HasFiniteEntireOrder` | 1; e^{z²}; e^{e^z} | e^{1} bound (C=1,d=0); ≤e^{(1+\|z\|)²}; e^{e^x} beats every e^{C(1+x)^d} | correct | none |
| L `HasRapidVerticalDecay` | e^{z²}; e^{−z²}; 1; n=0 | e^{M²}e^{−y²} ✓; e^{y²−x²} ✗; (1+\|z\|)¹ unbounded ✗; point: any ν ✓ | correct | none |
| L `affineSpectralLattice` | k=0; b=(1); b=(1,1) | {a}; ℤ; LinearIndependent fails (1·b₀−1·b₁=0) | correct | none |
| L `finite_rank_weierstrass_product` | ∅; {0}; ℤ, p=1 | 1≤e^C; \|z\|≤e^{1+\|z\|}, deriv 1; sin(πz)/π ≤ e^{π(1+\|z\|)²}, deriv ±1; tprod=0 at zeros | true | none |
| L `polynomial_zero_fiber_interpolation` | n=0; ψ=0; q=z², ψ=sin πw | ν∈{0,1}; ν=0; ν=e^{z⁶}sin(πz²): Re z⁶≈−y⁶ dominates e^{π\|z\|²}, zeros {z²∈ℤ} | true | none |
| L `affine_lattice_interpolation` | ℤ, A={0}; iℤ; k=0, A=∅ | e^{z²}sin(πz)/(πz): 1 at 0, at it e^{−t²}sinh(πt)/(πt); e^{z²}sinh(πz); (z₁−a₁)e^{z₁²} | true | none |
| 0.1 rank | as L | as L | correct | none |
| 0.2 products | as L | as L; Λ={0,a} listed twice would give a double zero | correct | none |
| 0.3 interpolation | n=0, Ψ=0, rank 0 | as L; (1,1) independence fails | correct | none |
| 0.4 involutions | G_m; U(1); rootless ℤ² | θ={1}, Y={0}; θ={−1}, Y=ℤ; [[1,n],[0,−1]]²=I ∀n (infinite) vs coset ≤\|W\| | correct | none |
| 0.5 moderate | e^z; e^{−z²}; Θ={−1}, Y=ℤ | \|e^z\|≤e^M (r=0); e^{y²} unbounded; polynomial growth on ℤ | correct | none |
| 0.6 rapid | e^{z²}; 1; dim 0 | rapid; fails at r=1; N=M=ℂ | correct | none |
| 0.7 sharp | 1 on U(1); damped sinc; split torus | infinitely many nonzero ϖ ✗; only ϖ=0 ✓; Y={0} no condition | correct | none |
| 0.8 nonvanishing | U(1), a=0 and a=1/2 | sinc symbol: 1 at 0; e^{z²}sin(πz) at 1/2: e^{1/4}≠0, zero on ℤ | correct | none |
| 0.9 differences | f=z, f=1; f/z | (f(z)−f(−z))/z: 2, 0; 1→1/z not polynomial; t_λt_η=t_{λ+η} | correct | none |
| 0.10 extension | z²+z | divided difference 2 = 2f′(0)=2 | correct | R04 |
| 1.1 Schwartz | (ℝ,+); compact G; ℝ_{>0} | polynomial-coefficient ops = SchwartzMap; C^∞; (1+\|log t\|)^{−N}·t unbounded, not Nash | correct | none |
| 1.2 integration | additive line, t=1,2 | i, 2i; opposite sign −i, −2i | correct | none |
| 1.3 Delorme | (U(1)×SO(1,3))/μ₂ | Z⁰∩G_der={±I}, Z⁰∩G⁰_der={I} (−I has 1×1 block −1) | correct | none |
| 1.4 Kostant | torus, τ of weight 1 | δ(z)(α)=α+1=t_{−1}z(α); t₁z(α)=α−1 | correct (README fixes source sign) | none |
| 1.5 semisimplicity | SL₂(ℝ) at ρ | I(ρ) non-semisimple; identity continues holomorphically | correct | none |
| 1.6 L² estimates | compact SU(2) | inf chars ±(n+1) ⊊ Y=ℤ (0 missing): containment only | correct | none |
| 1.7 multipliers | μ=1; SU(2) symbol vanishing on ℤ∖{0} | T₁=id; T_μ=0 although μ(0)=1, so the kernel is "vanishing at actual characters" | correct | none |
| 1.8 K-types | SL₂(ℝ) limits of discrete series | constituents of I(sgn,0), inf char 0, K-types ±1 must be detected | correct | none |
| 1.9 adelic stages | support meeting 2 double cosets | S(G∞)²; finite-place C_c^∞ only | correct | none |
| 2.1 weights | e^t on ℝ_{>0}; n^a, σ^b | w(2t)/w(t)=e^t unbounded ✗; n(xu)≍n(x) ✓ | correct | none |
| 2.2 Franke weights | G_m, P=G; λ=0 | \|·\|^λ; d_{P,0}≍1, d_{−λ}=d_λ^{−1} | correct | none |
| 2.3 depth | GL₂ Borel; Res_{K/F}GL₂, deg 2, norm-2 idele | \|a\|; norm character 4, relative root 4^{1/2}=2 = diagonal depth 2 | correct | none |
| 2.4 Ξ | compact; scale c; modular cusp | bounded; c^{−1/2}; vol≍y^{−1}, Ξ≍y^{1/2}=d_ρ | correct | none |
| 2.5 SLF | zero map; trivial rep | closed image {0}, not embedding; ℂ with identities | correct | none |
| 2.6 weighted L² | ℝ, n=1+\|x\|, (1+\|x\|)^{−1} | ∫(1+\|x\|)^{−2}=2 <∞; ∫1=∞ in L²_{n²} | correct | R10 |
| 2.7 Sobolev evaluation | level/weight change | q depends on J, w (no uniform q claimed) | correct | none |
| 2.8 nuclear inclusion | weight order | σ^{d₀}w≥w: stronger→weaker | correct | none |
| 2.9 S₀ | compact indicator; n^{−2} | in S₀∖S₀⁰; n³·n^{−2}→∞ ✗ | correct | none |
| 2.10 S | tail y^{−a} | n^N y^{−a}=y^{N−a}→∞ for N>a ✗ | correct | none |
| 2.11 C | Ξσ^{−a}; Ξe^{−√σ} | σ^{d−a}→∞ ✗; σ^d e^{−√σ} bounded ✓, y^{N+1/2}e^{−√σ}→∞ ∉S | correct | none |
| 2.12 T₀ | cδ_y; δ_x−δ_y | \|c\|/w(y); TV distance 2 | correct | R02 |
| 2.13 T_w | e^{iy²} at cusp | (y∂_y)^k ~ (2iy²)^k: needs N≥2k ✗; 1∈T₁ | correct | none |
| 2.14 S_w | w=1; w=n | S_{1,N}=T_N; ⋂_r n^{r−N} decay = S; 1∉S_n | correct | none |
| 2.15 tensors | ℝ×ℝ | nonseparable Schwartz function in completion only | correct | none |
| 2.16 CT/EP | P=Q | identity, δ_P^P=1 | correct | R05, R06 |
| 2.17 approximation | cusp form | φ−CTφ=φ, arbitrary depth decay | correct | none |
| 2.18 decomposition | nonzero cusp form | all CT zero; needs the identity component | correct | none |
| 3.1 relative characters | B=Petersson; f=0 | J_B=tr I_P(λ,f); 0 | correct | R06 |
| 3.2 Arthur factorization | model e^{λx}, λ=1, g=1_[0,1] | adjoint e−1≈1.718 vs README slot 1−e^{−1}≈0.632 | false as written | R01 |
| 3.3 support | X=∅; X(G) | annihilator of dense S = {0}; F | correct | R05 |
| 3.4 projections | disjoint singletons | product 0, union sum | correct | none |
| 3.5 regularity | GL₂ χ⊠χ; χ₁⊠χ₂ | stabilizer order 2; order 1 | correct | none |
| 3.6 holomorphy | δ_P=4, s=1, s=0 | 4^{1/2}=2; 4^{−1/2}=1/2 | correct | none |
| 3.7 Lapid | GL products vs (HP) | source supports all (HP) groups | narrower | R07 |
| 3.8 kernels | trivial group; ℝ/ℤ | f(1); e_n(x)conj(e_n(y)) | correct | none |
| 3.9 kernel bounds | N₀ before w | order of quantifiers matches bpcz line 2431 | correct | none |
| 3.10 expansion | absolute value placement | inside each K-type sum, as at bpcz line 2481 | correct | none |
| 4.1 T-characters | T ⊇ all finite places; units | H^T=ℂ; unit value 1 | correct | none |
| 4.2 CAP | torus; T all finite | no proper parabolic, never CAP; condition vacuous, every χ CAP | correct | none |
| 4.3 T-multipliers | μ∞⊗h values 2, 3; U(1) | 6; 1⊗h not sharp | correct | none |
| 4.4 quasi-cuspidal | GL₂, trivial ω, f≥0 | R(f)1=(∫f)1≠0 ✗; anisotropic: all ✓ | correct | none |
| 4.5 typical | compact central torus | Casimir 0; differentials 0 vs 1 separated by γ⁺ | correct | none |
| 4.6 finite rank | multiplicity | repeated value counted once in Λ | correct | none |
| 4.7 finiteness | trivial derived group | central lattice required | correct | none |
| 4.8 annihilators | single bad Casimir c | q−c: 0 on fiber, q(χ)−c≠0 at target | correct | none |
| 4.9 surviving blocks | continuous blocks | finite list of blocks, not of representations | correct | none |
| 5.1 occurrence | M=G, unequal inf chars | no occurrence even if all finite places agree | correct | none |
| 5.2 mixed annihilators | h values 2 (datum), 3 (target) | h−2: 0, 1 | correct | none |
| 5.3 isolation | selector values 2, 3 | product 6, normalized 1 | correct | none |
| 5.4 non-CAP | proper datum occurrence | occurrence ⇒ CAP (contrapositive used) | correct | none |
| 5.5 preservation | π^K≠0, nearly isotypic part 0 | global operator 0, π(μ⋆f)=π(f) | correct | none |
| 5.6 GLₙ | GL₂, χ₁⊠χ₂ | isobaric SMO identifies the inducing multiset, not a constituent | correct | none |
| 5.7 refined | PGL₂ Borel vs residual | one-directional separation | Check ambiguous | R08 |

## Not verifiable

- Bernstein 1988 (`bernstein`, uncertified, paywalled): the README locators §3.4 key lemma pp.686–688 and §§3.4–3.5 pp.688–689 were not checked against the text. They agree with BPCZ's own citations at bpcz line 1271 and line 1282.
- Kostant 1975, Theorems 4.8–4.9: not in the manifest and not fetched, since it is outside the sample. The translation sign was checked independently by the torus computation above.
- Primary works cited only through BPLZZ or BPCZ were not read: Delorme 1986, Donnelly 1982, Müller 1989, Arthur 1978, Franke 1998, Lapid 2008. The README cites them only through those uses.
- The published Annals numbering of BPLZZ was not compared; the README cites the arXiv v3 numbering explicitly.
- No published correction to any source was looked up.

## Source issues

- **Misprint** in bplzz at Definition 2.1 and Lemma 2.2, p.9: the source says the rank is defined for integers p>0, yet takes the least nonnegative p; it should be p≥0, so finite sets have rank 0; affects nothing.
- **Misprint** in bplzz at Definition 2.3, p.9: the source says the function is µ but bounds ν in the strip supremum; it should be one symbol; affects nothing.
- **Error** in bplzz at §1.4 lattice convention, p.8, with Corollary 2.6, p.9: the source says a lattice need only make L⊗ℂ→U injective, which admits the dense ℤ[1/2]⊂ℂ, where Corollary 2.6 fails; it should require L finitely generated; affects a stated result.
- **Error** in bplzz at §2.2, before Definition 2.8, p.10: the source says root-datum automorphisms of order at most two form a finite set; it should restrict to a finite set such as one Weyl coset, since a rootless rank-two datum has infinitely many ([[1,n],[0,−1]]); affects a stated result.
- **Error** in bplzz at Remark 2.16, p.12: the source says infinitesimal characters of irreducible admissible representations equal the union over θ_G; it should say they are contained in it (compact SU(2) misses 0); affects a stated result.
- **Misprint** in bplzz at proof of Lemma 2.22, p.16: the source says the annihilating roots are t_λz; it should be t_{−λ}z, since a torus weight λ gives δ(z)(α)=z(α+λ) under t_wP(α)=P(w⁻¹α); affects nothing.
- **Misprint** in bplzz at proof of Theorem 2.13, p.21: the source says the strip exponent of a moderate symbol comes from Definition 2.8(2); it should be Definition 2.8(1); affects nothing.
- **Gap** in bplzz at proof of Lemma 3.12, p.26: the source says it suffices to count derived Casimir values at level K_M∩M_der; it should allow finitely many conjugate levels, since a fixed cusp form may vanish on M_der; affects the proof.
- **Gap** in bplzz at proof of Lemma 3.13, p.26: the source says derived Casimir counting gives finitely many typical data; it should also bound central characters by typicality and fixed level (done only in Lemma 3.14); affects the proof.
- **Error** in bplzz at proof of Proposition 3.17, p.28: the source says a bare spherical Hecke element serves as T-multiplier when infinitesimal characters agree; it should be multiplied by a sharp archimedean seed; affects the proof.
- **Misprint** in bplzz at Theorem 3.19(1), p.29: the source says the range is taken in decomposition (3.9); it should be (3.2); affects nothing.
- **Misprint** in bplzz at the paragraph after Theorem 3.19, p.29: the source says Theorem 1.3 follows using cuspidal strong multiplicity one; it should use the isobaric classification cited on p.2; affects nothing.
- **Misprint** in bplzz at Proposition A.1, p.43: the source says μ ranges over N(h*_ℂ); it should be the W-invariants, since μ(χ_π) needs W-invariance; affects nothing.
- **Misprint** in bplzz at Appendix A before (A.4), p.44: the source says the finite kernel is Z⁰∩G_der; it should be Z⁰∩G_der⁰, smaller for (U(1)×SO(1,3))/μ₂; affects nothing.
- **Misprint** in bplzz at Appendix A display before (A.6), p.45: the source says the target pairs S(G_der⁰) with central types and S(Z⁰) with derived types; it should swap them back; affects nothing.
- **Error** in bpcz at §2.5.4, before Lemma 2.5.4.1, p.210: the source says equivariant SLF morphisms with closed image are topological embeddings; it should add injectivity (the zero map fails); affects nothing.
- **Error** in bpcz at §2.5.9, p.213: the source says the weighted Radon-measure space is a continuous Banach representation; it should not be, since translated point masses stay at total-variation distance 2; affects nothing.
- **Misprint** in bpcz at Proposition 2.8.4.3, p.229: the source says the second slot carries parameter λ̄; it should be −λ̄, the Petersson adjoint of I_P(λ,g); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "90985e7", "job": "REV-PKG-AutomorphicSpectralTheoryPartII", "model": "opus", "worker": "fable-rev37"} -->
