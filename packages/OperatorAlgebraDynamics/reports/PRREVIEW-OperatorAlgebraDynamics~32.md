# Review of OperatorAlgebraDynamics (pull request #1137 at 9bbe781)

**Verdict:** needs changes

This is an incremental re-review of the 89 README lines that changed since df96497 (69 added, 20 deleted). `Suggested.lean` is byte-identical to df96497, and no file outside the folder changed since then. I recomputed every added or changed Check and prose identity. I also reran the gate, the dependency check and the elaboration, and resolved every citation the changed passages make or receive.

Three findings remain, all carried from the previous review:

- **R01 (P2).** The in-folder half of the repair is done. The second owners at the heads of #1015 and #1771 are unchanged.
- **R02 (P3).** The branch still deletes six files of other roadmaps, so the gate fails.
- **R03 (P3).** The description still gives no merge order with #1187, and it still carries the wrong revision-dependency line.

The previous R04 (bicharacter phase) and R05 (Attal page) are repaired. The new ℤ/3 Checks for the direction of `T_b` and `ψ_b`, and for the left action of `U_σ`, are correct.

## R01 (P2) — `U_σ`, `P_s`/`P_a` and vacuum cyclicity still have second owners at the heads of #1015 and #1771

Carried from the previous R01. Partly repaired.

**Location.**

- Line 163: "D8 is the single owner of … the permutation unitaries `U_σ` of the completed tensor powers … with the symmetrizing and antisymmetrizing projections `P_s` and `P_a` … and the cyclicity of its vacuum".
- Consumer bullets at lines 3896–3900 ("its P.6 takes D8's permutation unitaries `U_σ`") and lines 3966–3968 ("QuantumFoundations Layer 6 (§§6.2–6.4) consumes D8's permutation unitaries").

**Claim.** This folder now states D8's single ownership and names both consumers, which was the in-folder half of the previous repair. Neither open roadmap has changed:

- Each still owns one of these objects.
- The two consumer bullets describe consumption that neither head carries.

The objects still have two owners each.

**Witness.**

- **#1015.** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md` at 4e793e8:
  - Lines 660–662: "define `U_σ(⊗_i v_i)=⊗_i v_(σ⁻¹i)` … Prove `U_σU_τ=U_(στ)`, unitarity, and that `P₊=(1/n!)Σ_σU_σ` and `P₋=(1/n!)Σ_σ sgn(σ)U_σ`".
  - Line 18 lists P.6 among the things that roadmap proves.
- **#1771.** `TauCetiRoadmap/QuantumFoundations/README.md` at 824bab8:
  - Line 711: "Consume NoncompactQuantumSymmetry P.6 for the permutation unitaries". Lines 726 and 732 also take P.6.
  - Line 742: "Prove bosonic vacuum cyclicity". Lines 15 and 745 list vacuum cyclicity as its own.

**Repair.** No further edit is needed in this folder. The rest is in the other two pull requests, which have the same author.

- **In #1015**, P.6 cites OperatorAlgebraDynamics D8 for `U_σ`, `P₊=P_s`, `P₋=P_a`, `Symⁿ` and `Λⁿ` instead of constructing them. Its convention Check at lines 678–679 uses the transpositions (12) and (23) of S₃ in the left action. That agrees with D8's new Check at lines 3355–3363 (row 43 below), so the citation needs no translation.
- **In #1771:**
  - At lines 711, 726 and 732, "NoncompactQuantumSymmetry P.6" becomes "OperatorAlgebraDynamics D8".
  - At line 742, "Prove bosonic vacuum cyclicity" becomes a citation of D8.
  - Lines 15 and 745 drop vacuum cyclicity.
- **Merge order.** Main's README (line 12) still gives vacuum cyclicity to QuantumFoundations §6.4, and D8's `U_σ` exists only on this branch. So after these edits, #1015 and #1771 depend on this pull request, and each names it in its merge-order paragraph.

