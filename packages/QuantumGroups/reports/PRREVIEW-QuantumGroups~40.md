# Review of QuantumGroups (pull request #1705 at 4099168)

**Verdict:** accepted

This is a full review. The folder changed by 1800 lines since `3d02d53`, the head the previous review read. Most of that change is the merge of main (`8101f2c`), which brought in main's revision of this roadmap (`35c6d30f`). Against main the pull request changes only `README.md` (+389/−140 together with `Suggested.lean`) and `Suggested.lean`. Line numbers refer to `TauCetiRoadmap/QuantumGroups/README.md` unless a file is named.

No finding survived verification.

## Previous findings

The previous review (`~39`, head `3d02d53`) accepted the folder with no findings, so there is nothing to re-check.

The merge replaced parts of the text that review had read:
- the `Suggested.lean` module docstring, which now follows main's layout;
- the Layer 3 and Layer 4 section comments;
- Layer 0, now §§0.1–0.2 as on main.

Each replaced passage was reviewed afresh below.

## Verified sound

### Gate, order, build

- **Gate.** Re-run at `4099168`: every counter is 0 and the result is `OK`, exit 0. The worker's gate (`scratch/gate.md`) also reports `build=0`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
  - Against main the folder differs only in `README.md` and `Suggested.lean`.
  - `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's files.
- **Dependency check.** The required command, output unmodified. It has no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 228 roadmaps, 2123 edges, 0 problem(s)
```

- **Elaboration.** `lake env lean` on `TauCetiRoadmap/QuantumGroups/Suggested.lean` at the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, as in `lake-manifest.json`): exit 0.
  - There are exactly five warnings, all `declaration uses sorry`, at `:106`, `:135`, `:146`, `:154` and `:186`.
  - All seven `TauCeti.*` imports resolve.
  - The `module` header with `public import Mathlib` is the form 63 of the 199 `Suggested.lean` files on main use.

### Signatures, padding and headlines

- **`#check @` on all 9 declarations**, in a scratch copy elaborated as above. Each elaborated type matches its README statement:
  - `schur_orthogonality` carries `[TauCeti.StarCoalgebra ℂ A]`, irreducibility as `IsSimpleOrder (TauCeti.Subcomodule ℂ A H)`, and unitarity of the coefficient matrix.
  - `compactType_iff` carries no nontriviality hypothesis. This is correct: Mathlib's `Bialgebra` has `counit_one`, so on a subsingleton `A` we would get `ε(1)=ε(0)=0≠1`, and the zero ring carries no complex Hopf algebra. This is the §4.1 Check at `:968`.
  - The §8.5 declarations carry `[Fact (q ≠ 0)]`, and the headline also carries `q - q⁻¹ ≠ 0`, as at `:1804`–`:1806`.
  - `AlgebraicHaar` drops `[StarModule ℂ A]`. This is harmless: no field mentions it, and every headline carries it.
- **One-tactic probes** (scratch copy):
  - On `uqSl2_sphericalCategory`, `infer_instance` fails to synthesize. `constructor; intro X f; simp` makes no progress. `exact?` finds only the roadmap's own declaration.
  - The pin's only `SphericalCategory` instances are on `Center`, symmetric and ribbon categories (`Pivotal/Symmetric.lean:88`, `Pivotal/Ribbon.lean:89`, `Center/Pivotal.lean:194`).
  - `simp` makes no progress on `compactType_iff` or `haar_trace_iff_antipode_involutive`. `exact?` on `haar_modular_automorphism` finds only itself.
  - The two instances have real bodies built from `TauCeti.FiniteHopfModuleCat.rigidCategory`, `unitEvalNatIso` and `unitEvalNatIso_isMonoidal`, and the headline needs them to be statable.
  - Nothing is padding.
- **Headline theorems of the README, and how each is handled:**
  - **Stated:**
    - weighted Schur orthogonality (§3.1);
    - the compact-type equivalence, the unique modular automorphism and the Kac equivalence (§4.1);
    - sphericity of finite U_q-modules (§8.5).
  - **Native at the pin and named in the docstring:**
    - the Layer 8 presentation, PBW basis and domain property, Hopf structure, Casimir element and centre;
    - the classification, complete reducibility and local-finiteness characterization;
    - Clebsch–Gordan, quantum traces, the invariant form and the classical specialization.
  - **Not statable, and named in the docstring:**
    - standard solutions and the Temperley–Lieb comparison (Layer 0);
    - Haar existence (Layer 1);
    - arbitrary-Hilbert complete reducibility and Peter–Weyl (Layer 2);
    - completions and coamenability (Layer 4);
    - Layers 5–7;
    - the Biedenharn–Elliott pentagon and §8.6.
  - The docstring's reasons are true at the pins:
    - grep finds no minimal C*-tensor product, C*-category or dagger category in either library (the hits are convex-cone tensors and the unrelated `RingTheory/Dagger`);
    - Hilbert-module adjointable operators do not exist at either pin;
    - recoupling exists only for triple products (`ClebschGordan/Recoupling.lean:135`).

