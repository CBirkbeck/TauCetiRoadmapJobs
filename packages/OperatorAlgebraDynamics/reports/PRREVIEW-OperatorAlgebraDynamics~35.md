# Review of OperatorAlgebraDynamics (pull request #1137 at f8ae283)

**Verdict:** needs changes

This is an incremental re-review of the 37 lines that changed since 3e67e69: 32 in `README.md` and 5 in the `Suggested.lean` docstring.

- The three repairs inside the folder (R02, R03 and R04 of the previous review) are correct, and none of them introduces a new problem.
- Nothing in `TauCetiRoadmap/OperatorAlgebraDynamics/` needs a further edit.
- One finding remains, and it is outside the folder: the branch still deletes six files of other roadmaps, so the gate fails. It is P3, so nothing is blocking. Still, the folder cannot be accepted until the gate passes.

## R01 (P3) — The branch still deletes six files of other roadmaps, so the gate fails

Re-raised: H02

Carried from the previous R01. Not repaired.

**Location.** These files are outside the folder:

- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`

**Claim.** Merging would delete from main six files that belong to other roadmaps.

**Why the reason fails.** The repair reports answer H02 by saying that a repair of this folder may not write outside it. That limits who can make the change. It does not remove the defect: the gate fails on this head, and no folder is accepted while the gate fails. The fix is one commit on the branch by someone who can write outside the folder.

**Witness.**

- At f8ae283, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` gives `6 files changed, 159 deletions(-)`, and the six files are exactly these paths.
- My gate run gives `outside-folder=6 … FAIL` with these six paths, and every other check is 0.

**Repair.** In a new commit on the branch, run `git checkout origin/main -- <the six paths>`, then re-run the gate.

I checked that this restores the right files against the current main:

- The merge base of HEAD and origin/main (f8836c4) is 32a0bcc9, the main-side parent of the merge commit 4133234f that dropped the files.
- `git diff 32a0bcc9 origin/main -- <the six paths>` is empty, so the checkout restores exactly the blobs the merge dropped.
- `git diff --stat HEAD origin/main -- <the six paths>` is `6 files changed, 159 insertions(+)`. That is the whole difference, so afterwards the diff against main touches only `TauCetiRoadmap/OperatorAlgebraDynamics/`, and `outside-folder` is 0.

## Previous findings

- R01 — not repaired: `git diff --stat origin/main...HEAD` outside the folder still lists the deletion of the six `PROGRESS.md`/`STATUS.md` files of FiniteGroupExtensionSplitting, LieGroupoidsPoisson and PrimitivePrimeDivisors (159 lines); the gate reports `outside-folder=6 … FAIL`. Raised again as R01.
- R02 — repaired: README lines 2030–2032, "quotient topology directly (Williams, Example 3.32, pp. 96–97, for the same flow written as the action `r·(x,y)=(rx,r⁻¹y)` of the multiplicative positive reals, `r=exp(t)`)"; References lines 4055–4056 add Example 3.32.
- R03 — repaired: README lines 2280–2283, "Mathlib's Fourier transform `𝓕` on ℝ (the instance `Real.instFourierTransform`, written out by `Real.fourier_eq'` as `𝓕 f w = ∫ v, exp(−2πi⟪v,w⟫) • f v`)"; the same name is used at lines 253–256, 2330, 2467 and 2482.
- R04 — repaired: README lines 3815–3816, "replacing ρ by cρ multiplies each side by c and then adds `−2c·Tr ρ·log c` to it, and the inequality for cρ is equivalent to that for ρ"; `Suggested.lean` lines 406–408 say the same.

The two items the previous review recorded as settled, with no change requested in this folder, are unchanged:

