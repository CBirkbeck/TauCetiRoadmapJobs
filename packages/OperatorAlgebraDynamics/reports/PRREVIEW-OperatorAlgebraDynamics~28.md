# Review of OperatorAlgebraDynamics (pull request #1137 at 895d9b8)

**Verdict:** needs changes

Incremental re-review of the 129 lines of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` changed since 4133234 (87 insertions, 42 deletions, README only; `Suggested.lean` is byte-identical). The pins are unchanged (Mathlib 1b1ccf4b0, Tau Ceti 2fd255d99). Every changed passage, everything that cites it, and the eight findings of the previous review were checked. Two findings remain, both carried from the previous review and both outside the README text; the README itself has no finding.

## R01 (P3) — The branch still deletes six files of other roadmaps, and the gate fails on them

**Location.** Outside the folder: `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`, `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`, `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`. Carried from the previous review's R02.

**Claim.** The head removes files that main carries; the repair commit 895d9b8 touched only the README, so the deletions of the merge commit 4133234 stand.

**Witness.** All six files exist at origin/main (3b24211e) and at the merge base 32a0bcc9 and are absent at 895d9b8; `git diff --stat origin/main...HEAD` outside the folder shows exactly these six deletions (159 lines). My gate run at this head: `outside-folder=6 … FAIL`, every other check 0.

**Repair.** Restore the six files from origin/main in a new commit (`git checkout origin/main -- <the six paths>`), so that the only differences from main are inside `TauCetiRoadmap/OperatorAlgebraDynamics/`. No acceptance while the gate fails.

## R02 (P3) — The description states no merge order with #1187, which rewrites this `Suggested.lean`

**Location.** The description's last line: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". Carried from the previous review's R05.

**Claim.** Another open pull request changes this roadmap's `Suggested.lean` and the two heads conflict; neither description says which merges first.

**Witness.** This job's `scratch/overlaps.md` (index of 2026-11-09): "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`"; the open index lists #1187 as the Tau Ceti bump to ab00ba392 touching 43 roadmaps including OperatorAlgebraDynamics.

**Repair.** State in the description which merges first: either #1187 first, with this branch rebased and re-elaborated at Tau Ceti ab00ba392, or this pull request first, with #1187 dropping its OperatorAlgebraDynamics hunk. The same line can drop #1097, which the open index no longer lists, and no longer needs #1041 (see R06 below).

## Previous findings