### Seeded sample

Each item gives the source locator checked, its result, and the values computed for the section's statements or Checks.

- **§2.2.**
  - The Mathlib route exists with the stated hypotheses:
    - `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` (`Analysis/InnerProductSpace/Spectrum.lean:436`);
    - `ContinuousLinearMap.finite_dimensional_eigenspace` (`:456`), which requires `μ ≠ 0`, as the README says.
  - Check on `U(s)=[[1,2],[0,−1]]`:
    - `U(s)²=I`;
    - `U*U=[[1,2],[2,5]]`, so the average of `U*U` and `I` is `[[1,1],[1,3]]`, with determinant 2;
    - `TU=[[1,1],[1,−1]]` and `U*(TU)=[[1,1],[1,3]]=T`.
  - Timmermann Theorem 5.3.3 is not verifiable (below).
- **§2.3.**
  - Checks: the C₂ multiplicities give 1+1=2. The S₃ multiplicities give 1+1+2·2=6.
  - Timmermann Propositions 5.3.7–5.3.8 are not verifiable.
- **§3.1.**
  - `nt` line 447: Theorem 1.4.2 is on PDF page 13, printed p.9, as cited. Line 819: Theorem 1.6.6, Step 1, printed p.18.
  - The transpose conversion is in the table.
  - `TauCeti.Comodule.map_antipode_mul_coefficientMatrix` (`MatrixCoefficient/Matrix.lean:174`) states `S(u)·u=1`. With `uu*=1` this gives `S(u)=u*`, entrywise `S(u_ij)=u_ji*`, as the README says.
  - `HopfAlgebra.antipode_mul_antidistrib` is at Mathlib `RingTheory/HopfAlgebra/Convolution.lean:63`. `TauCeti.StarCoalgebra.counit_star` (`Coalgebra/Star.lean:91`) and `TauCeti.HopfAlgebra.antipode_bijective` (`HopfAlgebra/Star.lean:85`) exist.
- **§4.3.** All four `bmt` locators hold:
  - Theorem 2.2, line 257, p.6: coamenable iff faithful Haar and bounded counit.
  - Theorem 2.8, line 461, p.10.
  - Corollary 2.9, line 478, p.11: a nonzero character on `A_r`.
  - Theorem 3.6, lines 858–865, pp.18–19: the `A_u→A_r` isomorphism and faithful `h_u`.

  These match the four equivalences and the intermediate-completion caveat. Checks: `|F_NΔ(F_N+1)|/|F_N|=2/(2N+1)`, and the Kesten norm `2√3<4`.
- **§5.1.**
  - `bmt` lines 600–604 (p.13) give `U=[[α,−qγ*],[γ,α*]]`, matching the README's matrix.
  - The new claim "u is unitary exactly when these five relations hold, for every real q" was recomputed.
    - The entries of `u*u` are `a*a+c*c`, `ac−qca` (up to star) and `q²cc*+aa*`.
    - The entries of `uu*` are `aa*+q²c*c`, `ac*−qc*a` and `cc*+a*a`.
    - Equating the diagonals gives `c*c=cc*`, and then the five relations; the converse is direct.
  - The coproduct and antipode follow from `Δ(u_ij)=Σu_ik⊗u_kj` and `S(u_ij)=u_ji*`: `S(c)=−qc` and `S(c*)=−q⁻¹c*`.
- **§5.2.**
  - `banica` lines 54–57: Proposition 1, with `E: 1↦ΣF_ji e_i⊗e_j`. Line 65: Lemma 1, `(E*⊗1)(1⊗E)=c·1`.
  - `malacarne` line 183: Lemma 2.1, p.3.
  - The new invariance identity `Σ_(j,l) u_ij F_lj u_kl=F_ki` reads `uFᵗuᵗ=Fᵗ`.
    - From `u=FūF⁻¹` we get `uᵗ=(F⁻¹)ᵗu*Fᵗ`, so `uFᵗuᵗ=uu*Fᵗ=Fᵗ`.
    - The identity is exactly `δ(E)=E⊗1` in the README's convention `(u⊠v)_((i,k),(j,l))=u_ij v_kl`.
  - The AM–GM bound uses `|det F|²=|c|^n`, so `Tr(F*F)≥n|c|`, with equality iff the singular values of F are equal.
