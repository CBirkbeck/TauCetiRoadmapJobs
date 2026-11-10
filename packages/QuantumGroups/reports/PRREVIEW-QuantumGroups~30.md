# Review of QuantumGroups (pull request #1705 at f4ad8e4)

**Verdict:** needs changes

This is an incremental re-review of the 36 lines that changed in `TauCetiRoadmap/QuantumGroups/README.md` since `96014ab`. `Suggested.lean` is byte-identical to `96014ab`, and nothing outside the folder changed. Unless stated otherwise, locations are in `TauCetiRoadmap/QuantumGroups/README.md`.

**Findings at a glance:**

- R04, R05 and R06 of the previous report are repaired. The repairs are correct and introduce no new problem (see the adversarial rows below).
- R02 and R03 of the previous report are not repaired, but they are settled. The repair report on `f4ad8e4` marked them "not actionable in this package", and its reasons hold: neither can be repaired by a folder edit. They are listed under Previous findings and are not carried.
- R01 is the one finding. It is re-raised below because its reason fails, and it now also covers the new §8.3 citations.

## R01 (P2) — The branch builds against a Tau Ceti that lacks 141 of the README's 144 Tau Ceti names, and `Suggested.lean`'s docstring is false at either pin

Re-raised: H01 of the repair report on `f4ad8e4`.

The reason says this is "not actionable in this package; the folder needs no change now". It is right that the repair job cannot merge `origin/main`. It is wrong that the folder needs no change:

- At the branch pin, the docstring at `Suggested.lean:26`–`:34` is false, and so is this round's new sentence at `:1517`.
- At main's pin, `Suggested.lean:70`–`:77` is false, and a headline that is statable there is missing.

So the folder needs a change at either pin. The merge is the worker's step; the folder change follows it, inside this package.

**Location:**

- `lake-manifest.json` pins Tau Ceti `358314d4`, Mathlib `f6090c70` and Lean `v4.35.0-rc3`. Main (`f8836c4`) pins `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`.
- New at `:1517`–`:1522`: "Two consequences at generic q are already in the pinned libraries … `TauCeti.IsLocallyFiniteModule.of_finite` … `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`".
- Also all of Layer 8 and the `From Tau Ceti` contract.
- `Suggested.lean:26`–`:34` says "Proved in the pinned Tau Ceti … `TauCeti.UqSl2`". `Suggested.lean:76`–`:77` says "the pinned Tau Ceti has none of these modules". The two passages contradict each other at every pin.

**Claim:** the Tau Ceti declarations the folder cites exist at its pins, and the docstring's "not statable" list holds at those pins.

**Witness:**

- **Name sweep.** The README cites 144 backticked `TauCeti.*` names: 143 before, plus `TauCeti.IsLocallyFiniteModule.of_finite`.
  - All 144 exist at `2fd255d9`. `of_finite` is `RingTheory/Finiteness/LocallyFinite.lean:79`.
  - At `358314d4` only the same three exist as before. Neither `TauCeti/QuantumGroups/` nor `RingTheory/Finiteness/LocallyFinite.lean` is there.
- **Docstring at main's pin.** `CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`, `Pivotal/Basic.lean:76`, `Algebra/Category/FiniteHopfModuleCat/Rigid.lean:146`, `FiniteHopfModuleCat/Pivotal.lean:119`/`:221` and `QuantumGroups/UqSl2/Antipode.lean:59`/`:73` all exist at `2fd255d9`.
- **Merge and CI.** `git merge-tree --write-tree HEAD origin/main` is clean, and the pull request's CI `build` check is SUCCESS at this head.

**Repair** (as in the previous report; its carriers were re-read at `2fd255d9`):

1. The worker merges `origin/main` into the branch and re-runs the gate with its build. The branch changes neither `lake-manifest.json` nor `lean-toolchain`, so the merge has no conflict.
2. In the folder, give the rigid and pivotal structures real bodies as local instances:
   - rigid structure: `TauCeti.FiniteHopfModuleCat.rigidCategory (TauCeti.UqSl2.antipode_bijective q)`;
   - pivotal structure: `pivotalIso := TauCeti.FiniteHopfModuleCat.unitEvalNatIso (TauCeti.UqSl2.kUnit q)⁻¹ hg` and `pivotalIso_isMonoidal := TauCeti.FiniteHopfModuleCat.unitEvalNatIso_isMonoidal _ _ hg₁`;
   - `hg` comes from `TauCeti.UqSl2.antipode_antipode`, which says `S²x = K⁻¹xK = g x g⁻¹` for `g = K⁻¹`;
   - `hg₁` is group-likeness of `K⁻¹`.