- **Second owners in other roadmaps (H01).** NoncompactQuantumSymmetry and QuantumFoundations should cite D8's `U_σ`, `P_s` and `P_a`. That repair is in their pull requests; I did not re-read their heads this round.
- **Pull-request description (H03).** The description still ends with the line "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". `scratch/overlaps.md` again finds no id that only an open revision defines, so that line should go. The description also still does not say which of #1137 and #1187 is rebased on the other; the two still conflict in `Suggested.lean`.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate** (my run at f8ae283): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL`. The six paths are those of R01. The worker's `gate.md` agrees and adds `build=0`.
- **Dependency check:** the output is `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or `moved:` line. The diff adds no supplier and no `*Needs:*` edge to another roadmap: the new Needs and Dependencies items are Mathlib's `Real.instFourierTransform` and `Real.fourier_eq'`.
- **Elaboration:** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` exits 0 in 19 s. The only diagnostics are the 15 `declaration uses sorry` warnings, at lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385 and 409. The last one moved from 408 because the docstring grew by one line.
- **Signatures:**
  - Since the file is a `module`, I appended `#check @` lines for all 18 declarations to a scratch copy of it. The copy elaborates.
  - The Lean diff touches only the docstring of `vonNeumannEntropy_strong_subadditivity`, so every elaborated type is the one the previous review compared with its README statement.
  - `scratch/signatures.md` reports no lost binder.
- **One-tactic probe:** no statement changed, so the previous probe stands: all 15 theorems fail `first | rfl | infer_instance | simp | trivial | decide`.

### The changed passages, one by one

- **Supplier contracts, From Mathlib** (lines 253–256). The kernel `exp(−2πi⟪v,w⟫)` is the one `Real.fourier_eq'` states at the pin (row 60).
- **D1.BorelPrefix** (line 1234). The old name `AddMonoidHom.continuous_of_measurable` does not resolve, because the lemma sits inside `namespace MeasureTheory.Measure`. The new name `MeasureTheory.Measure.AddMonoidHom.continuous_of_measurable` resolves. Its hypotheses are as the sentence describes, and the README's description matches the lemma's own docstring (row 59).
- **D2 worked example, the saddle flow** (lines 2028–2045). The new locator, Williams Example 3.32, pp. 96–97, states the same orbits and the same neighbourhood bases, under `r=exp(t)` (row 29).
- **D4.Harmonic Check on ℝ** (lines 2279–2283). In a scratch file at the pin, `𝓕 f w = ∫ x, f x * exp(I·(−2πw)·x)` elaborates from `Real.fourier_eq'`. So Mathlib's transform at w is this roadmap's `f̂(χ_(−2πw))` (row 33).
- **D4.Harmonic Needs, D4 Examples and D4 Dependencies** (lines 2330–2331, 2466–2467, 2481–2483). Each names `Real.instFourierTransform` and/or `Real.fourier_eq'`, and both exist at the pin. No `Real.fourierIntegral` remains anywhere in the folder (`grep` finds none).
- **D9 scaling sentence** (lines 3813–3817) and the `Suggested.lean` docstring (lines 401–408). Both were recomputed on GHZ at c=2 and on `|0⟩⟨0|⊗Φ⁺` at c=½. The values agree with the GHZ Check (rows 54 and 58).
- **References, Williams entry** (lines 4055–4056). Example 3.32 (pp. 96–97) is attributed to D2's worked example, and the example does lie in D2 (row 61).

### Library declarations opened at the pins

The pins are Mathlib 1b1ccf4b and Tau Ceti 2fd255d.

- **Mathlib, `Mathlib/Analysis/Fourier/FourierTransform.lean`:**
  - `Real.instFourierTransform` (line 428) is `VectorFourier.fourierIntegral 𝐞 volume (innerₗ V)`. It needs an inner product space V that is finite-dimensional and Borel.
  - `Real.fourier_eq` (line 434) is `𝓕 f w = ∫ v, 𝐞 (-⟪v, w⟫) • f v`.
  - `Real.fourier_eq'` (line 437) is `𝓕 f w = ∫ v, Complex.exp (↑(-2 * π * ⟪v, w⟫) * Complex.I) • f v`.
- **Mathlib, `Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean`:** `MeasureTheory.Measure.AddMonoidHom.continuous_of_measurable` is at line 79. Its source is a `SeminormedAddCommGroup` that is locally compact and Borel, and its target is a seminormed group with `NormedSpace ℝ`.
- **Tau Ceti, `TauCeti/Analysis/Matrix/Entropy.lean`:** `Matrix.vonNeumannEntropy` (line 88) is `re (cfc Real.negMulLog ρ).trace`. This gives `S(cσ)=cS(σ)−c·Trσ·log c` for positive semidefinite σ and c>0, the identity the D9 sentence uses.