- **§6.2.** All `malacarne` locators hold (lines 52–60, 126–127, 183, 202, 235 and 285; pp.2–5):
  - Theorem 1.1, with the five closure conditions and the ± cup;
  - `A=T(B(H)*)`, `B_n`, `I_n` and `I_(n+1)∩A_n=I_n`;
  - Lemmas 1.2, 2.1, 2.2 and 3.1, and Theorem 4.1.

  Checks: H=0 gives A=ℂ, and the ± cup condition holds trivially on the zero space. H=ℂ gives degree ≤1 dimension 2.
- **§7.1.**
  - `bmt` lines 614–646 (pp.13–14): Theorem 2.12 for `0<|q|<1`, and Corollary 2.13.
  - The new weighted-shift formulas are BMT's `ϕ(α)e_nk=c_n e_(n−1,k)`, `c_n=(1−q^(2n))^(1/2)`, `ϕ(γ)e_nk=q^n e_(n,k+1)` (line 619), relabelled.
  - BMT's `T_k=U_k*D_k` with `D_k−1` compact is the README's `a₀=S*D`.
  - BMT's Haar display omits a weight (Source issues). The README's formula carries it: `h(c*c)=(3/4)/(15/16)=4/5` and `h((c*c)²)=(3/4)/(63/64)=16/21` at q=1/2.
  - The q=−1 model satisfies all five relations at q=−1. For example, `ac=√(t(1−t))zw σ₃σ₁=−ca`, because `σ₁σ₃=−σ₃σ₁`.
- **§7.2.**
  - `banica` lines 42–46: Theorem 1. Line 75: Proposition 2. Line 72: `β=c⁻²‖E(1)‖⁴`.
  - `F=[[0,1],[−q⁻¹,0]]` gives `c=−q⁻¹`, so `sign(c)=−sign(q)` and `‖E‖²/|c|=|q|+|q|⁻¹`, consistent with the choice of q.
  - Banica's statement for every n∈ℕ fails at n=1 (Source issues). The README already restricts to n≥2 (`:1393`–`:1395`, `:1985`–`:1987`).
- **§8.1.**
  - `virelizier` lines 348–359, p.8: the relations, `ΔE=K⊗E+E⊗1`, `ΔF=1⊗F+F⊗K⁻¹`, `S(E)=−K⁻¹E`, `S(F)=−FK`. Proposition 2.4 gives `S²(x)=K⁻¹xK` and spanning by `F^mK^nE^p`, all as stated.
  - Virelizier assumes q is not a root of unity. The README takes PBW and the domain property for every q≠0 from the pin:
    - `pbwBasis` (`UqSl2/PBW.lean:184`) uses only `Fact (q ≠ 0)`;
    - `instIsDomain` is at `OreTower.lean:350`;
    - `TauCeti.OreExtension.isDomain` is at `OreExtension/Degree.lean:272`.
- **§8.2.**
  - `virelizier` lines 552–555 (Example 3.3, p.11) and lines 585–594 (Proposition 3.7 and Corollary 3.8, p.12).
  - `existsUnique_linearEquiv_ladderModule` (`SimpleClassification.lean:62`) takes `IsGenericQuantumParameter`, matching "at generic q".
- **§8.3.**
  - `virelizier` lines 625–636: Theorem 3.13 and Corollary 3.14, p.13.
  - The pinned hypotheses agree with the README:
    - `transcendental_casimir` (`Center.lean:103`) needs q≠0 only;
    - `center_eq_adjoin_casimir` (`:129`), `casimirScalar_units_mul_pow_inj` (`Casimir/Basic.lean:284`) and `isSemisimpleModule_of_finiteDimensional` (`CompleteReducibility.lean:300`) need generic q;
    - `e_mul_f_pow` (`Commutator.lean:47`) needs `q−q⁻¹≠0`.
  - The new EF form: `FE=EF−(K−K⁻¹)/(q−q⁻¹)` turns the toral term into `(q⁻¹K+qK⁻¹)/(q−q⁻¹)²`.
- **§8.4.**
  - `virelizier` lines 529–537 (§3.2): type 1 means a direct sum of the `q^n`-eigenspaces of K.
  - `isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` (`TypeOne.lean:370`) and `LadderModule.not_isTypeOne` (`:253`) take generic q.