- R01 — repaired: lines 530–540 state a VonNeumannAlgebras V2 contract (the completed Hilbert tensor product, `TensorProduct.mapL`, `commIsometry`, `assocIsometry` extended to the completions, the target preceding V2.RectangularL2); lines 3261–3270, 3416–3419, 3584–3586 and 3603–3605 build `h^(⊗̂n)`, `Λⁿ(h)` and `Symⁿ(h)` from it. Main's `TauCetiRoadmap/VonNeumannAlgebras/README.md` (3b24211e) lines 626–632 state exactly that target, before V2.RectangularL2 at line 634. FreeProbability now appears only at lines 123, 1738, 2015 and 3889, as a comparison or a consumer, on no *Needs:* line or Dependencies list; the dependency check reports 0 problems. No cycle remains.
- R02 — not repaired: the six files are still absent at this head (R01 above).
- R03 — repaired: lines 3776–3781 now say the interaction norms need not vanish, with `Φ({x})=1`: against the definitions at lines 3636–3637 (`Mλ`), 3666 (`‖Φ‖B`), 3672–3675 (`e_Φ`, `s`, `p`) I recompute `Mλ(Φ)=e⁰·1=1`, `‖Φ‖B=1/1=1`, `H_Φ(Λ)=|Λ|`, `Tr exp(−β|Λ|)=e^(−β|Λ|)` on `A_Λ=ℂ` so `p(βΦ)=−β`, `e_Φ=ω(Φ({0}))/1=1`, `s=0` (one-dimensional density matrix), `s−βe_Φ=−β=p(βΦ)`: all as written.
- R04 — repaired: lines 2918–2925. For n=2, `shift^(m+1)(0^m10^∞)=0^∞=shift^(m+1)(0^∞)` so `(0^m10^∞,0,0^∞)` is an arrow of cocycle 0 with distinct endpoints, not a unit, converging to the unit `(0^∞,0,0^∞)` in the subspace topology; `shift(0^m10^∞)=0^(m−1)10^∞≠0^∞` for m≥1, so `(0^m10^∞,1,0^∞)` lies outside `Z([0],1,0,X)` (it is an arrow: `shift^(m+1)u=shift^m v`) and converges to `(0^∞,1,0^∞)` inside it. "Coarser": every subspace-open set `G∩W` is a union of `Z(U,m,n,V)`, so the Deaconu–Renault topology is finer. All as written.
- R05 — not repaired: the description's last line is unchanged (R02 above).
- R06 — repaired: `V11.FourierInversion` no longer appears; lines 170–175, 475–477, 492 and 2161–2163 cite "the inversion, Plancherel and duality target that follows V11.FourierUniqueness". Main's VonNeumannAlgebras README lines 3233–3245 are that unnamed target: it consumes V11.FourierUniqueness, states inversion, the dual Haar normalisation, Plancherel `F:L²(G)≃L²(dual G)` with `Fλ(f)F*=M_f̂`, `‖λ(f)‖=sup|f̂|`, every evaluation a character of `C*_r(G)` completing the homeomorphism with V11.UnitizationCharacters, and the duality isomorphism `G→dual(dual G)`. The citation now resolves on main, so #1041 need not be named.
- R07 — repaired: line 161 lists "the cyclicity of its vacuum" among D8's objects and drops it from §6.4's; lines 3440–3444 prove it from `W_F(f)Ω=exp(−‖f‖²/4)e(if/√2)` and totality; lines 3492–3498 add a Check; lines 3891–3896 list it among what QuantumFoundations consumes. One owner on this side.
- R08 — repaired: `gap:topological-groupoid-vocabulary`, `gap:measurable-hilbert-fields` and `gap:diagonal-reduction` are gone; lines 462–471, 2425–2426, 2481–2482, 2590, 2608 and 2721–2726 cite LieGroupoidsPoisson G0.0, VonNeumannAlgebras V4.0.Fields and V4.0.Decomposition by section. Main's LieGroupoidsPoisson README has `### G0.0 Topological groupoids` at line 261 and names "OperatorAlgebraDynamics D5" as its consumer at line 270. The six older slugs (`cstar-ideals-multipliers`, `cstar-representations`, `cstar-tensor-limits`, `cstar-nuclear-exact`, `hilbert-module-induction`, `toeplitz-extension`) are unchanged by this head.

## Verified sound

### Gate, dependency check, elaboration, probe, signatures

- **Gate** at 895d9b8: every check 0 except `outside-folder=6`, `FAIL` (R01). The worker's run adds `build=0`.
- **Dependency check**: `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. OperatorAlgebraDynamics is not in `ORDER.txt` and is placed after its last supplier; its suppliers in the order are VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8) and LieGroupoidsPoisson (152).
- **Elaboration**: `lake env lean` on a scratch copy of `Suggested.lean`: 15 `declaration uses sorry` warnings (lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385, 408), nothing else, 14 s. The file is byte-identical to the one the previous review read.
- **One-tactic probe**: each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | aesop`; all 15 theorems fail (errors at lines 110, 124, 141, 212, 227, 244, 264, 281, 298, 315, 332, 349, 376, 397, 414). Nothing is padding.
- **Signatures**: `#check @name` for all 18 declarations against the built module elaborates with no error; each elaborated type equals the one compared with the README in the previous review (`InnerRegularCompactLTTop` on the two integrated-operator theorems, `Amenable`/`IsHaarMeasure`/`Regular` on the amenable comparison, both strong continuities and the `conj(χ(s))` covariance on `lcaWeyl_classification`, the ℕ-indexed `HilbertBasis` on `exists_residue_family`, `PosSemidef` on strong subadditivity). No binder lost; nothing changed.
- **Form**: `import Mathlib` plus the eight `TauCeti.*` modules; no `set_option`, `lemma`, sorry'd data or `#eval` (gate counts all 0).

### The changed passages

