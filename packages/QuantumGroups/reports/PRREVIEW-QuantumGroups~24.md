# Review of QuantumGroups (pull request #1649 at 9b3ff6c)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuantumGroups/` at `9b3ff6c`, the same head the previous review read. Nothing in the folder or outside it has changed since then. The gate passes, the dependency check is clean, `Suggested.lean` elaborates with four `sorry` warnings and nothing else, and every sampled locator is correct where the source is readable.

There are five findings:
- **One blocking (P2):** the C*-category, standard-solution, sign-map and trace-radical objects of Layer 0 are claimed by two open roadmaps as well as by §§0.1–0.2.
- **Four P3:** the previous review's #1705 conflict is carried forward; a Layer 4 ↔ Layer 6 *Needs:* cycle; Layer 8 sentences that ask for results the pinned Tau Ceti already proves; and two locator slips.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise.

## R01 (P2) — Layer 0's objects have second owners in CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras

**Location:** `:32–36`: "The general theory of C*-categories, their Karoubi completion, rigid C*-tensor categories, standard solutions, intrinsic dimension, unitary dual functors and signed self-dualities is owned later in the build by CategoricalOperatorAlgebras … §0.1 states only the instances this roadmap uses." The same pattern appears at `:41–44` for TemperleyLiebOperatorAlgebras.

**Claim:** §0.1 is not limited to instances. It constructs the general theory:
- `:181`: "construct the additive and dagger Karoubi completion and its universal property".
- `:189–193`: "In a rigid category with simple unit … define standard conjugate solutions … Construct them, prove uniqueness … the minimum of ‖R‖‖R̄‖".

§0.2 constructs the sign map `s:TL_n(−d)→TL_n(d)` (`:254–263`) and the identification of the trace radical with the negligible ideal (`:266–270`).