- **§8.6.**
  - Pinned hypotheses agree with the README:
    - `instStarRing` (`UqSl2/Star.lean:156`) needs only `Fact (IsSelfAdjoint q)`;
    - `instStarCoalgebra` (`:202`) adds `Fact (q ≠ 0)`;
    - `invariantForm_pos` and `invariantForm_k_pos` (`LadderModule/InnerProduct.lean:115`, `:265`) need `0<q` and `q−q⁻¹≠0`;
    - `eq_smul_invariantForm` (`:338`) needs generic real q.
  - The recursion comment at `InnerProduct.lean:305`, shifted by one, is the README's `h_j/h_(j−1)=[m−j+1]_q/([j]_q q^(m−2j))`.
  - Timmermann Chapter 6 §2 is not verifiable.
- **§8.7.**
  - `virelizier` lines 638–642 (§4.1, p.13): `w_i=F^iw_0/(i)_q!`, `Fw_i=(i+1)_q w_(i+1)` and `Ew_i=q^(1−n)(n−i+1)_q w_(i−1)`, as quoted in the Needs line.
  - With `v_i=q^(i(i−1)/2)u_i` and `(t)_q=q^(t−1)[t]_q`:
    - `Fv_i=q^(−i)(i+1)_q v_(i+1)=[i+1]_q v_(i+1)`;
    - `Ev_i=q^(i−m)(m−i+1)_q v_(i−1)=[m−i+1]_q v_(i−1)`.
  - `ClassicalLadder.equivSl2Std` (`ClassicalSpecialization.lean:664`) sits under `[Field K] [CharZero K]` (`:657`). `isSl2Triple` (`:509`) needs `(m:K)≠0`. Both are as stated.

### Other new passages of this pull request

- **§2.1 legs.** Read in full and recomputed:
  - On elementary tensors, `⟨(ξ⊗a)⊗b,(η⊗a′)⊗b′⟩=b*φ(⟨ξ,η⟩a*a′)b′=⟨ξ,η⟩b*φ(a)*φ(a′)b′`, which equals the inner product of `ξ⊗φ(a)b` and `η⊗φ(a′)b′`.
  - Ontoness uses `φ(1)=1`.
  - Isometry for injective φ is valid because an injective star homomorphism of C*-algebras is isometric.
  - `W(S⊗c)W` sends `ξ⊗x` to `Sξ⊗σ(c)x`, so it agrees with `(S⊗c)_σ=S⊗σ(c)`.
  - `⟨WTWy,z⟩=⟨y,WT*Wz⟩`, so `WTW` is adjointable.
  - No other roadmap on main or at the 438 open heads builds these legs: `roadmaps grep` for legs along star homomorphisms and for `(H⊗A)⊗_φ B` matches only this pull request.
- **§0.1.**
  - Neshveyev–Tuset Definition 2.7.1 and the remark after it (`nt` lines 3236–3241, printed p.70) give `d(U)≥1`. The "equality iff invertible" step is the README's own additivity argument and is correct.
  - Theorem 2.2.19 (`nt` line 1633, p.36) and Remark 2.2.20(ii) (`nt` lines 1661–1663, p.37) define the tensorator by `(F₂⊗ι⊗ι)(ι⊗R_U⊗ι)R_V=R_(U⊗V)`. Its unitarity from Proposition 2.2.13 is the README's stated derivation.
  - The sign sentence is correct. `nt` lines 2431–2437 (printed p.52) normalise by `R̄=−τR`, with `(R*⊗ι)(ι⊗R)=−τ`, so `τ=−ε`. For `R=e₀⊗e₁−e₁⊗e₀` the zigzag gives `−e_k`, so ε=−1 and τ=1.
- **§0.2.**
  - `penneys` line 745 (Proposition 4.5.3, printed p.158), line 758 (Facts 4.5.5, p.159), and lines 941 and 1000 (Examples 4.6.12 and 4.6.14, pp.163–164).
  - At `[n+1]=0` the quotient keeps `f(0),…,f(n−1)`, which is the README's labels 0,…,m−2 with n=m−1.
  - The truncated rule is TemperleyLieb Layer 7's (`TemperleyLieb/README.md:891`, simples `X_0,…,X_(ℓ−2)`).