3. State `theorem uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`, with the `TauCeti.*` imports of those modules.
4. Delete `Suggested.lean:70`–`:77`, list the theorem under "Stated here", and name it in §8.5.

After the merge, `:26`–`:34` and `:1517` are true as written.

## Previous findings

- R01 — not repaired: "`lake-manifest.json`" still pins Tau Ceti `358314d4`. `Suggested.lean:76`–`:77` still says "the pinned Tau Ceti has none of these modules", and the new `:1517` cites `TauCeti.IsLocallyFiniteModule.of_finite`, which is absent at that pin. Carried as R01, re-raised.
- R02 — not repaired, settled: `:33`–`:42` is unchanged. #888 (`b9c0a6fb`) `:45`–`:46` still reads "single home here", #867 (`ba43cc7a`) `:67`, `:72`–`:76` is unchanged, and #1649 (`5155098d`) `:50`–`:51` still hands the unitary Temperley–Lieb category to TemperleyLiebOperatorAlgebras. The repair report's H02 reason holds: no folder edit repairs this.
- R03 — not repaired, settled: `gh pr view` still shows the title "QuantumGroups: construct the ribbon category RepUqg", and `git merge-tree` against #1649 still conflicts in both files. The repair report's H03 reason holds. The replacement description is the previous report's R03.
- R04 — repaired: `:1517`–`:1534` now cites diagonalizability and splitting from `TauCeti.IsLocallyFiniteModule.of_finite`, the signed type-1 equivalence, `isSemisimpleModule_of_finiteDimensional` and Mathlib's `extension_property`/`lifting_property`. It derives only the Hom and End formulas, and `:75` reads "the Hom and endomorphism formulas of §8.3".
- R05 — repaired: `:1225` reads "*Needs:* §§6.1–6.2; §4.2 for the universal and reduced completions of the reconstructed core and §4.3 for A_u=A_r=C(G); Mathlib …".
- R06 — repaired: `:1054` reads "Bédos–Murphy–Tuset §2, pp.13–14", and `:328` reads `CategoryTheory.Idempotents.Karoubi`.

## Verified sound

**Head, gate, order.**

- **Head:** `f4ad8e41`, clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- **Gate:** re-run on this head. Every scanner is 0, ending `… stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate records `build=0`.
- **Dependency check:** the required command prints the following, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

- **Merges:** `git merge-tree --write-tree HEAD origin/main` is clean. Against #1649 both files conflict (settled R03).

**Elaboration, signatures, padding.**

- **Elaboration:** `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:121`, `:153`, `:164` and `:174`.
- **Signatures:** a scratch copy with `#check @` for all six declarations gives the types in `scratch/signatures.md`. They are unchanged from the previous report, which compared them with the README.
- **Padding:** the file is unchanged, so the previous report's one-tactic probes stand: all four headlines fail them.
- **Mathlib names newly cited in the changed text**, `#check`ed at the branch Mathlib:
  - `CategoryTheory.Idempotents.Karoubi`;
  - `IsSemisimpleModule.extension_property`, `IsSemisimpleModule.lifting_property` and `IsSemisimpleModule.exists_end_algEquiv_pi_matrix_end`;
  - the Schur step's `LinearMap.bijective_of_ne_zero` and `IsAlgClosed.algebraMap_bijective_of_isIntegral`;
  - `Module.Finite.of_restrictScalars_finite`;
  - §6.3's Gelfand names.

**Library declarations opened** (file:line at the pin):