- **V2 contract (lines 530–540) against main.** Main's V2 target (lines 626–632) completes "native normed `TensorProduct ℂ H K` with its existing positive-definite product inner product", extends "native `TensorProduct.mapL`, `commIsometry` and `assocIsometry` to the completions, with their uniqueness on dense algebraic tensors", and demands "dense elementary tensors, exact norm/product/adjoint formulas". The README's paragraph claims nothing more; `‖ξ⊗η‖=‖ξ‖‖η‖` is the product inner product on elementary tensors. At the pinned Mathlib, `Mathlib/Analysis/InnerProductSpace/TensorProduct.lean` has `TensorProduct.commIsometry` (line 348), `TensorProduct.assocIsometry` (line 438) and `TensorProduct.mapL` (line 603), all inside `namespace TensorProduct`, on the algebraic tensor product with its inner product, as main's V2 says.
- **Tensor powers and projections (lines 3261–3270, 3416–3419).** `U_σ(ξ_1⊗…⊗ξ_n)=ξ_(σ⁻¹(1))⊗…⊗ξ_(σ⁻¹(n))`: `(U_σU_τξ)_j=(U_τξ)_(σ⁻¹(j))=ξ_(τ⁻¹σ⁻¹(j))=ξ_((στ)⁻¹(j))`, so `U_σU_τ=U_(στ)` as written. `P_a=(1/n!)Σsgn(σ)U_σ`: `P_a*=(1/n!)Σsgn(σ)U_(σ⁻¹)=P_a` since `sgn(σ⁻¹)=sgn(σ)`; `P_a²=(1/n!²)Σ_(σ,τ)sgn(στ)U_(στ)=P_a`; likewise `P_s`. For n=0 and n=1 both projections are the identity, `h^(⊗̂0)=ℂ`, `Λ⁰=Sym⁰=ℂ∋Ω`. Adjacent transpositions, which `commIsometry` composed with `assocIsometry` provides, generate the symmetric group, so every `U_σ` is reachable as the text says.
- **Vacuum cyclicity (lines 3440–3444, 3492–3498).** `e(if/√2)` at `f=−i√2·g` is `e(g)`. For h=ℂ: `ℂ^(⊗̂n)=ℂ`, `Symⁿ(ℂ)=ℂ`, `e(g)=(gⁿ/√(n!))_n` with `‖e(g)‖²=e^(|g|²)`; `⟨c,e(g)⟩=Σconj(c_n)gⁿ/√(n!)` converges for every g (`|c_n|≤‖c‖`), is entire, and vanishing for all g forces `conj(c_n)/√(n!)=0`, so c=0. For h=ℂ², f=(1,0): `π_F(W(tf))Ω=exp(−t²/4)e((it/√2,0))`, every `e((z,0))` lies in `⊕_n Symⁿ(ℂ×0)`, orthogonal to the one-particle vector `(0,1)`. Both Checks as written.
- **D9 `d=1` Check (lines 3776–3781)**: recomputed above (R03). `TauCeti.QuantumSpin.Interaction` (`Analysis/CStarAlgebra/QuantumSpin/Interaction.lean` line 70) requires `IsHermitian` and `Φ ∅ = 0`, so `Φ({x})=1` is an interaction and for `d=1` every `Φ(X)` is a real scalar as the Check says.
- **D6 topology Check (lines 2918–2925)**: recomputed above (R04).
- **V11 citations (lines 170–175, 475–492, 2161–2163)**: resolved on main (R06). V11.UnitizationCharacters at main line 3185 and V11.FourierUniqueness at line 3203 exist; the sign convention of main's inversion `f(x)=∫f̂(γ)conj(γ(x))dγ` matches the README's positive-character transform.
- **G0.0 (lines 462–471, 2425, 2481, 2721)**: main's LieGroupoidsPoisson README line 261 `### G0.0 Topological groupoids`, line 270 naming D5 as consumer, line 2023–2024 likewise.
- **Ownership against open work.** QuantumFoundations at #1771 (824bab8b, `TauCetiRoadmap/QuantumFoundations/README.md`) still writes "Prove bosonic vacuum cyclicity" at line 742 and lists it at lines 15 and 745, while its supplier contract at line 55 consumes D8's Fock representation. With this head D8 is the owner (earlier in the order; the previous review's R07 placed it here) and the Downstream consumers bullet at lines 3891–3896 says QuantumFoundations consumes it; the matching citation is that roadmap's edit, as the previous review said. Remark, no change requested here. HeisenbergImprimitivity at #1149 (now 4b902fe) still consumes `C*(G,ω)` from D1–D2; no second owner of the changed objects (`h^(⊗̂n)`, `Λⁿ(h)`, `Symⁿ(h)`, vacuum cyclicity) in the vocabulary-closest roadmaps #866, #1015, #1041, #1149, #1771.
- **Overlaps**: no id this README cites is dropped by an open pull request; no id only an open revision defines; this pull request drops no id other roadmaps cite; #1187 conflicts (R02).