- **§§1.1 and 2.1.** `kustermansvaes` lines 163–200 (printed p.840) cover strict extensions and leg numbering. Line 743 (printed p.853) is Definition 2.1.
- **Supplier table on main `8101f2c`.**
  - CStarAlgebras:
    - C1.7 (`CStarAlgebras/README.md:468`): strict topology, the unique strictly continuous extension, and `M(C₀(X))=C_b(X)` with compact-uniform convergence;
    - C1.CommutativeMultiplierMorphisms (`:497`);
    - C4.1 (`:986`): multiplicative domain;
    - C5.1 (`:1112`): consumes V13b, with flip, associativity and functoriality with its norm bounds;
    - C5.2 (`:1143`): `C₀(X)⊗min A≅C₀(X,A)` and `C(X)⊗min C(Y)≅C(X×Y)` with pullback naturality;
    - C8.4 (`:1676`): the Toeplitz extension.
  - VonNeumannAlgebras:
    - V13b.SpatialNorm (`VonNeumannAlgebras/README.md:3744`), with slice maps of arbitrary bounded functionals and isometric inclusions (`:3760`–`:3767`);
    - V10.ModularTheory (`:2364`);
    - V10.KMS (`:2459`) with `σ_t(x)=Δ^(it)xΔ^(-it)`;
    - Layer 11 (`:2785`).
  - HilbertModules: H1 opposite-algebra convention (`HilbertModules/README.md:22`), `K_A(H⊗A)≅K(H)⊗min A` and `L_A(H⊗A)≅M(K(H)⊗min A)` (`:209`, `:213`), and H3 correspondences (`:264`).
  - LieHighestWeight Layer 0 with V(n) (`RepresentationTheory/LieHighestWeight/README.md:319`).
  - PivotalSpherical Layers 0–2 and 7 (`PivotalSpherical/README.md:257`, `:283`, `:318`, `:477`).
  - Every supplier roadmap is on main.
- **Downstream consumers.**
  - HopfologicalAlgebra §2.1 (`HopfologicalAlgebra/README.md:317`–`:331`) cites "Q8 item 5".
  - QuantumEnvelopingAlgebras (`:510`) cites "Q8 item 1".
  - CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras are later, open roadmaps.

### Citations resolved

- **Tau Ceti names.** All 152 distinct backticked `TauCeti.*` names in the README are declared at `2fd255d9`, together with the 27 unqualified short names (e.g. `casimir_mem_center`, `comul_f_pow`, `invariantForm_k_pos`, `tensorSignEquiv`). One needed a manual check: `TauCeti.OreExtension.isDomain` is at `OreExtension/Degree.lean:272`.
- **Mathlib and the remaining names.** All 22 checked by hand resolve at `1b1ccf4b` or the Tau Ceti pin:
  - `RingHom.powersMulSemiringAction` (Tau Ceti `OreExtension/SkewPolynomial.lean:61`);
  - `FDRep.ofShrink` (Tau Ceti `RepresentationTheory/FDRep/Basic.lean:314`);
  - `GroupLike.toUnits` (Mathlib `RingTheory/HopfAlgebra/GroupLike.lean:37`);
  - `IsSemisimpleModule.exists_end_algEquiv_pi_matrix_end` (`SimpleModule/WedderburnArtin.lean:146`);
  - `Rep.equivalenceModuleMonoidAlgebra` (`RepresentationTheory/Rep/Iso.lean:157`);
  - `PositiveLinearMap.norm_map_star_mul_le` and `norm_map_mul_star_le` (`GelfandNaimarkSegal.lean:113`, `:126`);
  - `WeakDual.isCompact_closedBall` (`Normed/Module/WeakDual.lean:270`);
  - `gelfandStarTransform_naturality` (`GelfandDuality.lean:370`).
- **Leads.** `scratch/citations.md` and `scratch/overlaps.md` list nothing missing, no dropped id and no id defined only by a revision.

### Ownership against open pull requests

- **Same Lean names.** `roadmaps grep` for the nine Lean names finds no other declaration of them on main or at the open heads. The only other `schur_orthogonality` hits are the classical `ContRepresentation` lemmas of CompactGroups, a different object.
- **Layer 0 objects.** CategoricalOperatorAlgebras (`rev/888`, head `b9c0a6fb`, `README.md:40`–`:46`) still claims CA1a/CA2a as the single home of C*-categories, standard solutions, unitary dual functors and signed self-dualities. TemperleyLiebOperatorAlgebras (`rev/867`, head `ba43cc7a`, §§1.3 and 2.1 at `:477`, `:1152`) still owns the trace-radical identification and the sign isomorphism.
  - Main's QuantumGroups (`:36`–`:59`, unchanged by this pull request) owns these objects in §§0.1–0.2.
  - A roadmap on main is earlier than every open one, so the correction belongs to those two pull requests, not to this one.
  - This pull request adds no new Layer 0 object. It adds `d(X)≥1` and the explicit truncated rule, both inside objects main already assigns to §§0.1–0.2.

### Description

The description's claims match the head:
- 389 added and 140 removed lines;
- four more Tau Ceti imports (three on main, seven here);
- five `sorry` warnings;
- the listed supplier sections;
- the four new §2.1 Checks.