After the edits, D8 (line 3317) is the only constructor in a `roadmaps grep -i 'permutation unitar'` over main and the open heads.

## R02 (P3) — The branch still deletes six files of other roadmaps, so the gate fails

Carried from the previous R02. Not repaired.

**Location.** Outside the folder:

- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`

**Claim.** Merging would delete from main six files that belong to other roadmaps.

**Witness.**

- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` at 9bbe781 lists `6 files changed, 159 deletions(-)`.
- `git cat-file -t origin/main:<path>` gives `blob` for each path, and the path does not exist in HEAD.
- My gate run gives `outside-folder=6 … FAIL`, with every other check 0.

**Repair.** In a new commit, run `git checkout origin/main -- <the six paths>`. The diff against main is then confined to `TauCetiRoadmap/OperatorAlgebraDynamics/`, and the gate's outside-folder check passes.

## R03 (P3) — The description states no merge order with #1187, and its revision-dependency line is wrong

Carried from the previous R03. Not repaired.

**Location.** The last line of the pull-request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863".

**Claim.** The line has four problems:

- #1187 is open and conflicts with this branch, including in `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`, but neither description says which pull request merges first.
- #1097 is not in the open index.
- #1771, #1015 and #863 are new roadmaps. This README names them only as deferrals and consumers, so none of them is a dependency.
- Once R01 is repaired, #1771 and #1015 depend on this pull request, the opposite of "merge first".

**Witness.**

- `scratch/overlaps.md`: "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`".
- `roadmaps list` shows #1187 open and no #1097. It lists #863, #1015 and #1771 as "(new)".
- `scratch/overlaps.md` lists no id that only an open revision defines.

**Repair.**

- State the order with #1187 in the description. Either #1187 merges first and this branch is rebased and re-elaborated at its Tau Ceti pin, or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk.
- Delete the revision-dependency line. Per the overlap data, this roadmap depends on no open revision.

## Previous findings

- R01 — partly repaired: line 163 adds `U_σ`, `P_s`, `P_a`, `Symⁿ(h)` and `Λⁿ(h)` to D8's single ownership, and lines 3896–3900 and 3966–3968 name D8 for both consumers. #1015 P.6 (lines 660–662) and #1771 §6.2/§6.4 (lines 711, 742) are unchanged. Carried as R01.
- R02 — not repaired: `git diff --stat origin/main...HEAD` outside the folder still shows the six deletions of PROGRESS.md/STATUS.md (159 lines), and the gate gives `outside-folder=6 FAIL`. Carried as R02.
- R03 — not repaired: the description's last line is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". Carried as R03.
- R04 — repaired: lines 1108–1111 now read "the adjoint of Π_x has the same phase, `Π_x*=ω(x,x)Π_(−x)`", and the Check at lines 1154–1165 is the ℤ/3 computation, which excludes the phase `ω(x,−x)=ζ²` (row 20).
- R05 — repaired: line 4087 now reads "Proposition 8.21 and Proposition 8.23 (pp. 17–19)". `attal-fock` has Definition 8.19 at line 639, under the page-17 header at lines 615–616.

There is no repair report in the package's `reports/` directory, so no finding was marked `not actionable in this package`.

## Verified sound

### Gate, dependency check, elaboration