### Seeded sample

- **"Worked example: the saddle flow"** (line 2028). It is changed, and I verified it against Williams, `williams-cpcsa-draft31` lines 6178–6198:
  - Printed p. 96 is at line 6145 and p. 97 at line 6191.
  - The action of the multiplicative positive reals is `r·(x,y)=(rx,r⁻¹y)`.
  - The orbits and the bases (a)–(c) are the README's (row 29).
- **"D5.Fields — the standard-fibre model as a measurable field".** It is untouched, so row 38 is carried. The Williams locators are still where the README cites them: Definition E.16 at line 23770, Theorem E.17 at line 23776 (H separable, X second-countable LCH) and Definition F.1 at line 23897.
- **"Concrete Cuntz families on separable Hilbert space".** It is untouched, so row 39 is carried. Cuntz 1977 is uncertified (see Not verifiable).
- The README flags no locator as unverified.

### Cross-roadmap citations and ownership

- The diff adds no cross-roadmap citation and no object that another roadmap could own.
- `scratch/citations.md` finds nothing unresolved.
- `scratch/overlaps.md` finds no dropped id and no id that only an open revision defines. The roadmaps closest in vocabulary are unchanged (#866, #1015, #1041, #1149, #1771).
- Main moved from 3090489 to f8836c4, and `git diff 3090489 origin/main -- TauCetiRoadmap/OperatorAlgebraDynamics` is empty.

### Headline theorems

No statement changed, so the previous review's list stands:

- **Stated (15):**
  - D1: the L¹ integrated form, pair recovery and full ideal exactness.
  - D1.CentralTwists: the projective integrated form.
  - D1.BorelPrefix: automatic continuity.
  - D2: amenable faithfulness.
  - D2.OrbitRepresentations: the commutant of an orbit representation.
  - D2.FreeGroups: the Powers partition, simplicity and the unique trace.
  - D4.Harmonic: both Fourier isomorphisms.
  - D4.LCAWeyl: the Weyl classification.
  - D6: the residue Cuntz family.
  - D9: strong subadditivity.
- **Named in the docstring as not statable, with the carrier each lacks:** the reduced and twisted crossed products, tensor products and Takai duality, Mackey, imprimitivity, groupoid algebras and `O_n`, the KMS simplex, Araki's `Ω^Q`, and CAR and Weyl algebras.

The three definitions keep real bodies. There is no padding.

### Adversarial table

- Rows marked "(carried, r34)" are carried from the previous report, for statements the diff leaves untouched.
- Rows 29, 33 and 54 are recomputed, and rows 58–61 are new, one for each changed statement.
- The sampled targets are rows 29, 38 and 39.
- The headline theorems are rows 1–3, 6, 14, 17, 19, 21–23, 31, 32, 35, 39 and 53.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` | ℤ counting; G trivial; non-separable H | `δ_0⊗a+δ_1⊗b↦π(a)+π(b)U`; `f(n)=2^(−\|n\|)a` has `‖f‖₁=3‖a‖`; trivial G gives `π(f(e))`; on each compact K the orbit `U·ξ` has compact range, so the integrand is strongly measurable on the σ-finite support | holds (carried, r34) | none |
| 2 | `exists_covariantRepresentation_integratedFull` | A=0; G trivial, A=ℂ²; L=0 | A=0 forces H=0 and π=0 is nondegenerate there; `(x,y)↦x` is recovered with π=L, U=1; L=0 on H≠0 is excluded by `hL` | holds (carried, r34) | none |
| 3 | `fullCrossedProductMap_exact` | G trivial; A=ℂ², I=ℂ⊕0; I=A | `0→I→A→A/I→0`; `C*(G)→C*(G)²→C*(G)`; quotient 0; `hker` forces the star subalgebra I to be `ker q`, an ideal | holds (carried, r34) | none |
| 4 | `CentralCocycle` | ℤ/2 with `ω(a,a)=−1`; `M_2` with `diag(1,−1)`; A=0 | at r=s=t=a both sides are −1; the `cocycle` field holds for `diag(1,−1)` but `diag(1,−1)E_12=E_12≠−E_12=E_12diag(1,−1)`, so only `central` fails; on `M(0)=0` all fields hold | holds, discriminating (carried, r34) | none |
| 5 | `CentralCovariantPair` | ℤ/2, `ω(a,a)=−1`, A=ℂ, π=id | `U_a=i` gives `U_a²=−1=ω(a,a)U_e`; `U_a=1` violates `projective` | holds (carried, r34) | none |
| 6 | `exists_centralIntegratedOperator` and twisted product | ω=1; the row-5 pair | ω=1 reduces to row 1; `T_(δ_a)²=−1=T_(ω(a,a)δ_e)`; in general `T_fT_g=∫π(∫f(r)α_r(g(r⁻¹s))ω(r,r⁻¹s)dr)U_s ds` | holds (carried, r34) | none |
| 7 | Twisted star `c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*)` | adjoint of `T_f` | `U_s*=U_(s⁻¹)π̃(ω(s,s⁻¹))*`, substitute `s↦s⁻¹` (factor c), then use `ω(s,s⁻¹)=α̃_s(ω(s⁻¹,s))` | holds (carried, r34) | none |
| 8 | `T_b` direction, lines 1143–1149 | ℤ/3, ω=1, `b(1)=i`, `b(2)=1` | `ω^b(1,2)=i`; `T_b(δ_1)T_b(δ_2)=iδ_0=T_b(iδ_0)`; the reversed map gives `−δ_0` against `δ_0` | holds (carried, r34) | none |
| 9 | `ψ_b` direction and `equivOfCoboundary` | same data | `(1,1)(1,2)=(i,0)` in `E_(ω^b)`, image `(i,0)`; reversed: `(−1,0)` against `(1,0)`; Tau Ceti `hc` gives `β=α^c` and `k_β→k_α` | holds (carried, r34) | none |
| 10 | Schrödinger phase, lines 1168–1179 | M=ℤ/3, x=(1,ψ) | `Π_x*δ_2=ζδ_0`, `Π_(−x)δ_2=δ_0`; `δ_x*=ζδ_(−x)`, `δ_x*δ_x=ζ·ζ²δ_0=δ_0`; the projective law gives `ψ(m)` | holds (carried, r34) | none |
| 11 | `λ^ω` and `V^ω` projective laws | ℤ/2, `ω(a,a)=−1` | `λ^ω_a²=−1`; both laws reduce to the cocycle at `(s,t,t⁻¹s⁻¹x)` | holds (carried, r34) | none |
| 12 | `W_bV^(ω^b)_sW_b*=Π̃(b(s))V^ω_s`, scalar case | general b | `b(r)ω^b(s,s⁻¹r)conj b(s⁻¹r)=b(s)ω(s,s⁻¹r)` | holds (carried, r34) | none |
| 13 | Trace, gauge and (ℤ/2)² Checks | (ℤ/2)², `(−1)^(ba′)`; ℤ/2 | `u²=v²=1`, `uv=u_(1,1)`, `vu=−u_(1,1)`, `τ=Tr/2`; `(x+α̂_γx)/2=x₀`; `(iu_a)²=1≠−1` | holds (carried, r34) | none |
| 14 | `continuous_of_measurable_monoidHom` | Williams D.11; Hamel map | D.11 hypotheses are separable metric groups with G Polish, as in the signature; a ℚ-linear ℝ→ℝ map that is not ℝ-linear is discontinuous, hence not Borel | holds (carried, r34) | none |
| 15 | `U(H)_s` metric and `E_ω` | dim H=1; ℤ/2 | metric `2\|z−w\|Σ2^(−k)\|h_k\|`; `(1,a)²=(−1,e)`, so order 4; `(i,a)²=(1,e)` | holds (carried, r34) | none |
| 16 | Weight projection `p_1` | weight k | `∫z̄z^kdz=δ_(k1)`; the z weight gives `V_sV_t=conj(ω)V_(st)`, so `C*(G,ω⁻¹)` | holds (carried, r34) | none |
| 17 | `injective_integratedFull_regular_of_amenable` | ℤ; F₂; `ρ=z⊕0` | `‖λ(f)‖=sup\|f̂\|`; for F₂, `χ_triv(h)=4` while Kesten gives spectrum of `λ(h)/4` in `[−√3/2,√3/2]⊆[−1,1−ε]`; a degenerate ρ adds a zero summand, same kernel | holds (carried, r34) | none |
| 18 | Unitary `L²(G,A)⊗_ρH≅L²(G,H)` | ℤ/2 swap on ℂ², `ξ=δ_a⊗e_1` | `⟨ξ,ξ⟩_A=e_2`, norm² `\|η_2\|²`; displayed map `η_2e_2`; the alternative `η_1e_1` is not isometric | holds (carried, r34) | none |
| 19 | `transitive_commutant_scalar` | ℤ/2 on {p,q}; F=∅; I=∅ | `(f(p)−f(q))T_pq=0` gives T diagonal and U-commutation makes it constant; F=∅ forces \|I\|≤1; I=∅ gives the zero space | holds (carried, r34) | none |
| 20 | Irrational rotation | `n·x=x−nθ`; `x+nθ` | `uvξ(n)=e^(2πi(x−(n−1)θ))ξ(n−1)`, `vuξ(n)=e^(2πi(x−nθ))ξ(n−1)`, so `uv=e^(2πiθ)vu`; the opposite rotation gives `e^(−2πiθ)` | holds (carried, r34) | none |
| 21 | `exists_powers_partition` | F={b}, L=2; F=∅, N=2; ℤ at N=3; N≤1 | `w=ab²`, `wbw⁻¹=aba⁻¹`; for f not a power of b, `b^Lfb^(−L)=b^(L+p)gb^(q−L)` stays reduced; `b^jD` have exactly j leading b's; ℤ fails by density (D has density ≥½, three translates); N≤1 is trivial | holds (carried, r34) | none |
| 22 | `reducedFreeGroup_isSimpleRing` | singleton basis; full `C*(F₂)`; algebraic ideals | `C(𝕋)` is not simple (excluded by `a≠b`); `u−1∈ker χ_triv`; a dense ideal contains an invertible element (`Units.oneSub`) | holds (carried, r34) | none |
| 23 | `reducedFreeGroup_trace_unique` | `τ(λ(g))`; C(𝕋) | `⟨δ_1,λ(g)δ_1⟩=[g=1]`; `hlam` gives `λ(g)δ_k=δ_(gk)`; every point evaluation of C(𝕋) is a trace | holds (carried, r34) | none |
| 24 | Powers estimate | de la Harpe line 488; N=1 | `‖(1/N)ΣX′_j‖≤‖X′‖/√N`, giving `2‖x‖/√N`; N=1 gives `2‖x‖`, weaker than trivial, as the Check says | holds (carried, r34) | none |
| 25 | BoundedSequenceTranslation | `E_ij`; even p; `M_fU^k` | `E_ijδ_n=[n=j]δ_i`; the opposite shift gives `δ_(2i−j)↦δ_i`; `UpU*=M_(1_odd)=1−p`; `f_k(i)=f(i)` | holds (carried, r34) | none |
| 26 | SequenceToeplitz | `e=M_(1_[0,∞))`; ℓ₊ | `eUeδ_n=δ_(n+1)`; `1−SS*` is the projection onto δ_0; `ℓ₊(α_kf)=ℓ₊(f)`; Prim is `{η}∪𝕋` with opens ∅ and `{η}∪O` | holds (carried, r34) | none |
| 27 | Convolution direction, lines 773–781 | ℤ/3 shift on ℂ³ | `(f*g)(2)=e_0α_1(e_2)=e_0`; the inverse convention gives `e_0e_1=0`; `π(e_0)U_1π(e_2)U_1=π(e_0)U_2` | holds (carried, r34) | none |
| 28 | Gram and induced-form signs, lines 883–893 | `M_2`, `E_11`, `E_12`; `−E_12`, `E_11` | entries `δ_ikδ_jl` give rank one `ww*`; the transposed matrix is the flip, with eigenvalue −1; induced form `0` against `−2` | holds (carried, r34) | none |
| 29 | Saddle flow, README lines 2028–2045 (sampled; previous R02) | Williams Ex. 3.32 at `r=exp(t)`; (1,1), (−1,−1), (1,−2); bases at the +x half-axis and at the origin | `r·(x,y)=(rx,r⁻¹y)` at `r=e^t` is `(e^t x,e^(−t)y)`; Williams lists the origin, four half-axes and two orbits per hyperbola `xy=b≠0` (lines 6179–6181), which are the README's four quadrant families with `r=\|xy\|`; basis (c) at `a_i` (lines 6194–6195) is small r on the two adjacent families, and basis (b) is all `a_i` plus small r on all four families; `{x>0,\|xy\|<ε}` is saturated, open and misses 0 | holds; locator present and correct (printed p. 96 at line 6145, p. 97 at line 6191) | none |
| 30 | `γ_H` modular factor | ax+b with dilations | `⟨f,g⟩*=Δ_H⁻¹γ_H⁻²Δ_G⟨g,f⟩` via s=th, so `γ_H²=Δ_G/Δ_H`; `Δ_H=1`, `Δ_G(a,0)≠1` | holds (carried, r34) | none |
| 31 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/2; ℤ; S₃ | `f̂=(f_0+f_1,f_0−f_1)`; `δ_1↦z`; `(f*)^=conj f̂`; `C*(S₃)=ℂ²⊕M_2` is not commutative | holds (carried, r34) | none |
| 32 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | ℤ; ν↦cν | `C*(𝕋)≅c₀(ℤ)` with the unitary at z going to `n↦zⁿ`; with cν, f represents what cf represents with ν | holds (carried, r34) | none |
| 33 | ℝ Fourier against Mathlib, lines 2279–2283 (previous R03) | f : ℝ → ℂ, w ∈ ℝ, in a scratch file at the pin | `Real.fourier_eq'` gives `𝓕 f w = ∫ exp(↑(−2π⟪v,w⟫)·I)•f v`, and on ℝ `⟪x,w⟫=xw`; `𝓕 f w = ∫ f x·exp(I·(−2πw)·x)` elaborates with exit 0, which is `f̂(χ_(−2πw))` for `χ_ξ(x)=e^(iξx)`; no `Real.fourierIntegral` remains in the folder | holds | none |
| 34 | Dual measure and inversion | order n; ℤ/3, f=δ_1 | `Σ\|δ̂_e\|²=n` against 1, so the dual is `(1/n)`·counting; `(1/3)Σχ(1−x)=[x=1]`, while `χ(x)` in place of `conj χ(x)` gives `[x=−1]` | holds (carried, r34) | none |
| 35 | `lcaWeyl_classification` | ℤ/2; ℤ/3; ℤ; E=0 | `U_aV_χU_a*=diag(−1,1)`; `U_1V_χU_1*=ω⁻¹V_χ` while `V_χU_1V_χ*=ωU_1`; `z^(−s)`; Williams Def. 4.26 `S_γR_s=γ(s)R_sS_γ` gives `conj χ(s)`; E=0 gives ι=∅ | holds (carried, r34) | none |
| 36 | Takai sign | ℤ/3 | `ρ_1e_t=e_(t−1)` from `ρ_sξ(r)=ξ(rs)` | holds (carried, r34) | none |
| 37 | One-unit groupoid | group G | `Δ^(1/2)`-dictionary: stars `Δ^(−1/2)conj f(s⁻¹)` on both sides; I-norm `max(‖f‖₁,‖Δ⁻¹f‖₁)`; `D=Δ` | holds (carried, r34) | none |
| 38 | D5.Fields Checks (sampled) | point; jump at ½; non-measurable S; zero fibres | `1_(x≥½)E_01` maps fibres into fibres; `E_10e_0=e_1∉span e_0`; `1_Se_0` is not measurable; 1 and `E_00` agree on `span e_0`; zero fibres give `L²(S)` | holds (carried, r34) | none |
| 39 | `exists_residue_family` (sampled) | n=1, 2; general n; shift | `S_0*b_3=0`, `S_1*b_3=b_1`, `ΣS_jS_j*b_3=b_3`; `S_i*S_jb_k=[(nk+j)%n=i]b_k`; `ΣS_jS_j*b_k=b_(n(k/n)+k%n)`; shift: `S_1*S_0=S_1*≠0` | holds (carried, r34) | none |
| 40 | Full-shift topology | n=2 | `shift^(m+1)(0^m10^∞)=0^∞`, so non-units converge to a unit; `shift(0^m10^∞)≠0^∞`, so `Z([0],1,0,X)` is not open in the subspace topology | holds (carried, r34) | none |
| 41 | Strong effectiveness Check | ℤ on `ℤ⊔{+∞}` | `(n,+∞)` is a limit of `(n,k)` with k→∞, so it is not interior to the isotropy; exactly three invariant opens | holds (carried, r34) | none |
| 42 | KMS sign | K=diag(0,1), `a=E_12`, `b=E_21` | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; opposite sign `e^β/(1+e^(−β))` | holds (carried, r34) | none |
| 43 | Araki, finite dimensions | `Q=−βP` | `Ω^Q=e^(−β(K+P)/2)/√Z_K`; `‖Ω^Q‖²=Z_(K+P)/Z_K≤e^(\|β\|‖P‖)`; `u_t=diag(1,e^(iβt))`; `Ad(u_t)τ_(−βt)=id` | holds (carried, r34) | none |
| 44 | Dyson cocycle ODE | inner dynamics | `Γ_s′=Γ_s·iτ_s(P)`; `u_t=Γ_(−βt)` gives `u_t′=u_t·iσ_t(Q)` with `σ_t(Q)=−βτ_(−βt)(P)` | holds (carried, r34) | none |
| 45 | CAR √(n+1) and h=ℂ | g⊥f | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `bb†g+b†bg=‖f‖²g/2`; `E_12e_1=0`, `ω₀(aa*)=⟨f,g⟩` | holds (carried, r34) | none |
| 46 | One-mode Bogoliubov | U=u, V=v·conj | `V*x=vx̄`; relations give `uv=0`, `\|u\|²+\|v\|²=1`; `(ca+sa*)²=cs·1` | holds (carried, r34) | none |
| 47 | Weyl on `ℓ²(V)` and spectra | f, g, v | `λ(f)λ(g)δ_v=e^(−iσ(f,g)/2)λ(f+g)δ_v`; spectrum 𝕋, so `‖W(f)−z‖=2` | holds (carried, r34) | none |
| 48 | Weyl domains and commutator | `D_F`; Schrödinger | `d/dt[φ(f−tg)e^(−itσ(g,f)/2)]=ψ`; `W(sf)W(tg)W(−sf)=e^(−istσ(f,g))W(tg)`, so `[Φ(f),Φ(g)]=iσ(f,g)`; `e^(isx)ψ(x+t)=e^(−ist/2)π(W(se_1+te_2))ψ` | holds (carried, r34) | none |
| 49 | Fock Weyl `W_F` | isometry; h=ℂ | the exponents sum to `⟨g,k⟩`; product phase `−iIm⟨f,g⟩/2`; `e^(−i/2)` and `e^(i/2)`; `⟨Ω,W_F(1)Ω⟩=e^(−1/4)`; derivative `i(v+w̄)/√2`; Attal at u=t/√2 gives `(w̄−v)/√2` | holds (carried, r34) | none |
| 50 | Moments and `D(A²)` | Gaussian; `c/(1+\|λ\|⁵)` | Gaussian fourth moment `3σ⁴=3/4`; `c=5sin36°/2π≈0.4677`; second moment `≈0.618`; fourth moment diverges | holds (carried, r34) | none |
| 51 | Jordan–Wigner; one-mode KMS | `h=ℂ²`; `h₀=ε` | `E_12σ_3=−E_12`, `σ_3E_12=E_12`; `ω(a*a)=1/(e^(βε)+1)` | holds (carried, r34) | none |
| 52 | Ising and on-site D9 Checks | ℤ; on-site h | `M_λ=\|h\|+2\|J\|e^λ`, `M_(λ,2)=\|h\|+8\|J\|e^λ`, bound at λ=1, d=2 is `(1/2)/(1+8e)=1/(2+16e)`; `s−βe=log 2coshβh=p` | holds (carried, r34) | none |
| 53 | `vonNeumannEntropy_strong_subadditivity` | GHZ; `\|0⟩⟨0\|⊗Φ⁺`; ρ_A in place of ρ_AB | `0+log2≤2log2`; equality `log2=log2`; `log2≤0` is false; the Lean partial traces trace out a then c (`ρ_B`), and c after regrouping by `prodAssoc.symm` (`ρ_AB`) | holds (carried, r34) | none |
| 54 | D9 scaling sentence, lines 3813–3817 (previous R04) | GHZ at c=2; `\|0⟩⟨0\|⊗Φ⁺` at c=½ | `negMulLog(cλ)=c·negMulLog(λ)−cλ·log c`, also at λ=0, so `S(cσ)=cS(σ)−c·Trσ·log c` (Tau Ceti `vonNeumannEntropy` is `re Tr cfc negMulLog`); GHZ, c=2: left `2log2−4log2=−2log2`, right `2·2log2−4log2=0`, as the GHZ Check says; c=½: the shift is `−2·½·log½=log2`, left `½·log2+log2=(3/2)log2` against direct `S(½ρ_ABC)+S(½ρ_B)=½log2+log2`, right `½·log2+log2` against direct `log2+½log2`; the old wording gave `2log2` for the left side | holds | none |
| 55 | Relative entropy calculus | `ρ_AB=¼·1`, `σ_B=½·1` | `log¼−log½=−log2`, and `−2log2+log2=−log2` | holds (carried, r34) | none |
| 56 | `modularCharacter` convention | Mathlib definition | `map(·g)μ=c(g)μ`, so `∫f(xg)dμ=c(g)∫f`; Williams gives `Δ(g⁻¹)`, so `c=Δ⁻¹` | holds (carried, r34) | none |
| 57 | `U_σ` left action, line 3380 | h=ℂ³, σ=(1 2), τ=(2 3) | `U_σU_τe_123=e_312=U_(στ)e_123`; `V_(στ)e_123=e_231⊥e_312` | holds (carried, r34) | none |
| 58 | `vonNeumannEntropy_strong_subadditivity` docstring, `Suggested.lean` lines 405–408 | GHZ at t=2 | per entropy `tS(σ)−t·Tr(ρ)·log t`, each side `t·(side)−2t·Tr(ρ)·log t`: `−2log2≤0`; the statement is unchanged and its `#check @` type matches r34 row 53 | holds | none |
| 59 | D1.BorelPrefix, line 1234: Mathlib `MeasureTheory.Measure.AddMonoidHom.continuous_of_measurable` | `#check @` at 1b1ccf4b; U(2); Hamel map ℝ→ℝ | the lemma resolves (`Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean` line 79, inside `namespace MeasureTheory.Measure`, lines 25–171) and needs `f : G →+ H` with G seminormed and locally compact and H a real normed space; in U(2), `diag(1,−1)` and the swap give products `±[[0,1],[−1,0]]`, so U(2) is not abelian and the lemma does not apply; with G=H=ℝ it makes the Hamel map non-measurable, as the README says | holds | none |
| 60 | Supplier contract, lines 253–256 | the kernel against the pin | `fourier_eq'`'s `Complex.exp(↑(−2π⟪v,w⟫)·I)` is `exp(−2πi⟪v,w⟫)`, as stated; the instance needs `InnerProductSpace ℝ V`, `FiniteDimensional ℝ V` and Borel V, all of which hold for V=ℝ | holds | none |
| 61 | References, Williams entry, lines 4055–4056 | heading positions | the worked example is at line 2028, inside D2 (D2 starts at line 1404 and D3 at line 2081), so "D2's worked example" is right; pp. 96–97 agree with row 29 | holds | none |

## Not verifiable

These sources are recorded as uncertified (paywalled) in the manifest, and I did not read them. They are cited by locator only, and none of them is cited by a changed passage:

- Bratteli–Robinson 1 and 2: §§5.2–5.3, Theorems 5.2.8, 5.3.30 and 5.4.4, and §6.2.
- Cuntz 1977, §1. The residue family is verified by computation (row 39), not against the text.
- Renault 1980.
- Brown–Ozawa, Proposition 5.1.3.

Rudin's *Fourier Analysis on Groups* has no manifest entry, so I could not read it. Theorems 1.5.1, 1.6.1 and 1.7.2 are cited only by untouched passages (lines 504 and 2242), and the Fourier convention they support is pinned by the Check in row 33 instead.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at Example 3.32, p. 96: the source says, in a sentence with no main verb, "Given" A and the right angles Q_i the relative topology of ℝ², then writes "The a basis"; it should read "Give A and the Q_i the relative topology of ℝ²" and "A basis"; affects nothing.