One remark, with no change requested: the tool-generated `merge-order` block still names #1649. That pull request merged into main as `35c6d30f`, and `scratch/overlaps.md` lists no other open pull request changing this folder. The tools regenerate this block.

### Adversarial table

Values computed this round:

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `schur_orthogonality` vs `nt` 1.4.2(i) | F̃=ρᵗ | NT: `h(u_ij*u_kl)=δ_jl(ρ⁻¹)_ki/dim_q`, `h(u_kl u_ij*)=δ_ki ρ_jl/dim_q`. Swapping (i,j)↔(k,l) and using `(ρᵗ)⁻¹_ik=(ρ⁻¹)_ki`, `dim_q=Tr ρ=Tr ρ⁻¹` gives `Suggested.lean:111`–`:118` exactly | holds | none |
| `schur_orthogonality` at SU_(1/2)(2) | F̃=diag(2,1/2) | `h(a*a)=(1/2)/(5/2)=1/5`; `h(c*c)=2/(5/2)=4/5`; §7.1 series `(3/4)Σ4^(−2j)=(3/4)/(15/16)=4/5` | agrees across §§3.1, 7.1 | none |
| §3.1 basis-change Check | W=(1/√2)[[1,i],[i,1]] | `WFW*=[[5/4,−3i/4],[3i/4,5/4]]`; `W̄FWᵗ=[[5/4,3i/4],[−3i/4,5/4]]`; `h(v₁₁v₁₂*)=(3i/4)/(5/2)=3i/10` vs `−3i/10` with the wrong weight | holds | none |
| `compactType_iff`, zero ring | A=0 | `counit_one` forces `0=ε(0)=ε(1)=1` in ℂ, so no instance exists | no hypothesis needed | none |
| `compactType_iff`, ℂ[x], x primitive | Δx=x⊗1+1⊗x | `(id⊗h)Δx=x+h(x)1` vs `h(x)1` forces x=0; unitary coefficients are scalars, span ℂ≠ℂ[x] | both sides false | none |
| `compactType_iff`, ℂ[C₂] | u group-like | `h(a+bu)=a`, `h((a+bu)*(a+bu))=|a|²+|b|²`; span{1,u}=⊤ | both true | none |
| `haar_modular_automorphism` | SU_(1/2)(2) core | `θ(a)=f₁*a*f₁=2·2·a=4a`; `h(aa*)=4/5=4·h(a*a)`; θ⁻¹ gives `1/20` | θ pinned | none |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2) | ℂ[S₃]: `h(u_gu_k)=δ_(gk,e)=δ_(kg,e)`, `S²u_g=u_g`. SUq: `h(aa*)=4/5≠1/5=h(a*a)`, `S²c=c/4≠c` | both true / both false | none |
| `uqSl2_sphericalCategory`, generic | q=1/2, L₁⁺ | `tr K⁻¹=2+1/2=5/2=tr K=[2]` | holds | none |
| `uqSl2_sphericalCategory`, q=±1 | ℂ with K=2, E=F=0 | `EF−FE=0=(K−K⁻¹)·0⁻¹` in Lean; rightTrace `tr(K⁻¹)=1/2`, leftTrace `tr(K)=2` | hypothesis needed | none |
| Trace formulas of §8.5 | basis e_i, pivot g | rightTrace `Σe^i(g f e_i)=tr(gf)`; leftTrace with coev `Σe^i⊗g⁻¹e_i`: `tr(fg⁻¹)`; at g=K⁻¹: `tr(K⁻¹f)`, `tr(Kf)` | matches `Trace.lean:88`–`:94` | none |
| Pivot K⁻¹ | S²(E) | `S²E=S(−K⁻¹E)=K⁻¹EK=q⁻²E`; `Δ(K⁻¹)=K⁻¹⊗K⁻¹`, `ε(K⁻¹)=1` (`Hopf.lean:192`, `:208`) | group-like, implements S² | none |
| §2.1 legs, sign character | C(C₂), H=ℂ | `(id⊗Δ)u=u⊗u=(u⊗1)(1⊗u)`; ι₂ twice gives `1⊗u²=1≠u⊗u` | legs discriminated | none |
| §2.1 counit leg | T=1[s], φ=ε | `T_ε=1[s](e)=0`, `‖T‖=1` | contractive, not isometric | none |
| §2.1 flip | W on `A⊗min A` | `W((1⊗1)(u⊗1))=1⊗u`, `W(1⊗1)(u⊗1)=u⊗1` | σ-semilinear, not a module unitary | none |
| §2.2 Check | U(s)=[[1,2],[0,−1]] | T=[[1,1],[1,3]], det 2, `U*TU=T`, `U²=I` | holds | none |
| §5.1 five relations ⇔ unitary | q=1/2, a=0, c=1 | `u*u` diagonal `a*a+c*c=1`, `q²cc*+aa*=1/4≠1` | not unitary, as Check | none |
| §5.1 antipode | q=1/2 | `S(c)=−c/2`, `S(c*)=−2c*`, `S²c=q²c=c/4` | holds | none |
| §5.2 cup | F=[[0,1],[−2,0]] | `FF̄=−2I`; `E=−2e₀⊗e₁+e₁⊗e₀`, `‖E‖²=5`; bound 5/2; `J(e₀)=Fe₀/√2=−√2e₁` | holds | none |
| §5.2 invariance | general F | `uFᵗuᵗ=uu*Fᵗ=Fᵗ` | holds | none |
| §7.1 endpoints | q=±1 | `∫t dt=1/2`, `∫t²dt=1/3` vs 4/5, 16/21 at q=1/2 | series not substituted | none |
| §7.1 q=−1 model | a=√(1−t)zσ₃, c=√t wσ₁ | `a*a+c*c=1`, `ac=−ca`, `ac*=−c*a`, `c*c=cc*=t` | relations hold at q=−1 | none |
| §7.2 parameters | F=[[0,1],[−2,0]] | d=5/2 → |q|=1/2, `sign(q)=−sign(c)=+`, `δ=−(q+q⁻¹)=−5/2`; β=25/4; dims 1, 5/2, 21/4, 85/8 | holds | none |
| §7.2 n=1 | F=f | `u=ū`, `u²=1`, `u⊗u≅1` | Banica Thm 1 fails, README excludes | none |
| §8.1 q=i Ore check | q²=−1 | `δ_E(FK)=K(K−K⁻¹)/(2i)=(−1)(−K)(K−K⁻¹)/(2i)=δ_E(q²KF)`; `K⁴E=q⁸EK⁴=EK⁴` | PBW without genericity | none |
| §8.2 L₂⁺ | q=1/2 | weights 1/4, 1, 4; `EF−FE=diag(5/2,0,−5/2)=[2−2j]` | holds | none |
| §8.2 L₁⁻ | q=1/2 | `(K−K⁻¹)/(−3/2)=diag(3/2,−3/2)/(−3/2)=diag(−1,1)` | holds | none |
| §8.3 Casimir | q=1/2 | `(q^(m+1)+q^(−m−1))·4/9`: 10/9, 17/9, 65/18; EF form toral `diag(8/9,17/9)`; mixed `diag(8/9,26/9)` | holds | none |
| §8.3 q=1 | K=[[1,1],[0,1]] | totalized relation gives `EF−FE=0`; K not diagonalizable | genericity needed | none |
| §8.6 metric | q=1/2, m=1 | `h₁=q=1/2`; `⟨Ev₁,v₀⟩=1=⟨v₁,2Fv₀⟩`; orthonormal `E₁₂=q^(−1/2)=√2`, `F₂₁=q^(1/2)=1/√2`, `[E,F]=diag(1,−1)` | holds | none |
| §8.6 cup | general q | `ΔE(v₀⊗v₁−qv₁⊗v₀)=qv₀⊗v₀−qv₀⊗v₀=0`; `ΔF(…)=qv₁⊗v₁−qv₁⊗v₁=0` | holds | none |
| §8.7 rescaling | q=1/2, m=2 | `F u₁=(5/4)u₂`, `F v₁=(5/2)v₂=[2]v₂`; `E v₂=q·q⁻¹v₁=v₁` | holds | none |
| §0.1 d≥1 | invertible X | `d(X)²=d(X⊗X̄)=1+d(Y)`, so `d=1` iff `Y=0` | holds | none |
| §0.2 truncated rule | m=3; m=4 | m=3: `1⊗1=0` (upper index min(2,0)); m=4: `1⊗1=0⊕2`, `2⊗2=0`, `[4]=(√2)³−2√2=0` | holds | none |
| §0.2 d=3/2 | positivity | `[3]=5/4`, `[4]=3/8`, `[5]=9/16−5/4=−11/16<0` | holds | none |
| §3.4 KMS convention | `φ=Tr(h·)` | `F(t+i)=Tr(h^(it)xh^(−it)hy)=φ(yσ_t(x))`, so `φ(xy)=φ(yσ_(−i)(x))`; `σ_t(a)=4^(it)a`, `τ_(−i)(c)=f₋₁*c*f₁=c/4=S²c` | same convention as V10.KMS | none |