- **Gate**, run at 9bbe781: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL`. It lists the six paths of R02, the same as the worker's `gate.md`, which adds `build=0`.
- **Dependency check.** Output `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Suppliers.** The diff adds one supplier reference, VonNeumannAlgebras V2, which is on main. Main's `TauCetiRoadmap/VonNeumannAlgebras/README.md` lines 627–628 extend `commIsometry` and `assocIsometry` to the completed tensor products, which is what lines 3315–3317 consume. The diff adds no *Needs:* line.
- **Elaboration.** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`: 12 s, exit 0, 15 `declaration uses sorry` warnings (lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385, 408) and no other diagnostic.
- **Signatures and probe.** `git diff df964974 HEAD -- …/Suggested.lean` is empty. The 18 elaborated types in `scratch/signatures.md` are the ones the previous review compared with the README, binder by binder. Its one-tactic probe (all 15 fail) and its headline list carry over unchanged.

### Changed passages recomputed

- **Bicharacter phase** (lines 1107–1111, Check at 1154–1165). Take `ω((m,χ),(n,ψ))=ψ(m)` and `x=(1,ψ)` with `ψ(k)=ζᵏ`, so `−x=(2,ψ²)`.
  - The phases: `ω(x,x)=ζ`, `ω(x,−x)=ψ²(1)=ζ²` and `ω(−x,x)=ψ(2)=ζ²`.
  - The adjoint: `⟨Π_xη,ξ⟩=Σ_s conj(ζ^sη(s+1))ξ(s)` gives `(Π_x*ξ)(t)=ζ^(1−t)ξ(t−1)=ζ(Π_(−x)ξ)(t)`.
  - At `δ_0`: `Π_xδ_0=ζ²δ_2`, so `Π_x*δ_2=ζ^(−2)δ_0=ζδ_0`, and `Π_(−x)δ_2=δ_0`.
  - The twisted algebra: the star formula at line 1079 gives `δ_x*=conj(ω(−x,x))δ_(−x)=ζδ_(−x)` and `δ_x*δ_x=ζ·ζ²δ_0=δ_0`.
  - The wrong phase ζ² gives `ζ⁴=ζ`, so δ_x would not be unitary.
  - The generator formula `i_G(s)*=conj(ω(s⁻¹,s))i_G(s⁻¹)` at s=x gives `conj(ζ²)=ζ`.
  - HeisenbergImprimitivity (#1149, `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md` lines 198 and 248) has `π_x*=conj(β(x,−x))π_(−x)`, the same convention.
- **ℤ/2 cochain Check** (lines 1124–1128).
  - `(iδ_a)*_ω(iδ_a)=i²ω(a,a)δ_e=δ_e`.
  - The map `f↦fb` from the ω algebra to the `ω^b` algebra is multiplicative iff `b²` is a character. For ℤ/2 that is `b(a)⁴=b(e)²=1`, as the Check says. So the instance cannot fix the direction.
- **ℤ/3 `T_b` direction** (lines 1129–1135), with `b(0)=1`, `b(1)=i`, `b(2)=1`.
  - `ω^b(1,2)=i·1·1·conj(b(0))=i`.
  - `T_b(δ_1)T_b(δ_2)=iδ_1δ_2=iδ_0=T_b(iδ_0)`.
  - The reversed map gives `(iδ_1)*_(ω^b)δ_2=i·iδ_0=−δ_0≠δ_0`. Here `b²(1)b²(2)=−1≠b²(0)`.
  - This agrees with the definition at lines 1030–1034 (`(T_bf)(s)=f(s)b(s)`, from the ω^b algebra to the ω algebra) and with the `C*(L,c)` consumer at line 3933 ("in the same direction").
- **ℤ/3 `ψ_b` direction** (lines 1276–1281).
  - In `E_(ω^b)`: `(1,1)(1,2)=(ω^b(1,2),0)=(i,0)`.
  - `ψ_b(1,1)ψ_b(1,2)=(i,1)(1,2)=(i,0)` in `E_1`, and `ψ_b(i,0)=(i·b(0),0)=(i,0)`.
  - Read from `E_1` to `E_(ω^b)`, the formula sends `(1,0)` to `(1,0)`, but `(i,1)(1,2)=(i·i,0)=(−1,0)` in `E_(ω^b)`.
  - In the ℤ/2 case `(i,a)²=(−1,e)` in `𝕋×ℤ/2`, so `(i,a)` has order 4 and the parenthesis is right.
- **`U_σ`** (lines 3316–3322 and Check 3355–3363), with σ=(1 2) and τ=(2 3).
  - `U_τ(e_1⊗e_2⊗e_3)=e_1⊗e_3⊗e_2`, and `U_σ` of that is `e_3⊗e_1⊗e_2`.
  - `στ` sends 1→2, 2→3 and 3→1, and `U_(στ)(e_1⊗e_2⊗e_3)=e_3⊗e_1⊗e_2`, so the two agree.
  - `V_(στ)(e_1⊗e_2⊗e_3)=e_2⊗e_3⊗e_1`. In general `(V_σV_τξ)_i=ξ_(τσ(i))`, and `V_(τσ)(e_1⊗e_2⊗e_3)=e_3⊗e_1⊗e_2`, so V is a right action as stated.
  - `U_σ*=U_(σ⁻¹)` holds because `U_σ` permutes an orthonormal basis of elementary tensors.
  - `P_a*=P_a` and `P_a²=P_a` follow from that and `sgn(σ⁻¹)=sgn(σ)`. Lines 3486–3488 give `P_s` by the same argument.
- **Sector Check** (lines 3364–3370).
  - S₀ and S₁ are trivial, so `P_s=P_a=1` in degrees 0 and 1, while `1−P_s=0` there.
  - n=2: `P_s+P_a=(1+F)/2+(1−F)/2=1`, with F the flip.
  - `dim Sym³(ℂ²)=C(4,3)=4` and `Λ³(ℂ²)=0`, against `dim (ℂ²)^⊗3=8`.
  - `F_a(ℂ²)`: `1+2+1=4=2²`, which matches Attal's dimension `2ⁿ` (Definition 8.3, p. 7).
- **Examples paragraph** (lines 1363–1370). Each instance it names is a Check above: ℤ/3 for `T_b`/`ψ_b`, and ℤ/3 Schrödinger for the phase.
- **Consumer bullets** (lines 3896–3900, 3966–3968). The conventions agree:
  - NoncompactQuantumSymmetry P.6 uses the left action `U_σ(⊗v_i)=⊗v_(σ⁻¹i)` and `P₊`, `P₋` (#1015 lines 660–662, 678–679).
  - QuantumFoundations uses `P₊`/`P₋` in §6.2 (line 711) and §6.3 (line 726).
  - What those heads consume is R01.

### Seeded sample

The three sampled targets lie outside the diff. Their texts are unchanged and have moved by 24 lines:

- the saddle flow, now at line 2011;
- D5.Fields, now at line 2529;
- the concrete Cuntz families, now at line 2989.

The previous review's verification carries over:

- **Saddle flow.** The orbits and both neighbourhood bases were recomputed. The quotient is T₀, not T₁ and not Hausdorff.
- **D5.Fields.** Williams Definition E.16 is at `williams-cpcsa-draft31` line 23770, Theorem E.17 at line 23776 (printed p. 405) and Definition F.1 at line 23897. All seven Checks were recomputed.
- **Cuntz families.** `S_j*b_m=[m mod n=j]b_(m div n)` was recomputed. Cuntz §1 is uncertified.

The README flags no locator as unverified.

### Adversarial table

Rows 1–19, 21, 23 and 25–39 are carried from the previous review's table (r31). The diff leaves those statements untouched, and their values are restated. Rows 20, 22, 24 and 40 are recomputed, and rows 41–44 are new.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (r31 row 1) | ℤ counting; G trivial | `δ_0⊗a+δ_1⊗b↦π(a)+π(b)U`; `f(n)=2^(−|n|)a` has `‖f‖₁=3‖a‖`; trivial G gives `π(f(e))` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (r31 row 2) | G trivial, A=ℂ²; L=0 on H≠0 | `(x,y)↦x` recovered with π=L, U=1; L=0 is excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (r31 row 3) | G trivial, I=ℂ⊕0; I=A | `0→I→A→A/I→0`; `C*(G)→C*(G)²→C*(G)`; quotient 0 | holds | none |
| 4 | `CentralCocycle` (r31 row 4) | ℤ/2 with `ω(a,a)=−1`; `M_2` with `diag(1,−1)`; A=0 | at r=s=t=a both sides −1; `diag(1,−1)E_12=E_12` against `E_12diag(1,−1)=−E_12`, so only `central` fails; on `M(0)=0` every field holds | holds | none |
| 5 | Busby–Smith exclusion (r31 row 5) | `α_a=Ad(diag(1,i))` | `α_a²=Ad(diag(1,−1))`, `E_12↦−E_12` | holds | none |
| 6 | `exists_centralIntegratedOperator` (r31 row 6) | ω=1 | reduces to row 1 | holds | none |
| 7 | `continuous_of_measurable_monoidHom` (r31 row 7) | Williams D.11; Hamel map | G Polish, H separable metric; a ℚ-linear map that is not ℝ-linear is discontinuous, hence not Borel | holds | none |
| 8 | `injective_integratedFull_regular_of_amenable` (r31 row 8) | ℤ; F₂; `ρ=z⊕0` | `‖λ(f)‖=sup|f̂|`; `χ_triv(h)=4`, `σ(λ(h)/4)⊆[−1,1−ε]` | holds | none |
| 9 | `transitive_commutant_scalar` (r31 row 9) | ℤ/2 on {p,q}; singleton | `(f(x)−f(y))T_xy=0`; for a singleton F may be empty and T is scalar | holds | none |
| 10 | `exists_powers_partition` (r31 row 10) | F=∅, N=2; ℤ, N=3 | `wbw⁻¹=aba⁻¹` for `w=ab²`; ℤ: D has density ≥½, so 3 disjoint translates are impossible | holds | none |
| 11 | `reducedFreeGroup_isSimpleRing` (r31 row 11) | singleton basis; full `C*(F₂)` | `C(𝕋)` is not simple (excluded by a≠b); `u−1∈ker χ_triv` | holds | none |
| 12 | `reducedFreeGroup_trace_unique` (r31 row 12) | `τ(λ(g))` | `⟨δ_1,δ_g⟩=[g=1]`; every point evaluation of `C(𝕋)` is a trace | holds | none |
| 13 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (r31 row 13) | ℤ/2; ℤ; S₃ | `f̂(χ)=f_0−f_1`; `δ_1↦z`; `C*(S₃)=ℂ²⊕M₂` is not commutative | holds | none |
| 14 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (r31 row 14) | ℤ; ν↦cν | `C*(𝕋)≅c₀(ℤ)`; rescaling ν rescales f by c | holds | none |
| 15 | `lcaWeyl_classification` (r31 row 15) | Schrödinger pair; ℤ/3; E=0 | `U_sV_χU_s*=conj(χ(s))V_χ`; ℤ/3: `U_1V_χU_1*=ω⁻¹V_χ`; ι=∅ | holds | none |
| 16 | `exists_residue_family` (r31 row 16) | n=1, 2; shift family | n=2 at `b_3`: `S_0*b_3=0`, `S_1*b_3=b_1`; shift: `S_1*S_0≠0` | holds | none |
| 17 | `vonNeumannEntropy_strong_subadditivity` (r31 row 17) | GHZ; 2·GHZ; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `−2log2≤0`; `ρ_A` in place of `ρ_AB` gives `log2≤0` | holds | none |
| 18 | Saddle flow (r31 row 18) | (1,1), (−1,−1), (1,−2) | orbit branches `{(u,c/u)}`; `{x>0,|xy|<ε}` saturated | holds | none |
| 19 | D5.Fields Checks (r31 row 19) | point; jump at ½; non-measurable S; empty X | `E_10e_0=e_1∉span e_0`; `1_Se_0` non-measurable; empty X gives 0 | holds | none |
| 20 | Bicharacter phase, lines 1107–1111 and 1154–1165 (recomputed) | M=ℤ/3, x=(1,ψ); M=ℤ/2 | `ω(x,x)=ζ`, `ω(x,−x)=ω(−x,x)=ζ²`; `Π_x*δ_2=ζδ_0`; `δ_x*δ_x=δ_0`; the wrong phase gives `ζδ_0`; ℤ/2 values are all ±1 | holds; the Check discriminates | R04 repaired |
| 21 | Vacuum cyclicity, lines 3563–3569 (r31 row 21) | h=ℂ; h=ℂ², f=(1,0) | `Σconj(c_n)gⁿ/√(n!)≡0` forces c=0; one line spans only `F_s(ℂ×0)` | holds; two owners | R01 |
| 22 | `U_σ`, `P_a`, `P_s`, lines 3316–3322 and 3486–3488 (recomputed) | composition; n=2 | `(U_σU_τξ)_i=ξ_((στ)⁻¹i)`; `U_σ*=U_(σ⁻¹)`; `P_±=(1±F)/2` | holds; two owners | R01 |
| 23 | Schrödinger relation (r31 row 23) | x=(m,χ), y=(n,ψ) | `Π_xΠ_yξ(t)=χ(t)ψ(t+m)ξ(t+m+n)=ψ(m)Π_(x+y)ξ(t)` | holds | none |
| 24 | ℤ/2 cochain Check, lines 1124–1128 (recomputed) | `b(a)=i` | `ω^b(a,a)=1`; `(iδ_a)²=δ_e` in the ω algebra; reversed `f↦fb` is multiplicative since `b(a)⁴=1` | holds | none |
| 25 | `E_ω` (r31 row 25) | ℤ/2, `ω(a,a)=−1` | `(1,a)²=(−1,e)`; `(i,a)²=(1,e)` in `E_ω` | holds | none |
| 26 | Weight projection (r31 row 26) | `(z,e)` acting by `z^k` | `∫z̄z^k dz=δ_(k1)`; the z weight gives `C*(G,ω⁻¹)` | holds | none |
| 27 | D2.CentralTwists Checks (r31 row 27) | ℤ/2; (ℤ/2)² | `u_a*=−u_a`; `uv=u_(1,1)`, `vu=−u_(1,1)`; `τ=Tr/2` | holds | none |
| 28 | Trace property (r31 row 28) | cocycle at (s,s⁻¹,s) | `ω(s⁻¹,s)ω(s,e)=ω(s,s⁻¹)ω(e,s)` | holds | none |
| 29 | D2.BoundedSequenceTranslation (r31 row 29) | `E_ij`; even p | `Uδ_n=δ_(n−1)`; `UpU*δ_n=[n odd]δ_n` | holds | none |
| 30 | D2.SequenceToeplitz (r31 row 30) | `e=M_(1_[0,∞))` | `eUeδ_n=δ_(n+1)`; Prim is `{η}∪𝕋` | holds | none |
| 31 | D4 conventions (r31 row 31) | ℤ/3 inversion; ℝ; ℤ | `(1/3)Σχ(1−x)=[x=1]`; `ev(n)(z)=zⁿ` | holds | none |
| 32 | Dual-measure normalisation (r31 row 32) | order-n group; ℝ | `Σ|δ_e^|²=n` against `‖δ_e‖²=1`; `∫|f̂|²=2π∫|f|²` | holds | none |
| 33 | One-unit groupoid (r31 row 33) | group G | `dν⁻¹/dν=Δ⁻¹`, so D=Δ | holds | none |
| 34 | Full-shift topology (r31 row 34) | n=2 | `shift^(m+1)(0^m10^∞)=0^∞`; `shift(0^m10^∞)≠0^∞` | holds | none |
| 35 | D7 KMS and Araki (r31 row 35) | K=diag(0,1), `a=E_12`, `b=E_21` | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)` | holds | none |
| 36 | D8 Fock Checks (r31 row 36) | h=ℂ; f=1, g=i | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `W_F(1)W_F(i)=e^(−i/2)W_F(1+i)`; fourth moment `3/4` | holds | none |
| 37 | CAR automorphisms (r31 row 37) | U=0, V=conj; rotation by θ | `{b,b}=2`; `b²=sinθcosθ` | holds | none |
| 38 | D9 Checks (r31 row 38) | Ising; d=1 | bound `1/(2+16e)`; `s−βe=log(2coshβh)=p` | holds | none |
| 39 | Weyl `ℓ²(V)` (r31 row 39) | f, g, v | `λ(f)λ(g)δ_v=e^(−iσ(f,g)/2)λ(f+g)δ_v` | holds | none |
| 40 | Attal locator, line 4087 (recomputed) | Definition 8.19 | `attal-fock` line 639, page header 17 at lines 615–616; (8.18) at line 695, p. 19 | holds | R05 repaired |
| 41 | `T_b` direction, lines 1129–1135 (new) | ℤ/3, ω=1, `b(1)=i`, `b(2)=1` | `ω^b(1,2)=i`; `T_b(δ_1)T_b(δ_2)=iδ_0=T_b(iδ_0)`; reversed: `−δ_0` against `δ_0` | holds | none |
| 42 | `ψ_b` direction, lines 1276–1281 (new) | same data | `(1,1)(1,2)=(i,0)` in `E_(ω^b)`, `ψ_b` image `(i,0)` in `E_1`; reversed: `(1,0)` against `(−1,0)` | holds | none |
| 43 | `U_σ` left-action Check, lines 3355–3363 (new) | h=ℂ³, σ=(1 2), τ=(2 3) | `U_σU_τe_123=e_312=U_(στ)e_123`; `V_(στ)e_123=e_231⊥e_312`; `V_σV_τ=V_(τσ)` | holds | none |
| 44 | Sector projections, lines 3364–3370 (new) | n=0,1,2,3; h=ℂ² | `P_s=P_a=1` (n≤1) against `1−P_s=0`; n=2 sum 1; n=3: 4+0≠8; `dim F_a(ℂ²)=4` | holds | none |