Two open roadmaps claim these same objects as their single home:
- CategoricalOperatorAlgebras (#888) says QuantumGroups consumes them from there.
- TemperleyLiebOperatorAlgebras (#867) says the sign isomorphism and the radical identification have their single home there and must not be restated.

QuantumGroups is on main, so it is earlier than both. Per the ownership rule, each open roadmap must cite it or narrow its statement. This README instead hands the theory to them while also building it, which leaves every one of these objects with two owners.

**Witness:**
- `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md:45–46` (#888): "single home here; QuantumGroups consumes CA1a and CA2a"; again at `:2303`.
- `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md:64,72–76` (#867): sign isomorphism and trace radical, "single home … do not restate them".

**Repair:**
1. Replace `:29–36` and `:37–44` with a single-owner statement: §0.1 is the home of C*-categories, their additive and dagger Karoubi completion, Hilb_f and the Hilbert-module category, conjugate and standard solutions, intrinsic dimension, the unitary dual functor and signed self-dualities. §0.2 is the home of the sign map over ℂ and of the trace-radical/negligible-ideal identification at Jones loop parameters.
2. State that CategoricalOperatorAlgebras CA1a–CA2a, and TemperleyLiebOperatorAlgebras 1.3 and 2.1, come later and consume §§0.1–0.2. TemperleyLiebOperatorAlgebras extends them to every commutative ring and every δ. #1705's Scope paragraph already makes the same choice.
3. Delete "§0.1 states only the instances this roadmap uses".
4. Add both roadmaps to `## Downstream consumers`.

For the worker: #888's `:44–46` and `:2303`, and #867's `:72–76`, must then cite QuantumGroups §§0.1–0.2. Those are their reviews' repairs.

## R02 (P3) — The conflict with #1705 has no stated order, and the description describes an earlier head

Carried from the previous review's R01. No repair report marks it not actionable, and the head is unchanged.

**Location:** this pull request's description (`scratch/pull-request.md`, data): "Current head `d7a6c540…`", "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged".

**Claim:** When two open pull requests change the same roadmap and their heads conflict, one must be rebased on the other, and the description must say which. The description must also describe the head under review. Neither holds. The two heads also disagree on R01's ownership question.

**Witness:**
- `roadmaps overlaps QuantumGroups`: "#1649 and #1705 conflict in README.md, Suggested.lean". #1705 is at `7c3e850`.
- #1705's Scope: "Section 0.2 is the single home of C*-categories … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 come later in the build and consume these objects". This head says the reverse (`:32–36`).

**Repair (for the worker, outside the folder):**
- Rewrite the description for `9b3ff6c`: §1.1 ClassicalMultipliers; Layer 0 moved down; Layer 8 on native `TauCeti.UqSl2`; the six-declaration `Suggested.lean`.
- State which of #1649 and #1705 is rebased on the other. Whichever merges second carries R01's single-owner Scope wording once.

## R03 (P3) — §4.3 cites §6.3, while §6.3 uses §4.3's theorem: a Layer 4 ↔ Layer 6 cycle

**Location:**
- `:916`, §4.3 *Needs:*: "…; §6.3 for the commutative reconstruction comparison."
- `:924`: "Only the comparison for an arbitrary commutative CQG uses §6.3".
- `:1117–1119`, §6.3: "Compare this reconstruction with Q4's single classical-group completion theorem A_u=A_r=C(G)".
- `:1132`, §6.3 *Needs:*: "§§6.1–6.2; CStarAlgebras C1 Gelfand duality; Layer 1 cancellation."

**Claim:** No statement in §4.3 needs §6.3. Its classical case is proved "here" from Haar's full support (`:898–901`), and "Q6 recovers the group …" (`:899–900`) only points ahead. The comparison is a target of §6.3, and §6.3 consumes §4.3's `A_u=A_r=C(G)`, but §6.3's *Needs:* line omits it.

As written, the *Needs:* edges are §4.3 → §6.3 and, through §6.3's text, §6.3 → §4.3. That is a target-level cycle, against the build order stated at `:165–170`. An implementer following §4.3's line waits on Layer 6.

**Witness:** the edge sets read from `:916`, `:1132` and `:1117–1119`. With §4.3 → §6.3 (from the *Needs:* line) and §6.3 → §4.3 (from the text), the graph restricted to {§4.3, §6.3} has a 2-cycle.

**Repair:**
- Delete "§6.3 for the commutative reconstruction comparison" from `:916`, and the last sentence of `:924`.
- Change `:899–900` to "§6.3 later compares this with the reconstruction of an arbitrary commutative compact quantum group".
- Add "§4.2 for the reconstructed completions and §4.3 for `A_u=A_r=C(G)`" to §6.3's *Needs:* at `:1132`.

## R04 (P3) — Layer 8 asks for results the pinned Tau Ceti already proves, without naming them

**Location:**
- `:1357–1358`, §8.2: "Prove the relations, simplicity, pairwise nonisomorphism and Schur endomorphism algebra ℂ."
- `:1382–1383`, §8.3: "Prove these scalars distinct for all (m,ε) under the stated generic hypothesis."
- Contrast `:59–60`: "Layer 8's prose is the specification those files implement and names their declarations".
- Also `:1268`: "Modules in this lane are algebraic modules".

**Claim:** These sentences restate theorems that exist at the Tau Ceti pin as open work and do not cite them. That contradicts the Scope's list of the Layer 8 items that "remain targets" (`:63–65`). The word "lane" is workflow vocabulary, not mathematics.

**Witness (Tau Ceti `2fd255d`):**
- `QuantumGroups/UqSl2/LadderModule/Basic.lean:407` `isSimpleModule`, `:583` `algebraMap_end_bijective` (Schur), `:616` `nonempty_linearEquiv_iff` (`L_m^ε≅L_n^δ` iff `m=n`, `ε=δ`).
- `QuantumGroups/UqSl2/Casimir/Basic.lean:284` `casimirScalar_units_mul_pow_inj`.

**Repair:**
- At `:1357–1358`, write: "simplicity, Schur's lemma and pairwise nonisomorphism are `TauCeti.UqSl2.LadderModule.isSimpleModule`, `TauCeti.UqSl2.LadderModule.algebraMap_end_bijective` and `TauCeti.UqSl2.LadderModule.nonempty_linearEquiv_iff`".
- At `:1382–1383`, write: "these scalars are pairwise distinct, `TauCeti.UqSl2.casimirScalar_units_mul_pow_inj`".
- At `:1268`, replace "in this lane" with "in this layer".
- Check the other imperative sentences of §§8.1–8.4 against the pin the same way.

## R05 (P3) — Two locator slips: Bédos–Murphy–Tuset page range in §5.1, and Timmermann Prop 2.2.4 in References

**Location:**
- `:963`, §5.1 *Needs:*: "Bédos–Murphy–Tuset §2, pp.12–14".
- `:1659`: Timmermann "Proposition 2.2.4 and Remark 2.2.2(iv)(c), pp.50–51". `:1670`, inside the Bédos–Murphy–Tuset bullet: "Timmermann Proposition 2.2.4, pp.49–51".

**Claim:**
- Page 12 of `bmt` is the proof that the reduced quantum group's coproduct extends through the unitary `W(a⊗b)=Δ(b)(a⊗1)` (`bmt` lines 512–530), not SUq(2). The SUq(2) fundamental matrix, monomial basis and Theorem 2.12 are on pp.13–14 (`bmt` lines 586–646).
- The same proposition is given two page ranges, and the second sits in the wrong bibliography entry.

**Witness:** `bmt` line 512 (page 12 begins with the reduced quantum group and its regular unitary); `bmt` lines 592–605 (page 13: SUq(2), `U=[[α,−qγ*],[γ,α*]]`). `:1659` and `:1670` contradict each other.

**Repair:**
- At `:963`, write "Bédos–Murphy–Tuset §2, pp.13–14".
- Move the Timmermann sentences of `:1670–1673` into the Timmermann bullet, with one page range for Proposition 2.2.4.

## Previous findings

- R01 of the previous review (#1705 conflict, stale description): **not repaired**. The description still opens "Current head `d7a6c540…`", and #1705 (`7c3e850`) still conflicts in both files. Carried as R02.
- The previous review's remark on §4.3 ↔ §6.3 is raised here as R03. A full review found that §6.3's text does use §4.3, so the cycle is real.

## Verified sound

**Gate.** Rerun on this head: every scanner 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.

**Dependency check** (the required command, output unmodified):

```text
depcheck: 235 roadmaps, 2263 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. QuantumGroups is on main, and every supplier it names is on main (`3090489`): CStarAlgebras, VonNeumannAlgebras, HilbertModules, TemperleyLieb, Subfactors, OperatorTheory/SelfAdjointSpectralTheory, RepresentationTheory/CompactGroups and /LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups and PivotalSpherical. It cites nothing from CategoricalOperatorAlgebras or TemperleyLiebOperatorAlgebras.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`) and nothing else. A scratch file with `#check @name` for all six declarations gives types identical to `scratch/signatures.md`. The flagged binder `[StarModule ℂ A]` is absent from `AlgebraicHaar`, but none of its fields uses it. The four theorems carry `StarModule` and `TauCeti.StarCoalgebra` explicitly. `compactType_iff` has `[Nontrivial A]`, which the zero ring requires (row 2).

**Padding probe.** `simp`, `rfl`, `infer_instance` and `trivial` were each tried on all four theorems in scratch copies. All 16 attempts fail (`simp made no progress`, `rfl failed`, `type class instance expected`, `assumption failed`). `unitaryCoefficientSet` and `AlgebraicHaar` are the two definitions the headlines need. There is no padding.

**Headlines.**
- Stated: weighted Schur orthogonality (§3.1); compact type (§4.1); the modular automorphism and the Kac equivalence (§4.1).
- Not statable, and named in the docstring with what they lack: Layers 0–2, the rest of Layers 3–4, and Layers 5–7. Neither pin has a C*-tensor product: a grep of both for minimal or spatial C*-tensor products and C*-algebra tensor instances finds none.
- Layer 8: proved at the pin, except the Biedenharn–Elliott pentagon and §8.6, which the docstring explains.
- Every Lean name appears in the README (`:578–579`, `:765–766`, `:800`, `:804`).

**Seeded sample, locators read in the cached texts:**

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 0.2 | Neshveyev–Tuset §2.5, pp.52–54 | `nt` lines 2408–2517 (printed p = PDF p − 4) | `R̄=−τR`, (2.5.1) `−τ(R*⊗ι)(ι⊗R)=ι`, so their τ = −ε; Lemma 2.5.1 projections and TL relations; Example 2.5.2 `F F̄=−τ1`. Correct |
| 1.1 | Kustermans–Vaes Def. 2.1, p.853 | `kustermansvaes` lines 739–744 | bi-C*-algebra: nondegenerate Δ into M(A⊗A), coassociative. Correct |
| 1.2, 2.1–2.3, 3.1, 3.3, 3.4 | Timmermann | — | uncertified, see Not verifiable; mathematics recomputed (rows 8–15) |
| 4.1 | Neshveyev–Tuset Thm 1.6.6 p.18, Thm 1.7.3 p.22, Prop 1.7.7 p.23 | `nt` lines 810–812, 977–978, 1036–1040 | hypotheses "generated as an algebra by unitary coefficients" (weaker than spanning); `h(ab)=h(bσ_(−i)(a))`, `σ_z=f_(iz)*·*f_(iz)`; (ii)⇔(iii). Correct |
| 5.1 | Bédos–Murphy–Tuset §2, pp.12–14 | `bmt` lines 512–646 | p.12 off by one (R05); pp.13–14 correct |
| 6.1, 6.2 | Malacarne Thm 4.1 pp.5–6; Lemmas 1.2, 2.1, 3.1 | `malacarne` lines 285–291, 127, 183, 235, 126 | essentially small, with conjugates, closed under sums/subobjects; `I_(n+1)∩A_n=I_n`; `A/I_F≅C[O_F^+]`. Correct |
| 7.1 | Bédos–Murphy–Tuset Thm 2.12, Cor 2.13, pp.13–14 | `bmt` lines 592–646 | 0<\|q\|<1; `T_k=U_k*D_k`, D−1 compact. Correct |
| 7.2, 5.2 | Banica Prop 1, Lemma 1, Prop 2, Thm 1, pp.1–4 | `banica` lines 42–75 | `E(1)=ΣF_ji e_i⊗e_j`, `(E*⊗1)(1⊗E)=c`, `β=c⁻²‖E(1)‖⁴`. Correct; n≥2 restriction justified (Source issues) |
| 8.1, 8.6 | Virelizier §2.3, Prop 2.4, p.8 | `virelizier` lines 348–359 | `ΔE=K⊗E+E⊗1`, `ΔF=1⊗F+F⊗K⁻¹`, `S(E)=−K⁻¹E`, `S(F)=−FK`, `S²=K⁻¹·K`. Correct |
| 8.3 | Virelizier Thm 3.13, Cor 3.14, p.13 | `virelizier` lines 625–636 | category F splits into the L(n). Correct |
| 8.7 | Virelizier Ex. 3.3, p.11 | `virelizier` lines 552–555 | `Fv_i=v_(i+1)` normalization; rescaling by `[i]!` gives the README ladder. Correct |
| 0.1 | Longo–Roberts §2 pp.4–5, Lemma 3.3, Thms 3.8, 3.11, App. pp.48–49 | `longoroberts` lines 121–135, 389, 621, 681–683, 2000 | Thm 3.11: `R*R·R̄*R̄≥d²`, with equality iff a multiple of R is standard, as the README states. Correct |
| 3.3 refs | Neshveyev–Tuset §2.2 pp.29–36; EGNO §§5.1–5.3 | `nt` line 31; `egno` lines 160–162 | Correct |

**Adversarial pass** (q = 1/2 unless stated; `F̃=F=diag(2,1/2)` on the SUq(2) fundamental matrix `u=[[a,−qc*],[c,a*]]`):

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | `schur_orthogonality` | SUq(2); 1-dim character; ι=∅; the transposed (wrong) Ft | (1): `h(a*a)=1/5=(1/2)/(5/2)`, `h(c*c)=4/5=2/(5/2)`, `h(u₁₂*u₁₂)=q²h(cc*)=1/5`, `h(a*c)=0=(F̃⁻¹)₁₂`. (2): `h(aa*)=4/5=F̃₁₁/tr`, `h(a*a)=1/5=F̃₂₂/tr`. `tr F̃=tr F̃⁻¹=5/2`; `Σ_j h(u_ij u_ij*)=1=h(1)`. Character: Ft=1; Ft=2 fails `2≠1/2`. ι=∅ is excluded by `IsSimpleOrder` (⊥=⊤) | pass | none |
| 2 | `compactType_iff` | zero ring; ℂ; ℂ[x] with x primitive; ℂ[ℤ] with u*=u | zero ring: LHS false (`h(1)=h(0)=0≠1`), RHS true (span=⊤) → `[Nontrivial A]` needed and present. ℂ: both true. ℂ[x]: `(id⊗h)Δx=x+h(x)≠h(x)1`, only unitary grouplike is 1 → both false. ℂ[ℤ], u*=u: `h((u−u⁻¹)²)=−2<0`, unitary coefficients only from weight 0 → both false | pass | none |
| 3 | `haar_modular_automorphism` | SUq(2); inverse convention; ℂ[S₃]; ℂ[C₂] with u↦−u | `θ(a)=F₁₁aF₁₁=4a`, `θ(c)=F₂₂cF₁₁=c`; `h(aa*)=4/5=h(a*θ(a))=4·1/5`; `θ⁻¹`: `1/20≠4/5`. ℂ[S₃]: θ=id. ℂ[C₂]: `h(u·u)=1`, `h(u·(−u))=−1`, so only θ=id. Uniqueness from `h(x*x)>0` (Cauchy–Schwarz plus a nondegenerate integral) | pass | none |
| 4 | `haar_trace_iff_antipode_involutive` | SUq(2); ℂ[S₃]; q=1 | SUq(2): `h(aa*)=4/5≠1/5=h(a*a)` and `S²(c)=q²c=c/4≠c`: both false. ℂ[S₃]: `δ_(gk,e)=δ_(kg,e)`, `S²=id`: both true, which excludes the wrong model "iff commutative". q=1: both true | pass | none |
| 5 | `unitaryCoefficientSet` | n=0; ℂ[C₂] | n=0 contributes no entry; for u grouplike, `u*u=u²=1` puts u in the set; standard basis of `Fin n→ℂ` is orthonormal | pass | none |
| 6 | §0.2 sign map, closure | TL₁, TL₂; ε=±1; d=3/2 | `T₁^(d)(1)=d=−T₁^(−d)(1)`; `T₂^(d)(−e)=−d=(+1)T₂^(−d)(e)`; `R₂*(εRR*⊗1)R₂=εd=ε²T₂^(εd)(e)`; `Φ(cup)†=R*=ε·(εR*)`. d=3/2: `[2..5]=3/2,5/4,3/8,−11/16` | pass | none |
| 7 | §1.1 diagrams | S₃; ℤ; ℤ×ℤ | gh=(12)(23)=(123): `Δf(g,h)=1`, `Δf(h,g)=f((132))=0`. `Δ1[0](N,−N)=1` not C₀; `r₊(1[1]⊗1[−1])(g)=1[g=1]`, `d(a⊗b)=0`; `H=1[m+n=0]` slices of norm 1 | pass | none |
| 8 | §1.2 Haar, cancellation | C(C₂); monoid {1,0}; ℤ | `h(1[e])=1/2` vs evaluation 1; span `{δ_(1,1),δ_(1,0),δ_(0,0)+δ_(0,1)}` has dim 3<4; `W(λ₁⊗1)W*(δ₁⊗δ₂)=δ₂⊗δ₃` | pass | none |
| 9 | §2.1 coefficient order | S₃ permutation; C₂ sign | `u₁₃(gh)=[1=(123)(3)]=1`, `u₁₃(hg)=0`; tensor square 1 vs direct-sum character −2 | pass | none |
| 10 | §2.2 unitarization | `U=[[1,2],[0,−1]]` | `U²=I`; `U*U=[[1,2],[2,5]]`; `T=[[1,1],[1,3]]`, det 2; `U*TU=[[1,1],[1,3]]` | pass | none |
| 11 | §2.3 regular | C₂; S₃ | 1+1=2; 1+1+4=6 | pass | none |
| 12 | §3.1 `ū*F̃ū=F̃` | SUq(2) | (1,1): `2aa*+½cc*=2−½c*c+½c*c=2`; (2,2): `2q²c*c+½a*a=½`; (1,2): `−ac+½ca=0` (ac=½ca) | pass | none |
| 13 | §3.2 characters, Plancherel | SUq(2); Vandermonde | `f_z(a)=2^z`, `f₁*f₁(a)=4=f₂(a)`; `‖a+c‖²=(½+2)/(5/2)=1`; `ε∘θ(u)=F²=f₂(u)`; `det[[1,1],[1,4]]=3` | pass | none |
| 14 | §3.3 traces, metrics | SUq(2) | `tr(F diag(1,0))=2`, `tr(F⁻¹diag(1,0))=1/2`; `S²(u)=FuF⁻¹`: `(FuF⁻¹)₂₁=c/4`; double-dual metric `(FuF⁻¹)*F⁻²(FuF⁻¹)=F⁻¹u*uF⁻¹=F⁻²`; `j=can∘F`, `j*F⁻²j=I` | pass | none |
| 15 | §3.4 σ, τ, KMS | SUq(2) | `σ_(−i)(a)=4a`; `τ_(−i)(c)=½c½=c/4=S²(c)`; `σ_t(c)=2^(−it)2^(it)c=c`; V10.KMS `F(t+i)=φ(yα_t x)` gives `h(ab)=h(bσ_(−i)a)` | pass | none |
| 16 | §4.2 regular unitary | ℤ; ℂ; C₂ | `U(δ₁⊗δ₂)=δ₁⊗δ₃`; both pentagon words: (1,2,3)→(1,3,6); `U(λ_s⊗1)U*=λ_s⊗λ_s`; `‖1+u‖=2`, Haar norm √2 | pass | none |
| 17 | §4.3 coamenability | ℤ; F₂ | Følner `2/(2N+1)`; `2√3<4=ε(Σ)`; Bédos–Murphy–Tuset 2.2, 2.8, 2.9, 3.6 as cited | pass | R03 (Needs only) |
| 18 | §5.1 presentation | general q; q=1/2 | `u*u=I` ⇔ `a*a+c*c=1`, `ac=qca`, `q²cc*+aa*=1`; `uu*=I` ⇔ `aa*+q²c*c=1`, `ac*=qc*a`, `cc*+a*a=1`; `Δ(c)=c⊗a+a*⊗c`; `S(c)=−c/2`, `S(c*)=−2c*`; a=0, c=1: `aa*+q²c*c=1/4` | pass | R05 (locator) |
| 19 | §5.2/§7.2 O_F^+ | `F=[[0,1],[−2,0]]`; I₂; n=1 | `FF̄=−2I`; `E=−2e₀⊗e₁+e₁⊗e₀`, `‖E‖²=5`; `β=25/4=d²`; `J(e₀)=−√2e₁`; dims 1,2,3,4 vs 1,5/2,21/4,85/8; `VI₂Vᵗ=[[0,1],[1,0]]` (q=−1); n=1: `u=u*`, `u²=1` | pass | none |
| 20 | §6.1/6.2 reconstruction | Rep(S₃); H=ℂ | 1+1+4=6 vs 4 diagonal; `dim A_(≤1)=2` | pass | none |
| 21 | §6.3 commutative | C(C₂); monoid {1,0} | `0·1=0·0`, 1≠0: not cancellative; Haar ½,½ | pass | R03 (Needs only) |
| 22 | §7.1 Haar | q=1/2; q=±1; q=−1 model | `(1−q²)Σq^(4j)=4/5`, `(1−q²)/(1−q⁶)=16/21`; endpoints `∫t=1/2`, `∫t²=1/3`; model: `a*a+c*c=(1−t)I+tI`, `σ₃σ₁=−σ₁σ₃` gives `ac=−ca`, `ac*=−c*a`; t=0, z=1 on the σ₃=+1 line: a↦1, c↦0 | pass | none |
| 23 | §8.1 conventions | L₁⁺; Ore | `EF−FE=diag(1,−1)=(diag(½,2)−diag(2,½))/(−3/2)`; `KF=4FK`; at q=0 `E=K⁻¹·0=0` | pass | none |
| 24 | §8.2 ladders | L₂⁺; L₁⁻ | weights `1/4,1,4`; F coefficients `1,5/2,0`; E coefficients `0,5/2,1`; `[2]−[0]−[−2]` gives `5/2,0,−5/2`; L₁⁻ `EF−FE=diag(−1,1)`; matches the pin's `LadderModule/Basic.lean` action | pass | R04 (cite) |
| 25 | §8.3 Casimir | L₀,₁,₂^± | `10/9,17/9,65/18` and negatives, all distinct; L₁⁺: `FE+toral=diag(0,1)+diag(17/9,8/9)=(17/9)I`; `EF^(m+1)w=0` gives `K²=q^(2m)` | pass | R04 (cite) |
| 26 | §8.5 Clebsch–Gordan | m=n=j=1; r=2 | `α₁=−δq[1]/[1]=−½`; `ΔE(v₀⊗v₁−½v₁⊗v₀)=½v₀⊗v₀−½v₀⊗v₀=0`; `q[2]=5/4=1+q²`; `tr K^(±1)` on L₁⁺ is 5/2, on L₀⁻ is −1 | pass | none |
| 27 | §8.6 compact form | m=1 | `h₁=[1]/([1]q⁻¹)=½`; `KF=2F`; orthonormal E entry `√2=q^(−1/2)`, F entry `1/√2=q^(1/2)`, matching the pairing | pass | none |
| 28 | §8.7 classical | v=1, m=2 | `[E,F]=diag(2,0,−2)`; `[2]_v=v+v⁻¹→2` vs totalized `0` | pass | none |
| 29 | Layer 0 ownership (R01) | §0.1 vs CA1a/CA2a; §0.2 vs TLOA 1.3/2.1 | objects in both: Karoubi completion, Hilb_f, standard solutions, intrinsic dimension, signed self-duality; `s(e_i)=−e_i` over ℂ ⊂ every ring; `R_n=negligibleIdeal(n,n)` | fail | R01 |
| 30 | Build order (R03) | §4.3, §6.3 | edges §4.3→§6.3 (`:916`), §6.3→§4.3 (`:1118`) | fail | R03 |

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`):
- Tau Ceti:
  - `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean`, class `comul_star`); `TauCeti.StarCoalgebra.counit_star` (`:91`).
  - `TauCeti.Comodule.coefficientMatrix` (`Comodule/MatrixCoefficient/Matrix.lean:69`), with `coact_basis_eq_sum_coefficientMatrix` (`:110`, `δ(e_j)=Σ_i e_i⊗u_ij`) and `comul_coefficientMatrix_eq_sum` (`:118`), matching the Conventions.
  - `TauCeti.HopfAlgebra.antipode_bijective` (`HopfAlgebra/Star.lean:85`); `comulMulRightEquiv` (`Cancellation.lean:72`); `leftMulComulEquiv` (`:149`).
  - `TauCeti.IsGenericQuantumParameter` (`QuantumInteger/Basic.lean:33`, "q≠0 ∧ q^n≠1 for n>0", as in the Layer 8 intro).
  - UqSl2 `instStarRing` (`Star.lean:156`, `[Fact (IsSelfAdjoint q)]`) and `instStarCoalgebra` (`:202`, `[Fact (q≠0)]`); `casimir` (`Casimir/Basic.lean:65`); `LadderModule` (`LadderModule/Basic.lean:86`, action as §8.2).
  - All 62 backticked `TauCeti.*` names and the 49 unprefixed Tau Ceti names in the README exist (declaration grep), including `FDRep.ofShrink` (`RepresentationTheory/FDRep/Basic.lean:314`).
  - `IsLinearlyReductive.iSup_matrixCoefficientSubmodule_eq_top` (`Comodule/LinearlyReductive/Cosemisimple.lean:47`) gives spanning only. Its docstring says independence is not proved, and no Hopf integral exists at the pin, so `AlgebraicHaar` duplicates nothing.
- Mathlib: `PositiveLinearMap.GNS` and `gnsStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`); `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` (`Analysis/InnerProductSpace/Spectrum.lean:436`) and `finite_dimensional_eigenspace` (`:456`); `HopfAlgebra.antipode_mul_antidistrib` (`RingTheory/HopfAlgebra/Convolution.lean:63`); `WithConv` (`Algebra/WithConv.lean:28`); `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`); `SkewPolynomial` (`Algebra/SkewPolynomial/Basic.lean:95`); `Rep.equivalenceModuleMonoidAlgebra` (`RepresentationTheory/Rep/Iso.lean`).

**Cross-roadmap citations resolved on main (`3090489`):**
- CStarAlgebras: `C1.CommutativeMultiplierMorphisms` §1.8 (`:497`); C1.7 (`:468`); C2.1 (`:544`); C4.1 (`:986`); C5.2 (`:1143`, `C₀(X)⊗min A≅C₀(X,A)`, compact `C(X×Y)`, as §1.1 says); C8.4 Toeplitz (`:1676`).
- VonNeumannAlgebras: Layer 0 (`:275`), Layer 1 (`:392`), Layer 3 (`:905`), V4.Core (`:972`), V4.PositivePredual (`:1059`), V4.Normality (`:1124`), V10.ModularTheory (`:2364`), V10.KMS (`:2459`, existence and uniqueness for faithful normal states), Layer 11 (`:2785`, full left Hilbert algebras, Tomita, canonical weight).
- HilbertModules: H1–H3 (`:126`, `:179`, `:262`).
- TemperleyLieb: Layers 2, 4, 6, 7 (`:333`, `:545`, `:680`, `:767`), with `TLCat.lift` and `TLCat.lift_unique` (`:459`) and the negligible ideal (`:720`).
- Subfactors: 3.1–3.3 (`:676`, `:697`, `:774`); `jonesLoopParameters` and `markovTrace_nonneg_iff` (`Suggested.lean:58`, `:67`).
- Others: OperatorTheory/SelfAdjointSpectralTheory Part B (`:252`); CompactGroups SU(2) (`:390`, `su2Irrep`); LieHighestWeight sl₂ worked example (`:1536`); OperatorAlgebraDynamics D1 (`:148`) and D2 (`:221`, Reiter P₂ `:258–261`); FreeProbability F1, F3, F6 (`:127`, `:255`, `:532`); AmenableGroups Layers 1, 5, 7 (`:98`, `:289`, `:415`); PivotalSpherical Layers 0–2 and 7 (`:257`, `:283`, `:318`, `:477`).
- Downstream: QuantumEnvelopingAlgebras cites "Q8 item 1" with the same Hopf convention (`:181–184`); HopfologicalAlgebra cites "Q8 item 5" (`:165`, `:319`). Both resolve to §§8.1 and 8.5.

**Ownership and overlaps.**
- `roadmaps grep` across all open heads for compact quantum group, Woronowicz, SUq(2), free orthogonal, `U_q(sl`, Kac and coamenability finds owners only in QuantumGroups (#1649, #1705, main). The exceptions are CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras for Layer 0's objects (R01).
- NoncompactQuantumSymmetry (#1015) owns no compact quantum group or locally compact quantum group object.
- No other roadmap declares a `TauCetiRoadmap.QuantumGroups.*` name.
- `scratch/overlaps.md`, rerun: no dropped ids either way, and no id defined only by an open revision. The only item is #1705 (R02).

**Shape.** Every subsection has an API list and at least three Checks (counts 7, 5, 5, 3, 3, 3, 3, 4, 3, 3, 3, 5, 3, 3, 3, 3, 3, 3, 3, 3, 3, 5, 3, 3, 4, 4, 3, 3 for §§0.1–8.7). Every layer ends with Examples and Dependencies. The Dependencies paragraphs match their *Needs:* lines (rows 1–5 of the previous report, unchanged). There is no LaTeX, `lemma`, `set_option` or pull-request number. The only process word is "lane" (R04).

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008), recorded `uncertified`. The locators of §§1.2, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 3.4, 4.1 (Prop 2.2.4, Remark 2.2.2(iv)(c), Thm 3.2.12), 5.1 and 7.1 (Chapter 6 §2) are cited by locator only. Their mathematics was recomputed (rows 8–18 and 22), and §§3.2–4.1 were cross-checked against `nt` Theorems 1.6.6 and 1.7.3 and Proposition 1.7.7.

## Source issues

- **Misprint** in banica at Theorem 1, printed p.2: the theorem is stated for every n ∈ ℕ with `F F̄=c`; it should require n ≥ 2, as the abstract says, since at n=1, `A_o(F)=C*(ℤ/2)` has only two irreducibles; affects nothing.