Rows carried from earlier rounds (`~37`–`~39`) for passages this pull request leaves unchanged:
- §1.1 Checks on ℤ and S₃;
- §1.2 monoid {1,0} (dimension 3 of 4);
- §3.3 traces 5/2, 2, 1/2;
- §4.2 pentagon `(δ₁,δ₃,δ₆)`;
- §6.1 reconstruction dimensions 2 and 6.

All were re-read against the current text and are unchanged.

### Library declarations opened this round

About 90 declarations, at Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.

- **Tau Ceti.**
  - `CategoryTheory/Monoidal/Pivotal/`: `Spherical.lean:69`, `Trace.lean:88`, `:93`, `Basic.lean:187`.
  - `CategoryTheory/Monoidal/Rigid/DualFunctor.lean:325`.
  - `QuantumGroups/UqSl2/`:
    - `QuantumTrace.lean:41`; `LadderModule/Basic.lean:589`, `:607`;
    - `Center.lean:103`, `:129`, `:187`; `Casimir/Basic.lean:138`, `:260`, `:284`; `Commutator.lean:47`;
    - `CompleteReducibility.lean:165`, `:228`, `:300`; `Character.lean:241`, `:268`;
    - `LocallyFinite.lean:63`, `:104`, `:115`; `TypeOne.lean:253`, `:349`, `:359`, `:370`; `SimpleClassification.lean:62`;
    - `PBW.lean:184`; `OreTower.lean:283`, `:350`;
    - `ClebschGordan/Basic.lean:112`, `:142`, `:326`; `ClebschGordan/Projection.lean:43`, `:168`;
    - `ClassicalSpecialization.lean:104`–`:115`, `:162`, `:509`, `:657`, `:664`;
    - `Star.lean:108`–`:213`; `LadderModule/InnerProduct.lean:78`, `:115`, `:240`, `:265`, `:305`, `:338`;
    - `Hopf.lean:184`–`:208`; `Antipode.lean:73`; `InverseParameter/Basic.lean:94`.
  - `Algebra/OreExtension/Degree.lean:272`, `SkewPolynomial.lean:61`.
  - `Algebra/Coalgebra/Star.lean:91`.
  - `Algebra/HopfAlgebra/`: `Star.lean:65`, `:85`; `Cancellation.lean:72`, `:97`, `:149`, `:178`, `:219`; `InverseAntipode.lean:36`.
  - `Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:174`.
  - `Algebra/Category/FiniteHopfModuleCat/`: `Pivotal.lean:82`–`:221`, `RightRigid.lean:123`, `Basic.lean:227`, `:234`.
  - `RepresentationTheory/FDRep/Basic.lean:314`, `:320`.
