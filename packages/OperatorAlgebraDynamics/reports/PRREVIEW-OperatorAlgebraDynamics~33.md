# Review of OperatorAlgebraDynamics (pull request #1137 at 3e67e69)

**Verdict:** needs changes

This is an incremental re-review of the 49 README lines that changed since 9bbe781 (41 added, 8 deleted). `Suggested.lean` is byte-identical to 9bbe781, and no file outside the folder changed since then.

The changed text is correct: D8 now builds the permutation unitaries `U_σ` on top of Tau Ceti's `PiTensorProduct.reindexRepresentation`, and every declaration it names exists at the pins with the stated convention. Nothing in `TauCetiRoadmap/OperatorAlgebraDynamics/` needs a further edit.

One finding remains, and it is outside the folder: the branch still deletes six files of other roadmaps, so the gate fails and the folder cannot be accepted on this head.

The other two findings of the previous review are settled and not raised again. The last repair report answered each as a change to be made elsewhere (in #1015 and #1771, and in the pull-request description), and those reasons hold. What the author still has to do for them is listed under `## Previous findings`.

## R01 (P3) — The branch still deletes six files of other roadmaps, so the gate fails

Re-raised: H02

Carried from the previous R02. Not repaired.

**Location.** Outside the folder:

- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`

**Claim.** Merging would delete from main six files that belong to other roadmaps.

**Why it is raised again.** The repair report's reason is right as far as it goes: a repair of this folder may not edit other roadmaps' files. It does not settle the finding, because the gate fails on this head and a folder is not accepted while it does. The fix is one commit on the branch by whoever can write outside the folder.

**Witness.**

- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` at 3e67e69 lists `6 files changed, 159 deletions(-)`.
- My gate run gives `outside-folder=6 … FAIL` with these six paths, and every other check 0.

**Repair.** In a new commit, run `git checkout origin/main -- <the six paths>`. The diff against main is then confined to `TauCetiRoadmap/OperatorAlgebraDynamics/`, and the gate's outside-folder check passes. The repair report records that the six blobs are identical at the merge's main-side parent and at origin/main, so the checkout restores them exactly.

## Previous findings

- R01 — partly repaired, settled: lines 163 and 3331–3344 give D8 the completed `U_σ`, `P_s`, `P_a`. #1015 (4e793e8, lines 660–662, 9054–9057) and #1771 (824bab8, lines 711, 742–745) are unchanged; the repair report (H01) places the rest there.
- R02 — not repaired: `git diff --stat origin/main...HEAD` outside the folder still shows the six deletions (159 lines), and the gate gives `outside-folder=6 FAIL`. Raised again as R01 of this report.
- R03 — not repaired, settled: the description's last line is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". The repair report (H03) answers it as a description edit, not a folder edit.

**Why R01 and R03 of the previous review are settled.** I checked the repair report's reasons and they hold:

- **Second owners.** Main's D8 already builds `Λⁿ(h)` as the range of the antisymmetrizing projection on the completed tensor powers, and a roadmap on main is earlier than every open one. So NoncompactQuantumSymmetry P.6 and M6.TensorCoherence (#1015) and QuantumFoundations §6.2–§6.4 (#1771) are the ones to cite D8, for `U_σ`, `P₊=P_s`, `P₋=P_a` and vacuum cyclicity. Both then name this pull request in their merge-order paragraphs.
- **Description.** The revision-dependency line should be deleted (#1097 is not open; #863, #1015 and #1771 are new roadmaps that this README names only as deferrals and consumers), and the order with #1187 should be stated. The repair report gives replacement text.

Neither needs a change in this folder.

## Verified sound

### Gate, dependency check, elaboration

- **Gate**, run at 3e67e69: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL`. The six paths are those of R01, the same as the worker's `gate.md`, which adds `build=0`.
- **Dependency check.** Output `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Suppliers.** The diff adds no roadmap supplier. It adds one Tau Ceti declaration and five Mathlib declarations to the contracts, to D8's *Needs:* line (lines 3683–3688) and to D8's Dependencies (lines 3706–3710). All six are at the pins (below).
- **Elaboration.** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`: 15 s, exit 0, 15 `declaration uses sorry` warnings (lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385, 408) and no other diagnostic.
- **Signatures and probe.** `git diff 9bbe781 HEAD -- TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` is empty. The 18 elaborated types in `scratch/signatures.md`, the one-tactic probe (all 15 fail) and the headline list carry over from the previous reviews unchanged. No Lean declaration states the changed D8 passage.

### Library declarations opened at the pins

Tau Ceti 2fd255d and Mathlib 1b1ccf4b, the pins of `lake-manifest.json`. Eleven declarations:

- `PiTensorProduct.reindexRepresentation`, `TauCeti/RepresentationTheory/Symmetric/TensorAction/Basic.lean` line 59. It is a `Representation R (Equiv.Perm ι) (⨂[R] _ : ι, M)` with `toFun σ := (reindex R (fun _ => M) σ).toLinearMap`. The file's header states the convention `σ • (⨂ m_i) = ⨂ m_(σ⁻¹ i)`. It needs only `CommSemiring R` and a module M: no norm, inner product or completion.
- In `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean`:
  - `reindex` (line 677);
  - `reindex_tprod` (line 685), which sends `tprod f` to `tprod (f ∘ e.symm)`;
  - `reindex_reindex` (line 725);
  - `isEmptyEquiv` (line 785);
  - `subsingletonEquiv` (line 814), for a subsingleton index type with a chosen element;
  - `tmulEquiv` (line 891), from `(⨂_ι M) ⊗ (⨂_ι₂ M)` to `⨂_(ι ⊕ ι₂) M`, with `tmulEquiv_apply` (line 896).
- `finSumFinEquiv`, `Mathlib/Logic/Equiv/Fin/Basic.lean` line 224.
- `Equiv.Perm.mul_def`, `Mathlib/Algebra/Group/End.lean` line 112.
- `TensorProduct.commIsometry`, `Mathlib/Analysis/InnerProductSpace/TensorProduct.lean` line 348, with the inner product on the binary tensor product at line 146.

### Changed passages recomputed

- **Scope sentence** (line 163). The parenthesis says the completed `U_σ` extend Tau Ceti's action on algebraic tensor powers. That matches the declaration (row 50).
- **Mathlib contract** (lines 245–250). The description of `tmulEquiv` is its statement. The four equivalences do assemble the iterated binary power into `⨂[ℂ] _ : Fin n, h` with the factor order kept (row 46).
- **Tau Ceti contract** (lines 438–445). File path, name, convention and left-action group law are right (rows 22 and 45).
- **D8 construction** (lines 3331–3344).
  - The algebraic tensor power is a dense subspace of `h^(⊗̂n)`: the inner product on the algebraic tensor product is positive definite, so it embeds, and elementary tensors span a dense subspace by induction on n.
  - The reindexing preserves `Π_i⟨ξ_i,η_i⟩` and is bijective on the algebraic power, so its extension is unitary with `U_σ*=U_(σ⁻¹)` (row 47).
  - The group law holds on a dense subspace and both sides are bounded, so it passes to the completion.
  - For n=2 the map is the flip (row 48). This reads `h^(⊗̂1)=ℂ⊗̂h` as h, as the untouched Check at lines 3389–3391 already does.
- **`P_a`** (lines 3344–3347, wording unchanged). It is still an orthogonal projection under the new definition of `U_σ` (row 49).
- **The existing `U_σ` Check** (lines 3380–3388). It agrees with the new definition: both give `U_σU_τ(e_1⊗e_2⊗e_3)=e_3⊗e_1⊗e_2` (row 22).
- **Needs and Dependencies** (lines 3683–3688, 3706–3710). Each lists exactly the six declarations the construction uses.

### Seeded sample

The three sampled targets lie outside the diff. Their texts are unchanged and have moved by 14 lines:

- the saddle flow, now at line 2025;
- D5.Fields, now at line 2543;
- the concrete Cuntz families, now at line 3003.

The earlier verification carries over (rows 16, 18 and 19): the saddle-flow orbits and neighbourhood bases; Williams Definition E.16 at `williams-cpcsa-draft31` line 23770, Theorem E.17 at line 23776 and Definition F.1 at line 23897; and the Cuntz-family computation, with Cuntz §1 uncertified.

The README flags no locator as unverified.

### Adversarial table

Rows 1–21 and 23–44 are the previous report's rows of the same number, for statements the diff leaves untouched. Their values are restated, and the README line numbers inside them are the previous head's. Row 22 is recomputed for the changed definition, and rows 45–50 are new.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (r32 row 1) | ℤ counting; G trivial | `δ_0⊗a+δ_1⊗b↦π(a)+π(b)U`; `f(n)=2^(−|n|)a` has `‖f‖₁=3‖a‖`; trivial G gives `π(f(e))` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (r32 row 2) | G trivial, A=ℂ²; L=0 on H≠0 | `(x,y)↦x` recovered with π=L, U=1; L=0 is excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (r32 row 3) | G trivial, I=ℂ⊕0; I=A | `0→I→A→A/I→0`; `C*(G)→C*(G)²→C*(G)`; quotient 0 | holds | none |
| 4 | `CentralCocycle` (r32 row 4) | ℤ/2 with `ω(a,a)=−1`; `M_2` with `diag(1,−1)`; A=0 | at r=s=t=a both sides −1; `diag(1,−1)E_12=E_12` against `E_12diag(1,−1)=−E_12`, so only `central` fails; on `M(0)=0` every field holds | holds | none |
| 5 | Busby–Smith exclusion (r32 row 5) | `α_a=Ad(diag(1,i))` | `α_a²=Ad(diag(1,−1))`, `E_12↦−E_12` | holds | none |
| 6 | `exists_centralIntegratedOperator` (r32 row 6) | ω=1 | reduces to row 1 | holds | none |
| 7 | `continuous_of_measurable_monoidHom` (r32 row 7) | Williams D.11; Hamel map | G Polish, H separable metric; a ℚ-linear map that is not ℝ-linear is discontinuous, hence not Borel | holds | none |
| 8 | `injective_integratedFull_regular_of_amenable` (r32 row 8) | ℤ; F₂; `ρ=z⊕0` | `‖λ(f)‖=sup|f̂|`; `χ_triv(h)=4`, `σ(λ(h)/4)⊆[−1,1−ε]` | holds | none |
| 9 | `transitive_commutant_scalar` (r32 row 9) | ℤ/2 on {p,q}; singleton | `(f(x)−f(y))T_xy=0`; for a singleton F may be empty and T is scalar | holds | none |
| 10 | `exists_powers_partition` (r32 row 10) | F=∅, N=2; ℤ, N=3 | `wbw⁻¹=aba⁻¹` for `w=ab²`; ℤ: D has density ≥½, so 3 disjoint translates are impossible | holds | none |
| 11 | `reducedFreeGroup_isSimpleRing` (r32 row 11) | singleton basis; full `C*(F₂)` | `C(𝕋)` is not simple (excluded by a≠b); `u−1∈ker χ_triv` | holds | none |
| 12 | `reducedFreeGroup_trace_unique` (r32 row 12) | `τ(λ(g))` | `⟨δ_1,δ_g⟩=[g=1]`; every point evaluation of `C(𝕋)` is a trace | holds | none |
| 13 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (r32 row 13) | ℤ/2; ℤ; S₃ | `f̂(χ)=f_0−f_1`; `δ_1↦z`; `C*(S₃)=ℂ²⊕M₂` is not commutative | holds | none |
| 14 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (r32 row 14) | ℤ; ν↦cν | `C*(𝕋)≅c₀(ℤ)`; rescaling ν rescales f by c | holds | none |
| 15 | `lcaWeyl_classification` (r32 row 15) | Schrödinger pair; ℤ/3; E=0 | `U_sV_χU_s*=conj(χ(s))V_χ`; ℤ/3: `U_1V_χU_1*=ω⁻¹V_χ`; ι=∅ | holds | none |
| 16 | `exists_residue_family` (r32 row 16) | n=1, 2; shift family | n=2 at `b_3`: `S_0*b_3=0`, `S_1*b_3=b_1`; shift: `S_1*S_0≠0` | holds | none |
| 17 | `vonNeumannEntropy_strong_subadditivity` (r32 row 17) | GHZ; 2·GHZ; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `−2log2≤0`; `ρ_A` in place of `ρ_AB` gives `log2≤0` | holds | none |
| 18 | Saddle flow (r32 row 18) | (1,1), (−1,−1), (1,−2) | orbit branches `{(u,c/u)}`; `{x>0,|xy|<ε}` saturated | holds | none |
| 19 | D5.Fields Checks (r32 row 19) | point; jump at ½; non-measurable S; empty X | `E_10e_0=e_1∉span e_0`; `1_Se_0` non-measurable; empty X gives 0 | holds | none |
| 20 | Bicharacter phase, lines 1107–1111 and 1154–1165 (r32 row 20) | M=ℤ/3, x=(1,ψ); M=ℤ/2 | `ω(x,x)=ζ`, `ω(x,−x)=ω(−x,x)=ζ²`; `Π_x*δ_2=ζδ_0`; `δ_x*δ_x=δ_0`; the wrong phase gives `ζδ_0`; ℤ/2 values are all ±1 | holds; the Check discriminates | none |
| 21 | Vacuum cyclicity, lines 3563–3569 (r32 row 21) | h=ℂ; h=ℂ², f=(1,0) | `Σconj(c_n)gⁿ/√(n!)≡0` forces c=0; one line spans only `F_s(ℂ×0)` | holds; two owners (settled) | none |
| 23 | Schrödinger relation (r32 row 23) | x=(m,χ), y=(n,ψ) | `Π_xΠ_yξ(t)=χ(t)ψ(t+m)ξ(t+m+n)=ψ(m)Π_(x+y)ξ(t)` | holds | none |
| 24 | ℤ/2 cochain Check, lines 1124–1128 (r32 row 24) | `b(a)=i` | `ω^b(a,a)=1`; `(iδ_a)²=δ_e` in the ω algebra; reversed `f↦fb` is multiplicative since `b(a)⁴=1` | holds | none |
| 25 | `E_ω` (r32 row 25) | ℤ/2, `ω(a,a)=−1` | `(1,a)²=(−1,e)`; `(i,a)²=(1,e)` in `E_ω` | holds | none |
| 26 | Weight projection (r32 row 26) | `(z,e)` acting by `z^k` | `∫z̄z^k dz=δ_(k1)`; the z weight gives `C*(G,ω⁻¹)` | holds | none |
| 27 | D2.CentralTwists Checks (r32 row 27) | ℤ/2; (ℤ/2)² | `u_a*=−u_a`; `uv=u_(1,1)`, `vu=−u_(1,1)`; `τ=Tr/2` | holds | none |
| 28 | Trace property (r32 row 28) | cocycle at (s,s⁻¹,s) | `ω(s⁻¹,s)ω(s,e)=ω(s,s⁻¹)ω(e,s)` | holds | none |
| 29 | D2.BoundedSequenceTranslation (r32 row 29) | `E_ij`; even p | `Uδ_n=δ_(n−1)`; `UpU*δ_n=[n odd]δ_n` | holds | none |
| 30 | D2.SequenceToeplitz (r32 row 30) | `e=M_(1_[0,∞))` | `eUeδ_n=δ_(n+1)`; Prim is `{η}∪𝕋` | holds | none |
| 31 | D4 conventions (r32 row 31) | ℤ/3 inversion; ℝ; ℤ | `(1/3)Σχ(1−x)=[x=1]`; `ev(n)(z)=zⁿ` | holds | none |
| 32 | Dual-measure normalisation (r32 row 32) | order-n group; ℝ | `Σ|δ_e^|²=n` against `‖δ_e‖²=1`; `∫|f̂|²=2π∫|f|²` | holds | none |
| 33 | One-unit groupoid (r32 row 33) | group G | `dν⁻¹/dν=Δ⁻¹`, so D=Δ | holds | none |
| 34 | Full-shift topology (r32 row 34) | n=2 | `shift^(m+1)(0^m10^∞)=0^∞`; `shift(0^m10^∞)≠0^∞` | holds | none |
| 35 | D7 KMS and Araki (r32 row 35) | K=diag(0,1), `a=E_12`, `b=E_21` | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)` | holds | none |
| 36 | D8 Fock Checks (r32 row 36) | h=ℂ; f=1, g=i | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `W_F(1)W_F(i)=e^(−i/2)W_F(1+i)`; fourth moment `3/4` | holds | none |
| 37 | CAR automorphisms (r32 row 37) | U=0, V=conj; rotation by θ | `{b,b}=2`; `b²=sinθcosθ` | holds | none |
| 38 | D9 Checks (r32 row 38) | Ising; d=1 | bound `1/(2+16e)`; `s−βe=log(2coshβh)=p` | holds | none |
| 39 | Weyl `ℓ²(V)` (r32 row 39) | f, g, v | `λ(f)λ(g)δ_v=e^(−iσ(f,g)/2)λ(f+g)δ_v` | holds | none |
| 40 | Attal locator, line 4087 (r32 row 40) | Definition 8.19 | `attal-fock` line 639, page header 17 at lines 615–616; (8.18) at line 695, p. 19 | holds | none |
| 41 | `T_b` direction, lines 1129–1135 (r32 row 41) | ℤ/3, ω=1, `b(1)=i`, `b(2)=1` | `ω^b(1,2)=i`; `T_b(δ_1)T_b(δ_2)=iδ_0=T_b(iδ_0)`; reversed: `−δ_0` against `δ_0` | holds | none |
| 42 | `ψ_b` direction, lines 1276–1281 (r32 row 42) | same data | `(1,1)(1,2)=(i,0)` in `E_(ω^b)`, `ψ_b` image `(i,0)` in `E_1`; reversed: `(1,0)` against `(−1,0)` | holds | none |
| 43 | `U_σ` left-action Check, lines 3355–3363 (r32 row 43) | h=ℂ³, σ=(1 2), τ=(2 3) | `U_σU_τe_123=e_312=U_(στ)e_123`; `V_(στ)e_123=e_231⊥e_312`; `V_σV_τ=V_(τσ)` | holds | none |
| 44 | Sector projections, lines 3364–3370 (r32 row 44) | n=0,1,2,3; h=ℂ² | `P_s=P_a=1` (n≤1) against `1−P_s=0`; n=2 sum 1; n=3: 4+0≠8; `dim F_a(ℂ²)=4` | holds | none |
| 22 | `U_σ` as the bounded extension of the reindexing of `⨂[ℂ] _ : Fin n, h`, lines 3331–3344 (changed; recomputed) | n=3, σ=(1 2), τ=(2 3), h=ℂ³; n=0, n=1; h=0 | Mathlib `reindex_tprod`: position i receives `f(σ⁻¹ i)`. `ρ(τ)e_123=e_1⊗e_3⊗e_2`, `ρ(σ)` of that is `e_3⊗e_1⊗e_2`; `(στ)⁻¹`: 1↦3, 2↦1, 3↦2, so `ρ(στ)e_123=e_3⊗e_1⊗e_2`. n=0: `U_id=1` on ℂ; n=1: `U_id=1`; h=0, n≥1: the space is 0 and `U_σ=0=1` | holds; agrees with the Check at lines 3380–3388 | none |
| 45 | Tau Ceti contract, lines 438–445: `reindexRepresentation` is a left action with `σ·⨂m_i=⨂m_(σ⁻¹(i))` | `map_mul'` at the pin; right-action model | `reindex σ (reindex τ x)=reindex (τ.trans σ) x` (`reindex_reindex τ σ`) and `σ*τ=τ.trans σ` (`Equiv.Perm.mul_def`), so `ρ(στ)=ρ(σ)ρ(τ)`. The model `m_(σ(i))` gives `V_(στ)e_123=e_2⊗e_3⊗e_1≠e_3⊗e_1⊗e_2` | holds | none |
| 46 | Identification of the iterated binary algebraic power with `⨂[ℂ] _ : Fin n, h`, lines 3334–3337 and 245–250 | step 2→3; n=0; n=1 | `tmulEquiv((⨂a_i)⊗(⨂b_j))=⨂ Sum.elim a b`; along `finSumFinEquiv` positions 0, 1 receive `a_0`, `a_1` (`castAdd`) and position 2 receives `b_0` (`natAdd 2 0`), so `(a_0⊗a_1)⊗b_0↦a_0⊗a_1⊗b_0`: factor order kept. `isEmptyEquiv` sends the empty tensor to 1 (the vacuum of `h^(⊗̂0)=ℂ`); `subsingletonEquiv` sends `⨂f` to `f(0)` | holds | none |
| 47 | Unitarity and `U_σ*=U_(σ⁻¹)`, lines 3340–3343 | general σ; n=2 with `η=(e_1,e_2)` and `η'=(e_2,e_1)` against `ξ=(e_1,e_2)` | `⟨U_σξ,U_ση⟩=Π_i⟨ξ_(σ⁻¹i),η_(σ⁻¹i)⟩=Π_j⟨ξ_j,η_j⟩`. n=2: `⟨e_2,e_2⟩⟨e_1,e_1⟩=1=⟨ξ,η⟩` and `⟨e_2,e_1⟩⟨e_1,e_2⟩=0=⟨ξ,η'⟩`. The algebraic map has inverse `ρ(σ⁻¹)`, so the range is dense and the extension is a surjective isometry with inverse `U_(σ⁻¹)` | holds | none |
| 48 | "for n=2, `U_(1 2)` is V2's `commIsometry`", lines 3343–3344 | `e_1⊗e_2`; `e_1⊗e_1` | `commIsometry(x⊗y)=y⊗x`: `e_1⊗e_2↦e_2⊗e_1=U_(1 2)(e_1⊗e_2)`, and `e_1⊗e_1` is fixed by both. The identity map (the plausible wrong model) fixes `e_1⊗e_2` | holds, reading `h^(⊗̂1)=ℂ⊗̂h` as h | none |
| 49 | `P_a` is an orthogonal projection from the new `U_σ`, lines 3344–3347 | general n; n=2 | `P_a*=(1/n!)Σ sgn(σ)U_(σ⁻¹)=P_a`; `P_a²=(1/n!²)Σ_σΣ_τ sgn(στ)U_(στ)=P_a`. n=2: `((1−F)/2)²=(2−2F)/4=(1−F)/2` | holds | none |
| 50 | Scope sentence, line 163: Tau Ceti has only the algebraic action | both pins | `reindexRepresentation` acts on `⨂[R] _ : ι, M` over a `CommSemiring`, with no inner product, norm or completion. Mathlib has the inner product on the binary `TensorProduct` only, and no inner product on `PiTensorProduct` | holds | none |

Row 21 (vacuum cyclicity) still records two owners. That is the settled previous R01, not a finding of this report.

### Cross-roadmap citations and ownership

- **Citations resolved this round.**
  - VonNeumannAlgebras V2 on main (3090489): the paragraph that completes `TensorProduct ℂ H K` and extends `commIsometry` and `assocIsometry`, lines 626–632.
  - NoncompactQuantumSymmetry at #1015, head 4e793e8: lines 660–662, 669, 678–679 and 9054–9057.
  - QuantumFoundations at #1771, head 824bab8: lines 15, 711, 716, 726, 732, 742–745.
  - `scratch/citations.md` lists no unresolved citation or Lean name.
- **Ownership search.** `roadmaps grep -i --readme-only 'reindexRepresentation'` over main and the open heads.
  - #1015 uses it for the same completed `U_σ` (the settled second owner).
  - SchurWeyl on main and FunctionFieldArithmeticPartII (#1831) use it on algebraic tensor powers only. Neither builds a Hilbert completion.
  - Tau Ceti's own uses of `reindexRepresentation` (eight files under `TauCeti/RepresentationTheory/`) are all algebraic.
- **Overlap data.** No dropped id, no id defined only by an open revision, and no id this pull request drops. The listed #1187 conflict belongs to the settled previous R03.

### Remarks on untouched text

- Line 3327 defines `h^(⊗̂1)` as `ℂ⊗̂h`, and the Checks then write `Sym¹(h)=Λ¹(h)=h`. The unit identification `ℂ⊗̂h≅h` is used silently.

## Not verifiable

These sources are recorded as uncertified in the manifest. They are cited by locator, unchanged since the previous review, and none was read:

- Bratteli–Robinson 1 and 2;
- Cuntz 1977 §1;
- Renault 1980;
- Brown–Ozawa Proposition 5.1.3.

The changed passages cite no source.

## Source issues

- none