### Cross-roadmap citations and ownership

- **Citations resolved this round.**
  - VonNeumannAlgebras V2 on main (3090489), lines 627–628.
  - NoncompactQuantumSymmetry P.6 at #1015, head 4e793e8: lines 18, 657–679 and 691.
  - QuantumFoundations at #1771, head 824bab8: lines 15, 711, 721–722, 726, 732, 742, 745 and 811.
  - HeisenbergImprimitivity Layer 1 at #1149: lines 198, 248 and 272.
  - Main's own README line 12, which gives vacuum cyclicity to QuantumFoundations §6.4.
  - `scratch/citations.md` lists no unresolved citation or Lean name.
- **Ownership search.** I ran `roadmaps grep -i` for "permutation unitar", "antisymmetriz" and "vacuum cyclicity|cyclicity of (its|the) vacuum" over main and the open heads.
  - The only second owners are those of R01.
  - ClassicalGroups (#1192, line 420) has the symmetrizer and antisymmetrizer `½(1 ± swap)` on `FDRep ℂ (GL n ℂ)`. That is a finite-dimensional algebraic object, not the Hilbert completed tensor power, so it is not a second owner.
  - The other hits are about other objects (ℓ²(G) permutation unitaries, antisymmetrized coefficients) or are consumers (RelativisticQuantumFieldTheory #1772).
- **Overlap data.** No dropped id, no id defined only by an open revision, and no id this pull request drops. The listed #1187 conflict is R03.

### Remarks on untouched text

None.

## Not verifiable

These sources are recorded as uncertified in the manifest. They are cited by locator, unchanged since the previous review, and none was read:

- Bratteli–Robinson 1 and 2;
- Cuntz 1977 §1;
- Renault 1980;
- Brown–Ozawa Proposition 5.1.3.

Rudin's *Fourier Analysis on Groups* is paywalled and not in the manifest. It is cited only for statements consumed from VonNeumannAlgebras V11.

The changed passages cite no new source. Their one locator, Attal pp. 17–19, was read (row 40).

## Source issues

- none