- **Mathlib.**
  - `Analysis/InnerProductSpace/Spectrum.lean:436`, `:456`.
  - `RingTheory/HopfAlgebra/Convolution.lean:63`; `RingTheory/HopfAlgebra/GroupLike.lean:37`.
  - `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:113`, `:126`, `:147`, `:246`; `CompletelyPositiveMap.lean:153`; `GelfandDuality.lean:320`, `:370`.
  - `Topology/ContinuousMap/Ideals.lean:423`.
  - `RingTheory/SimpleModule/WedderburnArtin.lean:146`; `RingTheory/SimpleModule/Basic.lean:261`.
  - `RepresentationTheory/Rep/Iso.lean:157`.
  - `Algebra/WithConv.lean:28`; `Algebra/SkewMonoidAlgebra/Basic.lean:39`.
  - `Analysis/Normed/Module/WeakDual.lean:270`.

## Not verifiable

- **Timmermann** (`timmermann`) is settled as uncertified, so its locators were not read. These are:
  - Theorem 5.3.3 (§2.2) and Propositions 5.3.7–5.3.8 (§2.3);
  - Propositions 3.2.9 and 3.2.17 and Theorem 5.4.1 (§3.1); Theorem 3.2.12 (§4.1);
  - Chapter 6 §2 (§§5.1, 7.1, 8.6).

  The mathematics of each sampled section was checked independently above. The orthogonality and compact-type statements were cross-checked against `nt` Theorems 1.4.2 and 1.6.6.

## Source issues

- **Misprint** in `bmt` at Theorem 2.12, proof, p.13: the source says the Haar state equals (1−q²) times the plain sum of the diagonal matrix entries at e_(n,0); it should be (1−q²)Σ q^(2n)(ϕ(a)e_(n0)|e_(n0)), since otherwise h(1) diverges; affects nothing.
- **Error** in `banica` at Theorem 1, p.2: the source says the SU(2) fusion rules hold for every n∈ℕ; it should be n≥2, as in the abstract, because at n=1 A_o(F)=C*(ℤ/2) and u⊗u≅1; affects nothing.