- **Mathlib `f6090c70`:**
  - `RingTheory/SimpleModule/Basic.lean:244` (`[IsSemisimpleModule R M]`), `:254` (`extension_property`) and `:260` (`lifting_property`). In both lemmas the semisimple module is the middle term, as `:1523`–`:1525` say.
  - `RingTheory/SimpleModule/WedderburnArtin.lean:135`–`:141`. It needs `[IsSemisimpleModule R M] [Module.Finite R M] [IsScalarTower R₀ R M]`.
  - `RingTheory/SimpleModule/Basic.lean:503`, `:518` (Schur's lemma) and `FieldTheory/IsAlgClosed/Basic.lean:220`.
- **Mathlib `1b1ccf4b`:** the same names exist (`Basic.lean:255`, `:261`; `WedderburnArtin.lean:146`).
- **Tau Ceti `2fd255d9`:**
  - `QuantumGroups/UqSl2/Basic.lean:76`–`:79`, where the relation is `(q−q⁻¹)⁻¹ • (K − K⁻¹)`;
  - `QuantumGroups/QuantumInteger/Basic.lean:33`;
  - `UqSl2/TypeOne.lean:83`, `:182`–`:184` (`IsSignedTypeOne`), `:370`–`:378`;
  - `UqSl2/CompleteReducibility.lean:300`;
  - `UqSl2/Character.lean:241`;
  - `RingTheory/Finiteness/LocallyFinite.lean:79`;
  - `UqSl2/Antipode.lean:59`, `:73`;
  - `FiniteHopfModuleCat/Pivotal.lean:78`, `:119`, `:221` and `Rigid.lean:146`;
  - `Pivotal/Basic.lean:76`–`:82` and `Spherical.lean:69`.
- **No duplication of what §8.3 still owns.** At `2fd255d9`, `git grep` over `UqSl2/` finds no Σab Hom formula and no `End_U(V) ≃ Π M_a(ℂ)`. The closest are `finrank_linearMap_ladderModule_eq_formalCharacter_coeff_sub`, a Hom out of a simple, and `ladderModuleTensorHomEquiv`. `roadmaps grep` finds the formulas only in the two QuantumGroups revisions (#1705 `:1527`, #1649 `:1445`).

**Cross-roadmap citations.**

- The changed lines cite no new roadmap.
- §5.1's CStarAlgebras C5.1 and VonNeumannAlgebras Layer 0, and §6.3's CStarAlgebras C5.2, were resolved on main by the previous report.
- `scratch/citations.md` lists nothing missing.
- `scratch/overlaps.md` lists no dropped or revision-only id. Its #1649 conflict is the settled R03, and its vocabulary neighbours #888 and #867 are the settled R02.

**Seeded sample** (changed passages only; the rest of the sample is in the previous report's table):

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 6.3 | Malacarne Theorem 4.1, p.5 | `malacarne` lines 285–289 | Correct. It gives existence and uniqueness of `(C[G],Δ)` up to isomorphism, which supports both the reconstruction and the uniqueness of §6.3 |
| 5.1 (changed locator) | Bédos–Murphy–Tuset §2, pp.13–14 | `bmt` lines 512–571 (p.12, Theorem 2.11's proof), 586–605 (p.13: U, basis `a_kmn`, Haar vanishing), 614–625 (Theorem 2.12), 626–670 (p.14) | Correct |
| 8.3 (changed *Needs:*) | Virelizier Theorem 3.13, Corollary 3.14, p.13 | `virelizier` lines 608–636 (header "QUANTUM GROUPS 13") | Correct. Submodules of category-F modules are direct factors, and category-F modules are finite sums of `L(n)`, which is the type-1 splitting |

**Adversarial table.** q=1/2 unless stated. Rows marked (~28) are carried unchanged from the previous report for statements the diff leaves untouched; the first eleven rows are new.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 8.3 diagonalizability, `±q^k` | `V=L₁⁺⊕L₀⁻`; wrong model "type 1" | `K=diag(1/2,2,−1)=diag(q,q⁻¹,−q⁰)`: signed type 1 holds. `−1∉{2^(−k)}`, so the unsigned condition fails on `L₀⁻` | ok, the ± is needed | none |
| 8.3 instance route | finite-dimensional V | `of_finite` needs `[IsNoetherianRing ℂ] [Module.Finite ℂ V]`; the mpr of `TypeOne.lean:370` gives `IsSignedTypeOne` under `IsGenericQuantumParameter q` | ok | none |
| 8.3 new Check, q=1 | `K=[[1,1],[0,1]]`, `K⁻¹=[[1,−1],[0,1]]`, `E=F=0` | `(1−1)⁻¹=0`, so `[E,F]=0=0•(K−K⁻¹)`; `KE=EK=0`; `KK⁻¹=I`. `(K−I)≠0`, `(K−I)²=0`: not diagonalizable. The only K-stable line is `ℂe₁`, so it has no complement | Check correct | none |
| 8.3 genericity of q=1 | `IsGenericQuantumParameter 1` | `1¹=1`, so false (`QuantumInteger/Basic.lean:33`) | negative control valid | none |
| 8.3 splitting | `0→L₀⁺→L₀⁺⊕L₁⁺→L₁⁺→0` | `extension_property` with `g=id_N` gives a retraction `h∘f=id`; `lifting_property` with `g=id_Q` gives a section `f∘h=id`; both are semisimple in the middle term | ok | none |
| 8.3 Hom formula | `V=L₀⁻⊕L₁⁺`, `W=(L₁⁺)²`; wrong model `Σ a b·dim L` | `Σab=1·0+1·2=2`, the direct count (Casimir `−10/9≠17/9` kills `L₀⁻`); the wrong model gives `1·2·2=4` | ok | none |
| 8.3 End formula | `L₀⁻⊕L₁⁺`; `(L₁⁺)²`; 0 | `ℂ×ℂ`, dim `2=1²+1²`; `M₂(ℂ)`, dim `4=2²`; for 0, an empty product and `End(0)` are both the zero ring | ok | none |
| 8.3 Wedderburn–Artin route | hypotheses | `Module.Finite U V` from `of_restrictScalars_finite`; `IsScalarTower ℂ U V` is standing; `End_U(S_i)=ℂ` by `bijective_of_ne_zero` and `algebraMap_bijective_of_isIntegral` (finite-dimensional) | ok | none |
| scope `:75` | §8.3 targets vs `2fd255d9` | only `Character.lean:241` (Hom from a simple) and `ladderModuleTensorHomEquiv`; no Σab or `Π M_a(ℂ)` | owned here | none |
| 6.3 *Needs:* | edges | §4.2 `:959` → §4.1, H2, §0.1, C5.1, VNA 0/V1/V13b; §4.3 `:1005` → §4.2, D2, AmenableGroups, F3; Layer 6 Dependencies "Layers 4–5" | acyclic, consistent | none |
| 5.1 and 0.2 citations | `bmt` footers; `#check` | the footer "12" at line 571 closes Theorem 2.11's proof, and SUq(2) starts at line 586 (p.13); `Idempotents.Karoubi : (C : Type) → [Category C] → Type` | ok | none |
| `schur_orthogonality`, first form (~28) | `a=u₁₁`, `c=u₂₁` | `h(a*a)=1/5=(1/2)/(5/2)`; `h(c*c)=4/5`; `h(a*c)=0` | ok | none |
| `schur_orthogonality`, second form (~28) | `aa*`, `u₁₂u₁₂*` | `4/5=F̃₁₁/TrF̃`; `q²h(c*c)=1/5` | ok | none |
| `schur_orthogonality`, degenerate (~28) | A=ℂ; zero ring | `F̃=1`, `h(1)=1`; no `AlgebraicHaar` (`h(1)=h(0)=0≠1`) | ok | none |
| `compactType_iff` (~28) | ℂ; ℂ[C₂]; zero ring; ℂ[x] | both true; `|a|²+|b|²`; `[Nontrivial A]` excludes the zero ring; `x+h(x)≠h(x)`: both false | ok | none |
| `compactType_iff`, other star (~28) | ℂ[ℤ], `u*=u` | `h((u−u⁻¹)*(u−u⁻¹))=−2<0`; both false | ok | none |
| `haar_modular_automorphism` (~28) | SU_(1/2)(2); ℂ[S₃]; θ⁻¹ | `θ(a)=4a`: `h(aa*)=4/5=h(a*·4a)`; θ=id; θ⁻¹ gives `1/20≠4/5` | ok | none |
| `haar_trace_iff_antipode_involutive` (~28) | ℂ[S₃]; SU_(1/2)(2) | trace and `S²=id`; `1/5≠4/5` and `S²c=c/4` | ok | none |
| 0.1 legs and isometry (~28) | C₂ sign u; injective φ | `U₁₂U₁₃=Δu`; `‖T_φ(x⊗1)‖=‖Tx‖` | ok | none |
| 0.2 C*-identity, d, sign, J (~28) | `diag(2,1)`; SU_(1/2)(2); `R=e₁⊗e₂−e₂⊗e₁`; `J(z₁,z₂)=(−z̄₂,z̄₁)` | `4=‖T‖²`; `d=5/2`; `R̄=−R`; `J²=−I` | ok | none |
| 1.2 Haar, Fell (~28) | C(C₂); {1,0}; Γ=ℤ | `1/2≠1`; dim 3<4; `δ₁⊗δ₂↦δ₂⊗δ₃` | ok | none |
| 2.1–2.2 (~28) | C₂ sign; S₃; `U(s)=[[1,2],[0,−1]]` | `(−1)²=1`; `u₁₃(gh)=1`, `u₁₃(hg)=0`; `U*TU=T`, det 2 | ok | none |
| 3.2–3.4 (~28) | `f_z(a)`; ū; c | `2^z`, `f₁*f₁(a)=4=f₂(a)`; invariant `F̃`; `τ_(−i)(c)=c/4=S²c` | ok | none |
| 4.2–4.3 (~28) | Γ=ℤ; ℂ; F₂ | pentagon `(δ₁,δ₃,δ₆)`; Følner `2/(2N+1)`; `2√3<4` | ok | none |
| 5.1 relations, antipode (~28) | general q; q=0 | `u*u=1` and `uu*=1` give the five relations; `S(c*)=−c*/q`, so q=0 fails | ok | none |
| 5.2 cup (~28) | `F=[[0,1],[−2,0]]` | `FF̄=−2I`; `‖E‖²=5` | ok | none |
| 6.2 counit on I_n (~28) | 1 ∈ B_n | `ε(a)=a(1)=0` | ok | none |
| 7.1 Haar, q=−1, character (~28) | `t`, `t²`; σ₃, σ₁; ξ₂ | `4/5`, `16/21`; `ac=−ca`; `⟨ξ₂,aξ₂⟩=√3/4` | ok | none |
| 7.2 normal form (~28) | `F=[[0,1],[−q⁻¹,0]]` | d: 1, 5/2, 21/4, 85/8 | ok | none |
| 8.1–8.2 (~28) | KF; q=i; L₂⁺; L₁⁻ | `KF=4FK`; `[E,F]=diag(5/2,0,−5/2)`; `diag(−1,1)` | ok | none |
| 8.3 Casimir (~28) | L₀⁺, L₁⁺, L₂⁺ | `10/9`, `17/9`, `65/18`; FE + toral term `=17/9·I` | ok | none |
| 8.4 type 1 (~28) | L₀⁻; Verma M(1) | `K=−1∉{qᵏ}`; F not locally nilpotent | ok | none |
| 8.5 Clebsch–Gordan, Δ(E²) (~28) | m=n=j=1 | `α₁=−1/2`; `(5/4)EK⊗E` | ok | none |
| 8.5 sphericity (R01) | L₁⁺; q=±1; q=i | `trK⁻¹=5/2=trK`; 1/2 vs 2 at q=±1, so the hypothesis is needed; `q−q⁻¹=2i≠0`; carriers present at `2fd255d9` | statement ok; absent | R01 |
| 8.6–8.7 (~28) | m=1; m=2, 3 | `h₁=1/2`, `E*=2F`; `Fv₁=(5/2)v₂`, `Fv₂=(21/4)v₃` | ok | none |

**Remarks on untouched text:** none.

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008). The manifest settles it as `uncertified`. §5.1's "Timmermann Chapter 6 §2", on a changed line, was not read; the other half of that line, the BMT locator, was read.
- **Elaboration at main's pins.** This review's Lean commands use the branch pins. R01's repair was checked by reading the declarations at `2fd255d9`, not by elaborating them.
- **Ownership against open pull requests** was checked against the sibling checkouts in the brief (#888, #867, #1041, #1137, #1015), against #1649 at `5155098d` through `roadmaps show`, and with `roadmaps grep`. Other pull requests were not searched.

## Source issues

- **Misprint** in bmt at Theorem 2.12, proof, p.13: the source writes the Haar state as (1−q²) times the plain sum over n of the diagonal coefficients at `e_n0`; it should weight the n-th term by q^(2n), since the plain sum diverges at a=1; affects the proof.