### Seeded sample (unchanged text, recomputed)

- **Worked example: the saddle flow (lines 1974–2006).** `xy` is invariant under `(e^t x, e^(−t) y)`; for `xy=r>0` the orbit is `{(u,r/u):u>0}`, closed; `(x,0)`, x>0, has orbit the open half-axis with closure adding the origin. `{x>0,|xy|<ε}` is saturated, open, excludes the origin and every branch with r≥ε; `{|xy|<ε}` is a saturated open neighbourhood of the origin containing all four half-axis points, so T₁ fails; the +x and +y neighbourhoods share the first-quadrant branches with r<ε, so not Hausdorff; `(x,y)↦xy` is continuous and open on an open quadrant. All as written; no locator needed.
- **D5.Fields (lines 2489–2582).** Recomputed the seven Checks: single point `L²=H(x₀)`; constant field `L²(X;ℓ²)`, `N={0}` gives `L²(X)` and `L∞`; varying dimension `L²([0,½])⊕L²([½,1];ℂ²)`, `E_10e_0=e_1∉H(x)` for x<½, `E_01e_0=0` there; non-measurable S gives a non-measurable section; `1` and `E_00` agree on `span e_0`; zero fibres `≅L²(S)`, `T_φ=T_ψ` iff `φ=ψ` a.e. on S; empty X gives 0. `williams-cpcsa-draft31` line 23770 (Definition E.16) and 23776 (Theorem E.17), printed p. 405; Definition F.1 at line 23897 (p. 409) with the nonzero-fibre standing assumption at line 23893. V4.0.Fields on main (line 1181) and V4.0.Decomposition (lines 1279, 1305 naming D5).
- **Concrete Cuntz families (lines 2933–2975).** `⟨b_m,S_jb_k⟩=[m=nk+j]` gives `S_j*b_m=b_(m div n)` when `m mod n=j`, else 0; `S_i*S_jb_k=δ_(ij)b_k`; `Σ_jS_jS_j*b_m=S_(m mod n)b_(m div n)=b_m`. n=1: `S_0=Id`; n=2 at `b_3`: `S_0*b_3=0`, `S_1*b_3=b_1`, `S_1b_1=b_3`; the shift family has `S_1*S_0=S_1*≠0`. The Lean statement `exists_residue_family` carries `0<n`, the ℕ-indexed basis and the four identities. Cuntz §1 is uncertified (Not verifiable).

### Adversarial table

