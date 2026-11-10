# Review of QuantumGroups (pull request #1705 at 8e68b86)

**Verdict:** needs changes

This is an incremental re-review of the 62 lines that changed in `TauCetiRoadmap/QuantumGroups/` since `f4ad8e4`, the head the previous review read. Nothing outside the folder changed. Line numbers refer to `TauCetiRoadmap/QuantumGroups/README.md` unless a file is named.

Two commits sit between the heads:

- `903be55b` applied steps 2–4 of the previous R01: the §8.5 sphericity headline, the U_q rigid and pivotal instances, and `[TauCeti.StarCoalgebra ℂ A]` in place of `hΔ`.
- `8e68b86d` withdrew all three, because the branch's Tau Ceti pin lacks the modules. It reworded the docstring to say so.

The branch is still at Tau Ceti `358314d4`, so R01 is only partly repaired and is carried below. The changed mathematics passes the checks: the gate, the dependency check, elaboration, signatures and the adversarial rows. No new defect was found.

## R01 (P2) — The branch still pins a Tau Ceti that lacks almost every Tau Ceti name the folder cites; after the merge, the new docstring is false and a statable headline is missing

Re-raised: R01 of the previous review (H01 of the repair report before it). This review had no repair report for this head. If that report marks R01 `not actionable in this package`, the reason holds for step 1 (the merge is the worker's). It fails for steps 2–3, which are folder edits needed after the merge.

**Location.**

- `Suggested.lean:27`: "Proved in Tau Ceti and not restated, in modules that the pinned Tau Ceti does not contain (README Layer 8 names the declarations)".
- The same pin clause at `Suggested.lean:24`–`:25` (`TauCeti.StarCoalgebra`), `:71`–`:72` (recoupling) and `:79`–`:80` (sphericity).
- The `From Tau Ceti` contract at `:155`–`:192`, and Layer 8.

**Claim.** The folder is right at one pin only:

- **At the brief's pins** (the branch manifest, Tau Ceti `358314d4`), the docstring is now true. But the README consumes Tau Ceti declarations that do not exist there.
- **At main's pin** (`2fd255d9`, which this README is written against and lands on), every README name resolves. But the four pin clauses become false, and the §8.5 headline is statable there and absent.

**Witness.**

- **The 144 backticked `TauCeti.*` names in the README.** At `2fd255d9`, all 144 match a declaration. At `358314d4`, only `HopfAlgebra.antipode_antipode`, `Sl2Std` and `TemperleyLieb` exist.
- **The modules.** `Algebra/Coalgebra/Star.lean`, `QuantumGroups/`, `FiniteHopfModuleCat/` and `Monoidal/Pivotal/` are absent at `358314d4` and present at `2fd255d9` (`Star.lean:46`, `Spherical.lean:69`).

**Repair.**

1. **The worker merges `origin/main`** (outside the folder). `git merge-tree --write-tree HEAD origin/main` exits 0. Main has not touched the folder since the merge base `c9940702`. The merge moves the manifest to Tau Ceti `2fd255d9`.
2. **Restore the withdrawn repair:** `git checkout 903be55b -- TauCetiRoadmap/QuantumGroups/README.md TauCetiRoadmap/QuantumGroups/Suggested.lean`. This brings back:
   - the five `TauCeti.*` imports;
   - `[TauCeti.StarCoalgebra ℂ A]` in the four headlines;
   - `uqSl2RigidCategory` and `uqSl2PivotalCategory`;
   - `theorem uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`.

   Its docstring ("Proved in the pinned Tau Ceti", with no §8.5 sphericity bullet) is true at `2fd255d9`.
3. **Re-run the gate with its build** on the merged head.

**Tested on the refuting instance.** Each argument of `903be55b`'s declarations was checked against the declaration it uses at `2fd255d9`:

- **Rigid structure:** `rigidCategory hS` (`FiniteHopfModuleCat/Rigid.lean:62`, `:146`) takes `UqSl2.antipode_bijective` (`UqSl2/Antipode.lean:73`).
- **Pivot hypothesis:** `unitEvalNatIso g hg` (`Pivotal.lean:78`, `:119`) needs `hg : S(S a) = g*a*g⁻¹`. `antipode_antipode` (`Antipode.lean:59`–`:60`) gives `kInv q * x * k q`, which is that equation for `g = (kUnit q)⁻¹` (`UqSl2/Basic.lean:163`).
- **Monoidality:** `unitEvalNatIso_isMonoidal` (`Pivotal.lean:221`) needs `IsGroupLikeElem`, whose fields are `counit_eq_one` and `comul_eq_tmul_self` (Mathlib `GroupLike.lean:37`–`:41`). They are supplied by `counit_kInv` and `comul_kInv` (`UqSl2/Hopf.lean:208`, `:192`).
- **Statement:** `SphericalCategory` is declared over `[RigidCategory C] [PivotalCategory C]` (`Spherical.lean:64`–`:71`).
- **Values:** on L₁⁺ at q=1/2, `tr K⁻¹ = 5/2 = tr K`. At q=±1, the module with K=2 gives `1/2 ≠ 2`, so `hq` is needed.

## Previous findings

- R01 — partly repaired: `Suggested.lean:27` "Proved in Tau Ceti and not restated, in modules that the pinned Tau Ceti does not contain". The docstring is now consistent with itself, but the pin is still `358314d4`. `8e68b86d` withdrew `903be55b`'s headline. Carried above.
- Settled, not findings: the shared ownership of §§0.2–0.3 with CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras, and the stale pull-request text. Both heads are unchanged (`b9c0a6f`, `ba43cc7`). The description still announces a "Q9 RepUqg" that the folder lacks. Its merge-order block orders #1649 (now `5a9e439`) before this one.

## Verified sound

**Gate and order.**

- **Gate**, re-run on `8e68b86`: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate records `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- **Dependency check**, the required command with its output unmodified. There is no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 234 roadmaps, 2267 edges, 0 problem(s)
```

**Elaboration, signatures, padding.**

- **Elaboration:** `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:124`, `:156`, `:167` and `:177`.
- **Signatures:** a scratch copy with `#check @` for all six declarations gives types identical to `scratch/signatures.md`, word for word. The Lean statements are unchanged since `f4ad8e4`; only the docstring changed.
  - `AlgebraicHaar` does not carry `[StarModule ℂ A]`, but none of its fields uses it, and every headline carries the binder.
  - The `of` entry in `signatures.md` is the generator reading the `module` keyword, not a declaration.
- **Padding:** the probe `first | rfl | simp | infer_instance | trivial | decide | aesop` fails on all four theorems ("made no progress", "unsolved goals").

**Headline theorems.**

| Headline | How it is handled |
| --- | --- |
| §3.1 `schur_orthogonality` and the §4.1 trio | Stated |
| §1.2 Haar state; Layer 2 Peter–Weyl; Layers 4–7 | Not statable: no minimal C*-tensor product at either pin (r33 grep) |
| §§3.2–3.4; Layer 6 | Not statable: no dagger/C*-category or blockwise `F^z` at either pin |
| §8.5 pentagon | Not statable at either pin: Tau Ceti has only triple recoupling (`Recoupling.lean:135` at `2fd255d9`) |
| §8.5 sphericity | Correctly unstated at `358314d4`; statable at `2fd255d9` (R01) |
| §8.6 comparison | Not statable: needs `C(SUq(2))` |

**Changed passages, read against both pins.**

- **`:672`–`:675`.** `TauCeti.StarCoalgebra`'s only field (`Star.lean:46`–`:49`) is `comul (star a) = star (comul a)`, which is `hΔ` verbatim.
- **`:1517`.** The cited names exist at `2fd255d9`: `LocallyFinite.lean:79`, `TypeOne.lean:370`, `CompleteReducibility.lean:300`, and Mathlib `IsSemisimpleModule.{extension_property, lifting_property}`.
- **`:1618`–`:1627`.** `PivotalCategory` is declared over `[RigidCategory C]` (`Pivotal/Basic.lean:76`–`:80`), so a local pivotal structure on top of the local `rigidCategory hS` is coherent. The hypothesis "unit g, S²=Ad(g), group-like" is exactly `g : Hˣ`, `hg`, `hg₁` (`Pivotal.lean:78`, `:221`).
- **`:1685`–`:1688` and `:1698`.** The trace sides are those of `Pivotal/Trace.lean:88`, `:93`. The hypothesis `q−q⁻¹≠0` is that of `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (`QuantumTrace.lean:41`).
- **The `Suggested.lean` pin clauses.** All four are true at `358314d4`: `ls` shows the six module paths absent. All four are false at `2fd255d9`.

**Seeded sample, where it falls in the changed passages.**

- **8.3:** Virelizier Theorem 3.13 and Corollary 3.14, p.13, at `virelizier` lines 625–636 (page marker line 608). The type-1 splitting is as stated.
- **The §8.5 locators** under the changed sentences:
  - Lemma 2.3, pp.6–7, at `virelizier` line 265 (p.7 marker at 291): the duals.
  - Proposition 2.4 at line 358: `S²(x)=K⁻¹xK`, matching `Antipode.lean:59`.
  - Proposition 4.1, pp.13–14, at line 644.
- The other sampled targets lie in untouched text and keep the previous report's verdicts.

**Ownership of the changed objects.** `roadmaps grep SphericalCategory` finds sphericity of U_q-modules only in QuantumGroups (main, #1705, #1649). CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras use the class for other categories. `scratch/overlaps.md` lists no dropped id and no revision-only id. #1649 conflicts with this pull request, and the description states their order.

**Adversarial table.** The rows marked (r33) are carried from the previous report, for statements the diff leaves untouched. The other rows are new and computed this round. q=1/2 unless stated.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.1 Hopf *-algebra, `hΔ` (`:672`–`:675`) | ℂ[ℤ] with u*=u⁻¹; with u*=u | `Δ(u*)=u⁻¹⊗u⁻¹=(u⊗u)*`. With u*=u, `Δ(u*)=u⊗u=(u⊗u)*` also holds, so the equation alone admits it; Haar positivity `h((u−u⁻¹)*(u−u⁻¹))=−2` excludes it | ok | none |
| §8.3 `:1517` diagonalizable K | L₁⁻; q=1 | K eigenvalues `−1/2, −2 = −q^(±1)`; at q=1, `K=[[1,1],[0,1]]` has a one-dimensional eigenspace | ok (names: R01) | R01 |
| §8.5 pivot g=K⁻¹ (`:1618`–`:1627`) | K⁻¹; wrong pivot K; g=1 | `S²E=q⁻²E=K⁻¹EK` ✓; `KEK⁻¹=q²E≠q⁻²E`, so K fails `hg`; g=1 gives `E≠q⁻²E` (q²≠1) | ok | none |
| §8.5 traces (`:1698`) | L₀⁺⊕L₁⁺, f = projection to L₁⁺ | rightTrace `tr(K⁻¹f)=2+1/2=5/2`; leftTrace `tr(Kf)=1/2+2=5/2` | ok | none |
| §8.5 sphericity (`:1685`–`:1688`) | L₂⁺; L₀⁻; L₁⁺ at q=i; q=±1 | `tr K=1/4+1+4=21/4=[3]_q`; `−1=ε[1]`; q=i: `q−q⁻¹=2i≠0`, `tr K=i−i=0=tr K⁻¹=[2]_i`; q=±1, K=2: `1/2≠2` | ok | none |
| New Check `:1707` (ℂ[C₂]) | g=1, g=u; sign and trivial modules | `S²=id=Ad(u)` (commutative); sign: right dim `tr g` is `1` vs `−1`, left dim `tr g⁻¹` is `1` vs `−1` (u⁻¹=u); trivial: `1, 1` | ok, discriminates "pivot fixed by S²" | none |
| Docstring pin clauses (`Suggested.lean:24`–`:28`, `:68`–`:80`) | 358314d4 vs 2fd255d9 | the modules are absent at 358314d4 (true); present at 2fd255d9 (`Star.lean:46`, `Recoupling.lean:135`, `Spherical.lean:69`) (false) | pin-dependent | R01 |
| §8.5 pentagon unstated | quadruple recoupling | absent at both pins; only triple recoupling (`Recoupling.lean:135`) | ok | none |
| `AlgebraicHaar` (r33) | ℂ[C₂], `h(u_g)=δ_g,e`; zero functional | `(id⊗h)Δu=0=h(u)1`; `h((1+u)*(1+u))=2`; zero: `h(1)=0≠1` | ok | none |
| `AlgebraicHaar`, wrong star (r33) | ℂ[ℤ], u*=u | `h(u²−2+u⁻²)=−2<0` | ok | none |
| `schur_orthogonality` (r33) | SUq(2), `F̃=diag(2,1/2)` | `h(a*a)=1/5`; `h(c*c)=4/5`; `h(a*c)=0`; `h(aa*)=4/5=F̃₁₁/TrF̃` | ok | none |
| `schur_orthogonality`, degenerate (r33) | A=H=ℂ; H=0; `I₂` on ℂ² | `1=1/1`; H=0 not simple; `I₂`: `h(u₁₁*u₂₂)=1≠δ₁₂=0`, so simplicity is needed | ok | none |
| `unitaryCoefficientSet` (r33) | n=1; n=0; ℂ[C₂] | `[1]` unitary; n=0 adds nothing; `u*u=1` | ok | none |
| `compactType_iff` (r33) | ℂ; ℂ[C₂]; zero ring; ℂ[x] primitive; ℂ[ℤ] with u*=u | both true; both true; `h(1)=0≠1`, so `[Nontrivial A]` is needed; both false; both false | ok | none |
| `haar_modular_automorphism` (r33) | SUq(2); θ⁻¹; ℂ[S₃] | `h(aa*)=4/5=4·h(a*a)`; θ⁻¹ gives `1/20`; θ=id | ok | none |
| `haar_trace_iff_antipode_involutive` (r33) | ℂ[S₃]; SUq(2) | trace and `S²=id`; `4/5≠1/5` and `S²c=c/4` | ok | none |
| §8.5 CG vector, Δ(E²) (r33) | m=n=j=1; r=2 | `α₁=−1/2`, top coefficient `1/2−1/2=0`; `1+q²=5/4=q[2]` | ok | none |
| §8.1 antipode, Ore twist, `[n]` (r33) | generators; q=i; q=1 | `S²E=q⁻²E`; twist `q²q⁻²Kδ_E(F)`; `[−2]=−5/2`; totalized `0` vs `2` | ok | none |
| §8.2 ladders, source formula (r33) | L₂⁺, L₁⁻; Virelizier Ex. 3.3 | weights `1/4,1,4`; `[E,F]=diag(5/2,0,−5/2)`; `[i][n−i+1]` | ok | none |
| §8.3 Casimir, q=1 (r33) | L₀⁺, L₁⁺, L₂⁺; Jordan K | `10/9, 17/9, 65/18`; mixed ordering gives `diag(8/9,26/9)`; ℂe₁ has no complement | ok | none |
| §8.4 type 1 (r33) | L₀⁻; Verma M(1) | `−1∉{2^(−k)}`; F not nilpotent | ok | none |
| §8.6 real form; §8.7 bases (r33) | relations; `v_i=q^(i(i−1)/2)u_i` | `(KE)*=q²K²F`; `E*=2F` on L₁⁺; F-coefficient `[i+1]`; `(2)_q=5/4≠5/2` | ok | none |
| 0.1–0.3 (r33) | legs on C₂; `diag(2,1)`; SU(2) cup; TL at d=5/2, √2 | `U₁₂U₁₃=Δu`; squared norms `8, ½≠2`; `ε=−1=−τ`; `4/25, 21/25`; `[4]=0` | ok | none |
| 1.1–2.3 (r33) | S₃; ℤ; monoid {1,0}; `U=[[1,2],[0,−1]]` | noncommutative products; `Δ1[0]` not C₀; dim ≤ 3; `det T=2`, `U*TU=T` | ok | none |
| 3.2–3.4 (r33) | f_z; F; c | `f₂(a)=4`; `TrF=TrF⁻¹=5/2`; `σ_t(c)=c`, `τ_−i(c)=c/4=S²c` | ok | none |
| 4.2–4.3 (r33) | ℤ pentagon; C₂; F₂; ℤ | both words give `(δ₁,δ₃,δ₆)`; `‖1+u‖=2`; `2√3<4`; `2/(2N+1)→0` | ok | none |
| 5.1–5.2 (r33) | `u*u`, `uu*`; `F=[[0,1],[−2,0]]` | c normal, `S²c=c/4`; `FF̄=−2I`, `‖E‖²=5`; AM–GM `q+q⁻¹` | ok | none |
| 6.1–6.3 (r33) | Rep(S₃); I_n; {e}→C₂ | `1+1+4=6`; `ε(a)=0`; `(a,b)↦a` | ok | none |
| 7.1–7.2 (r33) | `c*c`, `(c*c)²`; ξ₂; `F=[[0,1],[−2,0]]`; n=1 | `4/5`, `16/21`; `√3/4`; `β=25/4=d²`; n=1: `u⊗u=1` | ok | none |

**Library declarations opened.**

- **At `2fd255d9`** (the content checkout's Tau Ceti):
  - `Algebra/Coalgebra/Star.lean:46`–`:49`;
  - `CategoryTheory/Monoidal/Pivotal/Basic.lean:76`–`:80`; `Pivotal/Trace.lean:88`, `:93`; `Pivotal/Spherical.lean:64`–`:71`;
  - `Algebra/Category/FiniteHopfModuleCat/Rigid.lean:62`, `:146`; `FiniteHopfModuleCat/Pivotal.lean:69`, `:78`, `:119`, `:221`;
  - `QuantumGroups/UqSl2/Basic.lean:163`; `UqSl2/Antipode.lean:59`, `:65`, `:69`, `:73`; `UqSl2/Hopf.lean:192`, `:208`; `UqSl2/QuantumTrace.lean:41`; `UqSl2/ClebschGordan/Recoupling.lean:135`; `UqSl2/TypeOne.lean:370`; `UqSl2/CompleteReducibility.lean:300`;
  - `RingTheory/Finiteness/LocallyFinite.lean:79`;
  - Mathlib `RingTheory/Coalgebra/GroupLike.lean:37`–`:41`.
- **At `358314d4`:** the absent paths listed under R01. `HopfAlgebra/Antipode.lean:88` (`antipode_antipode`) and `Lie/Sl2/Standard.lean` (`Sl2Std`) are present.
- **Remarks on untouched text:** none.

## Not verifiable

- **Elaboration of `903be55b`'s `Suggested.lean` at main's pin.** This review may run Lean only at the branch pin (`lake env lean`). R01's repair was checked by matching each argument against the declaration it uses at `2fd255d9`, not by elaborating it.
- **Timmermann** (`timmermann`) is settled as uncertified. None of its locators lies in the changed passages.
- **Ownership against open pull requests** was checked by `roadmaps grep` over all open heads for `SphericalCategory`, and by `scratch/overlaps.md`. Other objects were not searched pull request by pull request; their text did not change.

## Source issues

- none