Rows 1–33 of the previous report (r27 at 4133234) are carried for the statements the diff leaves untouched; rows marked r28 are recomputed at this head.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1–13 | `exists_integratedOperator`, `exists_covariantRepresentation_integratedFull`, `fullCrossedProductMap_exact`, `CentralCocycle` and `C*(G,ω)`, scalar star, cochain direction, `λ^ω` law, `exists_centralIntegratedOperator`, `continuous_of_measurable_monoidHom`, `injective_integratedFull_regular_of_amenable`, Fock Weyl `W_F` vs Attal `W_u`, isometry on exponential vectors, vacuum variance | as r27 rows 1–13 (ℤ, trivial G, ℤ/2 with `ω(a,a)=−1`, F₂ with `‖λ(h)‖=2√3<4`, `u=if/√2`, Gaussian variance `‖f‖²/2`, `c≈0.468`) | as r27 | hold (r27) | none |
| 14 (r28) | Exponential vectors total = vacuum cyclicity (3440–3444) | h=ℂ; `f=−i√2·g` | `i(−i√2 g)/√2=g`; `π_F(W(f))Ω=e^(−|f|²/4)e(if/√2)` nonzero multiple | holds, owned by D8 | R07 repaired |
| 14a (r28) | Cyclicity Check for h=ℂ (3492–3495) | `c⊥e(g)` for all g | `Σconj(c_n)gⁿ/√(n!)` entire, Taylor coefficients `conj(c_n)/√(n!)=0` | holds | none |
| 14b (r28) | Cyclicity needs all of h (3495–3498) | h=ℂ², f=(1,0) | `π_F(W(tf))Ω=e^(−t²/4)e((it/√2,0))∈⊕Symⁿ(ℂ×0)`, `⟨(0,1),(z,0)⟩=0` | holds | none |
| 15–19 | CAR Fock `a†(f)=√(n+1)P_a(f⊗·)`, vacuum two-point functions, Bogoliubov relations, `exists_residue_family`, `λ(f)δ_v` | as r27 rows 15–19 (`‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`, `(ca+sa*)²=cs`, n=2 at `b_3`, `σ(f,f)=0`) | as r27 | hold (r27) | none |
| 15c (r28) | `U_σU_τ=U_(στ)`, `P_a`, `P_s` orthogonal projections (3264–3270, 3416–3419) | σ,τ∈S_n; n=0,1 | `(U_σU_τξ)_j=ξ_((στ)⁻¹(j))`; `P_a*=P_a`, `P_a²=P_a`; n=0,1: `P=1`, `h^(⊗̂0)=ℂ` | holds | none |
| 15d (r28) | V2 contract (530–540) vs main lines 626–632 | `TensorProduct.commIsometry`/`assocIsometry`/`mapL` at the pin | lines 348, 438, 603 of `Analysis/InnerProductSpace/TensorProduct.lean`, namespace `TensorProduct` | holds | R01 repaired |
| 20–27 | Saddle flow orbits and separation, D5.Fields varying dimension, zero fibres, non-measurable S, D5 new Checks, `lcaWeyl_classification`, strong subadditivity | as r27 rows 20–27 (recomputed above for the sample; ℤ/3 shift and `diag(1,ω,ω²)`; GHZ `0+log2≤2log2`) | as r27 | hold (r27, sample recomputed r28) | none |
| 28 (r28) | D9 `d=1` Check (3776–3781) | `Φ({x})=1`, `Φ(X)=0` otherwise | `Mλ=1`, `‖Φ‖B=1`, `H_Φ(Λ)=|Λ|`, `p=−β`, `e_Φ=1`, `s=0`, `s−βe_Φ=−β` | holds | R03 repaired |
| 29 (r28) | D6 topology Check (2918–2925) | n=2, `u=0^m10^∞`, `v=0^∞` | `shift^(m+1)u=0^∞=shift^(m+1)v`: `(u,0,v)` non-unit → unit; `shift u≠v`: `(u,1,v)∉Z([0],1,0,X)` → `(0^∞,1,0^∞)∈Z` | holds | R04 repaired |
| 29a (r28) | V11 target citation (170–175, 475–492, 2161–2163) | main lines 3233–3245 | consumes FourierUniqueness; inversion, Plancherel, `‖λ(f)‖=sup|f̂|`, character surjectivity, duality | resolves on main | R06 repaired |
| 30–33 | D2.CentralTwists trace, Fermi KMS sign, Powers partition / simplicity / unique trace, Fourier theorems | as r27 rows 30–33 (`[t=s⁻¹]ω(s,s⁻¹)`, `1/(e^(βε)+1)`, `wbw⁻¹=aba⁻¹`, `δ_1↦z`) | as r27 | hold (r27) | none |

## Not verifiable

Uncertified in the manifest, cited by locator only, not read: Bratteli–Robinson 2 §5.2.1 (cited at line 3437 for the vacuum characteristic function, the citation unchanged; the cyclicity added at lines 3440–3444 is proved in the text from the displayed formula and totality, and recomputed in row 14), and the other Bratteli–Robinson, Cuntz §1, Brown–Ozawa, Renault and Rudin locators listed in the previous review, all unchanged at this head. Araki 1973, Takeishi, Sims–Williams, Muhly–Williams, Sims 2017, Delfín–Farsi–Packer and Attal are cached, cited by text unchanged at this head, and were verified in earlier rounds; the Attal locators the changed D8 passage keeps (Def. 8.4, Prop. 8.5, Cor. 8.6, Def. 8.20, Prop. 8.21, (8.18), Prop. 8.23) were read in the previous round at `attal-fock` lines 268, 279, 317, 654, 661, 695, 699.

## Source issues

- none
