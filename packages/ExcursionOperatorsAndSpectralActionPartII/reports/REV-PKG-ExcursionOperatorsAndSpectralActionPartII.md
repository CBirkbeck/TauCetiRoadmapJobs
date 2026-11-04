<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1289#issuecomment-6391483940 -->
Review (claude) of af07bf6

Verdict: needs changes

1. **F01** (P1) The base roadmap of this Part II exists nowhere

   - **Location.** `packages/ExcursionOperatorsAndSpectralActionPartII/README.md:7`: "This Part II begins where the base direction, ExcursionOperatorsAndSpectralAction, stops: the spectral-to-geometric-to-smooth centre map, its Hecke compatibility and the parameter of an irreducible representation are inputs."
   - **Claim.** A base roadmap ExcursionOperatorsAndSpectralAction exists, and its end point fixes this roadmap's scope.
   - **Witness.** There is no `TauCetiRoadmap/ExcursionOperatorsAndSpectralAction` on main (`TauCetiRoadmap/` or `Completed/`), in the 344-entry open-PR index, in the board packages or their index, or in `merge-order/ORDER.txt`. `roadmaps grep` finds the name only as a citation inside other roadmaps (HeckeStacksAndLocalShtukas README:23, LanglandsParameterStacks README:19).
   - **Repair.** Delete the framing clause "This Part II begins where the base direction, ExcursionOperatorsAndSpectralAction, stops". Replace it with a sentence that names the actual suppliers of each input, which depends on how R02 is resolved. Never cite ExcursionOperatorsAndSpectralAction as a supplier or as a base. The roadmap name ("…PartII") belongs to the job, so the maintainer decides whether to keep it. A "Part II" with no Part I contradicts the principle that "an extension in an existing roadmap's direction is '<that roadmap>, Part II'".

2. **F02** (P1) gap:geometric-spectral-centre goes to a supplier whose own scope excludes it, so Ψ_G is unowned

   - **Location.** `README.md:75`: "What HeckeStacksAndLocalShtukas must provide (gap:geometric-spectral-centre): Specialize the abstract excursion centre map of LanglandsParameterStacks LP2e.15 to the actual lisse geometric Hecke action, restrict it to each basic smooth stratum to obtain Ψ_G…"
   - **Claim.** HeckeStacksAndLocalShtukas can own the construction of Ψ_G, the common spectral action and the FS parameter of an irreducible.
   - **Witness.** HeckeStacksAndLocalShtukas README:23 assigns spectral Bernstein centres to ExcursionOperatorsAndSpectralAction, and its README:2584 says excursion algebras and spectral centres are separate from its targets. LanglandsParameterStacks README:24 builds no Bernstein centre, and its README:602 leaves "the Bernstein-centre application" to consumers.
   - **Repair.** No eligible supplier owns Ψ_G. Of the two options, only (b) can be carried out by the fix worker:
     - (a) The maintainer creates the base roadmap first and points this gap at it.
     - (b) This roadmap owns the specialization. Add a new first layer ("The Fargues–Scholze centre map") with these targets:
       - the specialization of LP2e.15 to the HeckeStacksAndLocalShtukas HS1 Hecke action on `D_lis(Bun_G)`;
       - its restriction to the basic strata, giving Ψ_G (FS24 Proposition I.9.3, p. 35, FS24 line 1282);
       - the basic-inner identification;
       - the continuous semisimple parameter of an irreducible (FS24 §IX, with exact locators).

     Under (b), delete gap:geometric-spectral-centre from the README and from the plan's `gaps`, and replace every `gap:geometric-spectral-centre` in the `*Needs:*` lines of §§1.2, 1.4, 1.5, 3.3, 4.3, 5.2 with the new local sections.

3. **F03** (P1) gap:normalized-spectral-levi cannot be stated by SmoothRepresentationsOfLocalGroups

   - **Location.** `README.md:65`: "…provide the centre restriction and constant-term pairing for normalized induction and its compatibility with the common geometric spectral action…". Also `README.md:59`, which lists "Bernstein restriction" as consumed from "§§SR.0.4, SR.1.1, SR.2.2, SR.3.1–SR.3.3".
   - **Claim.** SmoothRepresentationsOfLocalGroups (ORDER line 26) can provide compatibility with the geometric spectral action, and its sections already contain the restriction `r_M` of the Bernstein centre.
   - **Witness.** SmoothRepresentationsOfLocalGroups README:101 excludes the geometric Hecke action and "its map to the smooth center". Their owners come later in the order (ORDER lines 75, 243). §SR.3.2 gives only the scalar action on `i_P(π)`, not `r_M`.
   - **Repair.** Split the gap:
     - Keep on SmoothRepresentationsOfLocalGroups (§SR.3.2) only this: "For every rational Levi M of G over E, provide the Bernstein-centre restriction `r_M:Z(G)→Z(M)` with `z·i_M^G(Θ)=i_M^G(r_M(z)·Θ)` and the constant-term identity `(z*f)_M=r_M(z)*f_M` (BDK86 §2.4, as cited at H26 line 192)."
     - Move "compatibility with the common geometric spectral action, `r_M(Ψ_G(a))=Ψ_M(res a)`" to the owner chosen in R02 (FS24 §IX.7.2, cited at H26 line 128).
     - In README:59, change "irreducible scalar actions and Bernstein restriction" to "irreducible scalar actions; Bernstein restriction is the gap below".

4. **F04** (P1) gap:stable-character-harmonic-analysis forces SmoothRepresentationsOfLocalGroups to consume EndoscopicTransferAndUnitaryTraceComparison, a cycle

   - **Location.** `README.md:61` and `README.md:63`: "This contract belongs to the character-theory continuation of §§SR.3.1–SR.3.3."
   - **Claim.** SmoothRepresentationsOfLocalGroups can state the stable items: separation of unstable functions, stability of δ₁, stable tempered projection, and sign-normalized stable inner transfer.
   - **Witness.** U(G), stable orbital integrals and `TauCeti.IsStableDistribution` belong to EndoscopicTransferAndUnitaryTraceComparison (§2.4, README:778; §2.11), at ORDER line 163. That roadmap consumes SmoothRepresentationsOfLocalGroups §§SR.0–SR.5 (README:17). SmoothRepresentationsOfLocalGroups README:112 says "Plancherel theory is not here".
   - **Repair.** Re-home the gap to EndoscopicTransferAndUnitaryTraceComparison as a continuation of §§2.1, 2.4, 2.11 and 2.16. That roadmap already owns orbital integrals, stable orbital integrals, Harish-Chandra characters, Weyl integration, Kottwitz signs and transfer. Split the 13-clause `needs` sentence into separate slugs, one sentence each:
     - Kazhdan density and the splitting `I(G)` = cuspidal ⊕ noncuspidal;
     - the Arthur decompositions (1)–(3) with central invariance (H26 Lemma 2.1);
     - unstable functions = the annihilator of `SD_temp`, plus stability of δ₁ (Kottwitz);
     - the stable projection on `D_temp` agreeing with elliptic averaging (Varma Lemma 3.4.5);
     - bounded `|D|^(1/2)O_γ(f)` with compact torus support;
     - sign-normalized stable inner transfer with relevance.

     Only "the faithful essentially compact distribution realization of the Bernstein centre with inversion and convolution pairing" can stay on SmoothRepresentationsOfLocalGroups §SR.3.2. Update the `gaps` entry and every `*Needs:*` line that cites the slug.

5. **F05** (P1) gap:regular-supercuspidal-atomicity is not statable by its supplier and no source proves it

   - **Location.** `README.md:67` (the gap) and `README.md:69`: "Those statements alone do not discharge arbitrary-coefficient minimality under the displayed hypotheses."
   - **Claim.** SmoothRepresentationsOfLocalGroups can supply Kaletha packets and their arbitrary-coefficient atomic stability under the hypotheses of H26 Corollary 1.3.
   - **Witness.** Stable combinations need ETUTC (R04), and no roadmap owns Kaletha packets. H26 line 81 credits FKS. FKS21v2 Theorem 4.4.4 (lines 1281–1291) gives stability and identities only for part of `S_φ^+` (line 1299), assuming exponential convergence (lines 993–1000).
   - **Repair.** This is the roadmap's own unresolved input written as a gap. Delete gap:regular-supercuspidal-atomicity, and delete §4.4 as a separate target and headline: on its hypotheses §4.4 says nothing beyond §4.3 applied to an atomically stable packet sum. Instead, add a sentence to §4.3: "In particular, for a regular supercuspidal L-packet Π_φ(G) (Kaletha) whose character sum is atomically stable, the FS parameter is constant on Π_φ(G) (H26, Corollary 1.3, p. 2; the atomicity input is not established in FKS21v2, see Source issues)." Remove the item from the `Suggested.lean` docstring list. Restore §4.4 only if a human supplies a source that proves atomicity under the stated hypotheses.

6. **F06** (P1) The Levi correspondence for extended pure inner forms is used but owned nowhere

   - **Location.** `README.md:575`: "If M is a Levi subgroup of G=G*_b and M* the corresponding Levi of G*, then r_M o τ_G = τ_M o r_(M*)…". Also the smaller-rank step at `README.md:541` and the relevant-Levi step in §6.1.
   - **Claim.** `τ_M` is defined for every Levi M of G*_b.
   - **Witness.** §5.2 (README:551) defines τ only for G=G*_b, b basic. `τ_M` needs M≅(M*)_{b_M} with `b_M∈B(M*)` basic over b. No target, supplier section or gap states this; BunG §§1.18–1.19, 1.24 and ETUTC §§1.6, 1.13a do not.
   - **Repair.** Add to gap:basic-weight-invariant-fibres (BunGAndNewtonStrata §§1.18–1.19, 1.24) the clause: "for quasi-split G* over E, basic b∈B(G*) and an E-rational Levi M of G*_b, there is a standard Levi M* of G* and a basic b_M∈B(M*) mapping to b with M≅(M*)_{b_M}, compatibly with the identification of spectral centres." Add the slug to the `*Needs:*` lines of §§5.1, 5.3 and 6.1. Add a Check: for G=D^× (G*=GL₂, b basic with κ=1), the only E-rational Levi of G is G itself, with M*=GL₂ and b_M=b. The diagonal torus of GL₂ is the M* of no Levi of D^×, which is the irrelevant case of §6.1.

7. **F07** (P2) A headline statable at the pins is missing from `Suggested.lean`

   - **Location.** `packages/ExcursionOperatorsAndSpectralActionPartII/Suggested.lean:12`: "Quantitative weight equidistribution … lacks dual-group algebraic highest-weight representations with their local stable-class invariant fibres".
   - **Claim.** The quantitative weight equidistribution of §2.4 cannot be stated at the pins.
   - **Witness.** The statement below elaborates at the pins, using `TauCeti.formalCharacter` (Weights/FormalCharacter.lean:156), `TauCeti.IsHighestWeightVector` (HighestWeight/Basic.lean:122) and `TauCeti.twoWeylVector` (RootSystem/Weyl/Vector.lean:102). `simp`, `aesop` and `exact` fail; FiniteDimensional.lean:140 makes it non-vacuous.
   - **Repair.**
     - **README.** Restate §2.4 in two parts:
       - (a) The general target: for every semisimple Lie algebra over an algebraically closed field of characteristic 0 (equivalently, the derived dual Lie algebra), every base and every surjection φ of the root lattice onto a finite abelian group A, the normalized pushforward of the weight multiplicities of `V_(μ_m)` is within C/m of uniform in ℓ¹, for all m≥1 (FU25, Proposition 3.3.1 and proof of Theorem 4.3.1; H26 line 393).
       - (b) The R_g form, as its consequence through `R_g≃H_g` and finitely many torus types.
     - **`Suggested.lean`.** Change the docstring item to say that only part (b) and §2.5 lack carriers: the local stable classes, `H_g` and the Hecke operators on characters. Add the following, verbatim:

   ```lean
   import Mathlib
   import TauCeti.Algebra.Lie.HighestWeight.Basic
   import TauCeti.Algebra.Lie.Weights.FormalCharacter
   import TauCeti.LinearAlgebra.RootSystem.Weyl.Vector

   namespace TauCetiRoadmap.ExcursionOperatorsAndSpectralActionPartII

   open LieAlgebra LieModule Module

   open scoped Classical in
   /-- Quantitative weight equidistribution (§2.4, root-lattice form; FU25 Proposition 3.3.1 and the
   estimate in the proof of H26 Lemma 2.6). Let `M` be generated by a highest weight vector of weight
   `μ_m = 2m · 2ρ`. Push its weight multiplicities forward along a surjection `φ` from the root
   lattice onto a finite abelian group `A` and divide by `dim M`; the result is within `C / m` of the
   uniform distribution in `ℓ¹`, for every `m ≥ 1`, with `C` independent of `m` and `M`. -/
   theorem weightPushforward_sum_abs_sub_uniform_le
       {K : Type*} {L : Type*} [Field K] [CharZero K] [IsAlgClosed K]
       [LieRing L] [LieAlgebra K L] [IsKilling K L] [FiniteDimensional K L]
       {H : LieSubalgebra K L} [H.IsCartanSubalgebra]
       (b : (IsKilling.rootSystem H).Base)
       {A : Type*} [AddCommGroup A] [Fintype A]
       (φ : AddSubgroup.closure (Set.range (IsKilling.rootSystem H).root) →+ A)
       (hφ : Function.Surjective φ) :
       ∃ C : ℝ, ∀ m : ℕ, 1 ≤ m →
         ∀ (M : Type*) [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
           [FiniteDimensional K M] (v : M),
           TauCeti.IsHighestWeightVector b
             ((2 * m : ℕ) • TauCeti.twoWeylVector (IsKilling.rootSystem H) b) v →
           LieSubmodule.lieSpan K L {v} = ⊤ →
           ∑ a : A, |((TauCeti.formalCharacter K H M).coeff.sum fun χ n ↦
               if h : χ ∈ AddSubgroup.closure (Set.range (IsKilling.rootSystem H).root) then
                 (if φ ⟨χ, h⟩ = a then (n : ℝ) else 0) else 0) / (finrank K M : ℝ)
               - 1 / (Fintype.card A : ℝ)| ≤ C / m := by
     sorry

   end TauCetiRoadmap.ExcursionOperatorsAndSpectralActionPartII
   ```

     Tested on the refuting instance: sl₂, A=ℤ/2, φ(α)=1. The left side is 1/(4m+1), so C=1/4 works, while the README's §2.4 Check values 1/5 and 1/9 are reproduced. The binder check (`#check @`) keeps all binders. With this change the acceptance test holds one theorem, and the other eight headlines stay correctly unstatable (see Verified sound).

8. **F08** (P2) §2.2 re-plans a comparison that ReductiveGroups Layer 10 already supplies

   - **Location.** `README.md:339`: "Prove the following specialized group-to-Lie comparison as part of this target. Over an algebraically closed characteristic-zero coefficient field, differentiate V_(μ_m) on the derived dual Lie algebra…". The same claim of ownership appears at `README.md:11`.
   - **Claim.** No supplier gives the character of the dual-group representation `V_(μ_m)` in `ℤ[X*(T̂)]`, so this roadmap must build a group-to-Lie comparison.
   - **Witness.** ReductiveGroups Layer 10A–10B on main (README:1731–1780) gives formal characters in ℤ[X] with central weights, classifies simples by X⁺, and states "Their characters are the Weyl characters", Δ=∇=L in characteristic 0. The README cites only Layers 1, 2, 7.
   - **Repair.**
     - Delete the paragraph at README:339 and the "group-to-Lie comparison" clauses in §2.2 and at README:11.
     - Cite "ReductiveGroups Layer 10B (simple modules L(λ) of split reductive groups and their Weyl characters)" for `ch(V_(μ_m))` in `ℤ[X*(T̂)]`. Derive the product formula from it with the denominator identity (FU25 Lemma 3.1.2, line 719).
     - Add Layer 10 to the From-ReductiveGroups contract (README:107) and to the §2.2 `*Needs:*` line.
     - Keep the GL₂ det-versus-trivial Check as a test of the central weight.

9. **F09** (P2) Two gaps ask for what EndoscopicTransferAndUnitaryTraceComparison and BunGAndNewtonStrata already provide

   - **Location.** `README.md:87`: gap:elliptic-torus-representatives, clauses 2 and 3: "finiteness … of rational conjugacy classes of geometrically conjugate embeddings of a fixed torus, and matching of every strongly regular elliptic inner-form element…". `README.md:97`: gap:basic-weight-invariant-fibres, all three clauses.
   - **Witness.** ETUTC §1.14(b) (README:555): D(T,G;F) is finite, and it classifies the embeddings, since g⁻¹σ(g)∈T. ETUTC §1.6(ii)–(iii) (README:354): tori of inner forms transfer to G*. BunG `Acceptable.basic` (README:910) with ETUTC README:475 (X*(Z(Ĝ)^Γ)=π₁(G)_Γ) gives the B(G,μ) clauses.
   - **Repair.**
     - Shrink gap:elliptic-torus-representatives to: "provide finiteness of the set of G(E)-conjugacy classes of maximal E-tori of G for E/ℚ_p finite". Cite ETUTC §1.14(b) and §1.6(ii)–(iii) for the other two clauses.
     - Delete the first two clauses of gap:basic-weight-invariant-fibres. Derive them as a local Check in §2.2: for a basic class b, a dominant μ in the W-orbit of a lift of κ(b) works; 1∈B(G,μ) iff μ♯=0 iff μ is trivial on Z(Ĝ)^Γ.
     - Rewrite the third clause as the compatibility only: "HKW's inv[1] agrees with ETUTC §1.14's inv under B(T)≅X_*(T)_Γ (§1.36) and §1.2(a)."
     - Keep R06's clause in this gap.

10. **F10** (P2) gap:all-weight-shriek-trace is compound and bundles facts that belong to other owners

   - **Location.** `README.md:79`: "…with the invariant inv[b], supported-weight existence and uniqueness, Kottwitz sign e(G)e(G_b), and the explicit basic-label, modification-direction, Verdier-duality, inversion and representation-duality comparisons…"
   - **Witness.** Weight existence and uniqueness (FU25 Lemma 4.2.7, line 955; HKW22 Remark 3.2.5, line 649) are statements about B(T_g) and stable classes, not Hecke stacks. The Kottwitz sign is ETUTC §1.13. One sentence carries six obligations for three owners.
   - **Repair.** Narrow the slug to: "For dominant μ and basic b∈B(G,μ), the functors `i₁* T_(V_μ dual) i_b!` and `i_b* T_(V_μ) i₁!` preserve finite length and satisfy the elliptic character formula of HKW22 Theorem 6.5.2 (with the sign of (3.3.3)), transported from HKW's star extension by smooth duality and inversion (HKW22 line 3018)." Move weight existence and uniqueness to gap:basic-weight-invariant-fibres (BunGAndNewtonStrata). Cite ETUTC §1.13 for e(G).

11. **F11** (P3) Two definitions have only two Checks on the actual object

   - **Location.** §0.2 (`README.md:154–158`) and §5.2 (`README.md:564–569`).
   - **Witness.** In §0.2, the third Check evaluates `diag(a,b)` on ℂ², not Z_vst(G). In §5.2, Checks 3–4 evaluate ℂ[X] and ℂ×ℂ, which tests Mathlib's generic quotient construction rather than τ_G. README:569 has the typo "ℂ×ℂ → C".
   - **Repair.**
     - Add to §0.2: "For G=GLₙ, D(T,G;F)=0 for every T, so U(G) is the null space and Z_vst(G)=Z(G), since the centre preserves null functions (H26 line 188). For G=SL₂, the idempotent of one Bernstein block meeting a two-element depth-zero supercuspidal L-packet acts by 1 and 0 on its members, so it is not very stable."
     - Add to §5.2 a Check on actual groups: "In semisimple rank 0, G* is a torus T*. Every b∈B(T*) has T*_b=T*, since the σ-centralizer of b in a commutative group is the whole group, so τ_G must be the identity of Z_FS(T*). A quotient map with nonzero kernel fails this."
     - Fix the typo to "ℂ×ℂ→ℂ".

12. **F12** (P3) The §4.2 locator claims a printed proof

   - **Location.** `README.md:493`: "(H26, Corollary 1.2 proof from Theorem 1.1, p. 2; H26 line 77.)"
   - **Witness.** H26 lines 74–78 give only the definition and the statement. No proof of Corollary 1.2 is printed.
   - **Repair.** Replace with "(Deduced here from Theorem 1.1; H26 states Corollary 1.2 without proof, p. 2, H26 line 77.)"

13. **F13** (P3) The §4.3 `*Needs:*` line omits a supplier its route uses

   - **Location.** `README.md:513`: "*Needs:* §3.3; §4.2; gap:geometric-spectral-centre; LanglandsParameterStacks §LP2c.5."
   - **Witness.** The route at README:507 uses "LanglandsParameterStacks LP2c.8" to identify the scalar evaluations.
   - **Repair.** Append "; LanglandsParameterStacks §LP2c.8".

14. **F14** (P3) A second definition of "stable distribution" next to the supplier's

   - **Location.** `README.md:121–123`: "Define Z_st(G) as the complex submodule of Z(G) consisting of z with z(f)=0 for every f in U(G)…".
   - **Witness.** EndoscopicTransferAndUnitaryTraceComparison §2.4 (README:778) plans `TauCeti.IsStableDistribution` as the closed span of the `SO_γ`. H26 line 39 uses annihilation of U(G). The two agree by duality, but the README never says so.
   - **Repair.** Add to Conventions: "A central distribution is stable in the sense of EndoscopicTransferAndUnitaryTraceComparison §2.4 (`TauCeti.IsStableDistribution`). On Z(G) this is equivalent to annihilating U(G), the kernel of all strongly regular stable orbital integrals (§2.11)." Define Z_st(G) as Z(G)∩ that notion.

Fourteen findings: six P1, four P2, four P3. The mathematics of Layers 0–6 is sound against H26, FU25, HKW22 and FS24 at every sampled locator. The problems are in the supply structure, plus one statable headline. The base roadmap this Part II extends exists nowhere. The centre map Ψ_G, which every headline uses, has no eligible owner. Three of the eight declared gaps go to SmoothRepresentationsOfLocalGroups, which cannot state them without consuming later roadmaps. One headline is statable at the pins and is missing from `Suggested.lean`.

Abbreviations: ETUTC = EndoscopicTransferAndUnitaryTraceComparison and BunG = BunGAndNewtonStrata. Line numbers in their READMEs, and in those of the other suppliers still in pull requests, are at the open heads indexed on 2026-10-24. ReductiveGroups line numbers are on main.

## Adversarial pass

Every row gives the values computed on both sides.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Convolution convention | δ_t, f(t)=1, f(t⁻¹)=0 | `(δ_t*f)(1)=f(t⁻¹)=0`; `δ₁(δ_t*f^vee)=f(t)=1`; no inversion gives 0≠1 | correct | none |
| Normalized induction | GL₂, B, m=diag(ϖ,1), values 2,3 | δ_B=q⁻¹; eigenvalue q^(1/2)(2+3)=5√q (q=2: 7.07); inverted modulus gives 5/√q | correct | none |
| Kottwitz sign | GL₂ vs D^×, μ=(1,0) | ⟨α,μ⟩=1, sign −1, so 3↦−3; HKW's printed ρ (full sum, line 848) gives exponent 2, sign +1 | README right, source misprint | Source issues |
| Degree/label direction | G_m, weight 1 | HS1.2: T_{V_1}A=c_1^*A with L↦L(−D), degree d→d+1, κ→κ−1; matches HS3.10 test κ(b)=κ(b′)−n | consistent | none |
| §0.1 Z_st | torus; zero; δ₁; ℂ² | U(T)=0 since SO_t(f)=f(t), so Z_st(T)=Z(T); 0∈Z_st; δ₁(f)=f(1)=0 on U; (a,b)·(1,−1)=a−b | correct | R14 |
| §0.2 Z_vst | torus; 0, δ₁; diag | 0*u=0, δ₁*u=u; diag(1,0)(1,−1)=(1,0)∉U; GL_n: U = null functions, Z_vst=Z | correct | R11 adds GL_n, SL₂ |
| §0.3 module structure | z very stable | `z^vee*f=(z*f^vee)^vee` by conjugation invariance (computed: both are `z(g↦f(xg))`); `(y*z)(f)=y(z^vee*f)=0` | correct | none |
| §0.4 criterion | diag(2,2), diag(1,0) | (2,−2)∈U and (2,2)∈S; (1,0)∉U and (1,0)∉S | both directions agree | none |
| §0.5 faithfulness | torus; z·SD_temp=0 | z*f unstable ∀f ⇒ δ₁(z*f^vee)=z(f)=0 (Kot88 via H26 line 286) | correct | none |
| §1.1 T_μ | μ=0; complex with dims 2,1 in degrees 0,1 | T_0=id; Euler 2−1=1; after one shift −1 | correct | none |
| §1.2 commutation | diag(1,2), swap on (1,1) | swap∘diag gives (2,1), diag∘swap gives (1,2) | non-geometric operator excluded | none |
| §1.3 mod induced | stable value 3, dim V=5 | 15−5·3=0 at elliptic g; induced input 0↦0 (H26 Prop 2.5, line 338) | correct | none |
| §1.4 inner operators | GL₁, μ=1 | forward label −1 (V dual), reverse +1; common dimension 1 | correct | none |
| §1.5 inner commutation | scalars 2, −2 | 2·(−2)=−4=(−2)·2; target 3 gives −6 | correct | none |
| §1.6 inner formula | GL₂/D^×, μ=(1,0) | e(G)e(G_b)=−1, dim 2, value 3 gives −6 (H26 line 417) | correct | none |
| §2.1 Av | values 2,6; singleton; weights 1/4,3/4 | 4; 2; 0.5+4.5=5≠4 | correct | none |
| §2.2 μ_m, d_m | N=0; A₁; B₂; m=0 | d=1; A₁ m=1: 2α, d=5 (2mρ gives 3); B₂ roots sum (3,1), coroots (4,2), μ₁=(8,4); Weyl dimension Π⟨(4m+1)ρ,α∨⟩/⟨ρ,α∨⟩=(4m+1)^N; B₂ m=1: 625 | correct | R08 (owner) |
| §2.2 product formula | Weyl character with λ=4mρ | A_{(4m+1)ρ}/A_ρ=Π_α Σ_{j=−2m}^{2m}e^{jα} (FU25 lines 731–762) | correct | none |
| §2.3 C_m | A₁ on ℤ/2; GL₁ | m=1: 3/5+2/5=1; m=2: 5/9+4/9=1; GL₁: H_g=ker(ℤ→ℤ)=0, one class, mass 1 | correct | none |
| §2.4 equidistribution | A₁ on ℤ/2; N=0 | Fourier coefficient Σ_{−2m}^{2m}(−1)^j/(4m+1)=1/(4m+1); ℓ¹ error 1/(4m+1): 1/5, 1/9 ≤1/(4m); bound 2/|1−(−1)|=1 | correct | R07 |
| §2.5 averaging | values 2,6 | m=1: 6/5+12/5=18/5, error 2/5 ≤ (1/5)·6; m=2: 34/9, error 2/9 | correct | none |
| §3.1 compact U | SL₂, w=[[0,−1],[1,0]] | diag(ϖⁿ,ϖ⁻ⁿ) conjugate has off-diagonal entries −ϖ^{2n}, ϖ^{−2n}, so unbounded | saturation excluded | none |
| §3.2 cuspidal limit | one torus piece | 2·3·(5/m)=30/m; f=0 gives 0 | correct | none |
| §3.3 Theorem 1.1 | constant c | |c|≤30/m ∀m ⇒ c=0; c=1 fails at m=31 (30/31<1); cuspidal part of an unstable f is unstable (via (3)) | correct | none |
| §4.1 atomic | span{(1,2,0),(1,1,1)} | span = (a+b,2a+b,b): none of the 6 proper 0/1 subsums lies in it; (1,2,0) has support 2<3 | correct | none |
| §4.2 rigidity | (1,2), eigenvalues 3,5 | (3,10)−3(1,2)=(0,4), support 1<2 | correct | R12 |
| §4.3 FS parameter | diag(2,3), diag(3,2), diag(2,4) | traces 5,5,6; dets 6,6,8 | correct | R13 |
| §4.4 regular packets | A₁, p=2,3; FKS bound | |W|=2 rules out p=2 and allows p=3; p≥(2+e)n at ℚ₃, n=2: 3≥6 false | hypotheses mismatch | R05 |
| §5.1 kernel inclusion | b=1; elliptic step | equal kernels; −1·2·3=−6≠0 | correct | R06 (input) |
| §5.2 τ_G | ℂ[X]; pr₁, pr₂ | X↦0, X+2↦2; x=(0,1) forces τ(0)=1 against τ(0)=0 | direction detected | R11 |
| §5.3 Levi square | a=0,1 | both composites give 0 and 1 | correct given R06 | R06 |
| §6.1 transfer | e=−1, scalar 2, value 3 | Trans(z·Θ)=−1·6=−6; τ(z)·Trans Θ=2·(−3)=−6; H26 line 624 T*_μ=dim V·Trans^ell | correct | none |
| §6.2 matching | a=3 | 2·3=6, 2·(−3)=−6; irrelevant class 0 | correct | none |
| R07 candidate | sl₂, ℤ/2 | LHS=1/(4m+1)≤(1/4)/m; general: Σ_{χ≠1}|Π_α Σ_j χφ(α)^j|/(4m+1)^N ≤ (|A|−1)·2/(|1−ζ|(4m+1)) | true, not one-tactic | add |

Degenerate inputs checked:
- The trivial group and tori: N=0 gives d_m=1, U=0, H_g=0.
- p=2 with q=2: √2 lies in ℂ, and the convention fixes the square root.
- The zero ring, q=1 and ℓ=p are excluded by the Conventions.
- m=0: the README excludes it from the 1/m estimates.
- Non-quasi-split G is allowed in Theorem 1.1 (H26 line 72).

## Verified sound

- **Source sample (15/15 targets).** Each was read at its locator; theorem, page, hypotheses and statement were checked:
  - 0.2: H26 lines 41, 48–50.
  - 0.3: H26 lines 48–50, 286.
  - 1.3: H26 Proposition 2.5, lines 338–362.
  - 1.5: H26 Proposition 2.7(i), line 413.
  - 2.2: H26 line 365; FU25 Lemmas 3.1.2–3.1.3, lines 717–776.
  - 2.3: H26 lines 382–392; FU25 Lemmas 3.2.1–3.2.3, lines 794–814; Lemma 4.2.7, lines 955–972.
  - 2.4: H26 lines 393–398; FU25 Proposition 3.3.1, lines 823–856; Theorem 4.3.1, lines 1031–1105.
  - 2.5: H26 Lemma 2.6, lines 368–407.
  - 3.1: H26 line 505; HKW22 Lemma 3.1.1, lines 577–607.
  - 3.3: H26 Theorem 1.1, line 70; proof lines 438–520.
  - 4.1: H26 lines 74–76.
  - 4.2: H26 line 77 (locator issue R12).
  - 5.1: H26 lines 522–565.
  - 5.3: H26 lines 566–585.
  - 6.1: H26 lines 586–627.

  The README adds two strengthenings: an explicit O(1/m) rate where H26 says "tends to zero", and stable projection restricted to `D_temp`. Both are justified by H26 lines 393–407. No locator was flagged unverified by the author.
- **Other locators (all correct).**
  - HKW22 lines 848–852, 3004–3019, 3190–3196, 3492–3498, 3635–3642, 631, 649.
  - FS24 lines 1282–1302.
  - FKS21v2 lines 984–1000, 1281–1300.
  - H26 lines 32–41, 91–97, 181–288, 296–297, 594–598, 600–638.
- **Library declarations at the pins (18/18).** Each `#check @name` was elaborated in one scratch file:

  | Declaration | File:line |
  |---|---|
  | `Finsupp` | Data/Finsupp/Defs.lean:88 |
  | `Finsupp.mem_support_iff` | Data/Finsupp/Defs.lean:158 |
  | `Submodule` | Algebra/Module/Submodule/Defs.lean:39 |
  | `Subalgebra` | Algebra/Algebra/Subalgebra/Basic.lean:29 |
  | `AlgHom.rangeRestrict_surjective` | Algebra/Algebra/Subalgebra/Basic.lean:588 |
  | `Fintype.expect_eq_sum_div_card` | Algebra/BigOperators/Expect.lean:371 |
  | `AddChar.complexBasis` | PontryaginDuality.lean:125 |
  | `AddChar.wInner_cWeight_eq_boole` | Orthogonality.lean:58 |
  | `Ideal.quotientKerEquivRange` | Ideal/Quotient/Operations.lean:819 |
  | `MeasureTheory.norm_integral_le_of_norm_le_const` | Bochner/Basic.lean:999 |
  | `TauCeti.ExactK0` | GrothendieckGroup/Exact.lean:163 |
  | `TauCeti.ExactK0.lift` | GrothendieckGroup/Exact.lean:324 |
  | `TauCeti.AbelianK0.homologyEulerChar` | EulerCharacteristic.lean:307 |
  | `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` | Weyl/Character.lean:319 |
  | `TauCeti.finrank_eq_prod_coweightPairing_div` | Weyl/Dimension.lean:113 |

  `Finset.expect`, `AlgHom.range` and `AlgHom.rangeRestrict` elaborate too. The stated hypotheses match: Zero; finite group; RCLike; IsFiniteMeasure; Killing, algebraically closed, characteristic 0; Fintype Weyl group.
- **Cross-roadmap citations resolved (all sections exist at the stated heads).**
  - SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.1.1, SR.2.2, SR.3.1–SR.3.3.
  - HeckeStacksAndLocalShtukas §§HS1.1–HS1.3, HS1.5–HS1.7, HS3.8, HS3.10 (HS3.10's chart left adjoint equals i_! for basic sources).
  - EndoscopicTransferAndUnitaryTraceComparison §§1.3, 1.6, 1.11, 1.13–1.16, 2.1, 2.4, 2.11, 2.16, 4.7.
  - BunGAndNewtonStrata §§0.5, 0.6, 1.11, 1.13, 1.18, 1.19, 1.23, 1.36.
  - GeometricSatakeAndFusion GS4 "Integral identification, normalization and functoriality" (README:1922).
  - ReductiveGroupsPartII §§RG2.1.5, RG2.5.
  - LanglandsParameterStacks LP2e.15, LP2c.5, LP2c.8.
  - ReductiveGroups Layers 1, 2, 7 (main).
  - RepresentationTheory/LieHighestWeight Layer 6 (main).

  The supply direction is correct: all suppliers come earlier in ORDER (lines 24, 26, 75, 148, 163, 240, 243; this roadmap is at 287), or are on main. Content problems: R01–R06, R08–R10.
- **Depcheck output.** `depcheck: 42 roadmaps, 417 edges, 0 problem(s)`. Depcheck does not see the cycle in R04, because that cycle is a gap that would force the supplier to consume a later roadmap.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout exits 0 with no output; there are no declarations. The R07 candidate elaborates with one `sorry` warning; to do so I built `TauCeti.Algebra.Lie.HighestWeight.Weyl.Dimension` and the GrothendieckGroup modules with targeted `lake build`. The binder check (`#check @`) keeps every binder.
- **Headline statability (9 headlines).** The docstring is correct for 8 of the 9; the exception is R07. None of the following carriers exists at the pins: a pinned search for Bernstein-centre, orbital-integral, stable-conjugacy, Fargues–Scholze, Harish-Chandra-character and reductive-group-scheme declarations finds none in Mathlib or Tau Ceti.
  - Theorem 1.1: needs a reductive group G/E with G(E), the distributional Bernstein centre, stable orbital integrals and Ψ_G.
  - Lemma 2.3: needs Z_vst and SD_temp.
  - Lemma 2.6 / §2.5: needs Harish-Chandra characters and Hecke operators on Bun_G.
  - Proposition 2.7: needs i_b!, T_V and character maps.
  - Corollary 1.2: needs FS parameters.
  - Corollary 1.3: needs Kaletha packets.
  - Theorem 1.4(i), 1.4(ii) and the final assertion: need Ψ_G, inner forms, Trans_G and stable matching.
- **Docstring of `Suggested.lean`.** No process narrative, `set_option` or `lemma`. The form and namespace are correct. Items 2 and 6 need the R07 and R05 edits.
- **Ownership against open work.** Object greps for very stable, atomically stable, stable Bernstein, spectral Bernstein centre, FS parameter and regular supercuspidal found no competing owner on main, at the 344 open heads, or in the readable board packages. This roadmap is the right owner of Z_st, Z_vst, the character Hecke operators, atomic stability and τ_G.
- **README shape and house style.** Headings are complete. There is no LaTeX and no process words ("packet" occurs only in "L-packet"). Every definition has at least three Checks; R11 notes the weak ones.
- **Sources manifest.** One key per work. FKS21v2 has DOI and arXiv under one key. Versions match the extractions: FU25 is dated 31 Dec 2024 at FU25 line 5.

## Not verifiable

- FKS23 (Duke Math. J. 172) is the published version, which H26 cites for atomic stability. It is behind a paywall, so I cannot check whether it strengthens FKS21v2 Theorem 4.4.4. This bears on R05 and on the Source issue below.
- Var24 (Varma), which H26 cites for the stable projection and the unstable-function criterion, is not in the manifest. The README routes these through a gap (R04), so I did not fetch it.
- Board package heads other than those in this checkout were not fetched. For EndoscopicTransferAndUnitaryTraceComparisonPartII the checkout holds only reports, so ownership against that head is unchecked.

## Source issues

- **Misprint** in H26 at §2.4, p. 13: the source writes the reverse composite with extension index i; it should be the identity-stratum index 1, as on p. 9; affects nothing.
- **Misprint** in H26 at §2.2, p. 8: the source defines 2ρ_G as the usual positive-root sum, with G's roots implied by the subscript, yet uses μ_m=4mρ_G as a Ĝ-weight; it should be the positive roots of Ĝ (coroots of G); affects nothing.
- **Misprint** in HKW22 at §3.3, (3.3.3), p. 18: the source describes ρ_G as the full positive-root sum; it should be the half-sum, so that 2ρ_G is the full sum (App. A.2, p. 72); affects nothing.
- **Misprint** in H26 at §2.3, p. 11: the source applies the stable projection to every element of D(G); it is defined only on D_temp(G) (p. 6), and the text uses it on tempered Ξ; affects nothing.
- **Gap** in H26 at Corollary 1.3, p. 2: the source attributes atomic stability of the regular supercuspidal packet sum to FKS without argument; it should give the deduction, since FKS21v2 Theorem 4.4.4 covers only part of S_φ⁺ and assumes exponential convergence; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "af07bf6", "job": "REV-PKG-ExcursionOperatorsAndSpectralActionPartII", "model": "opus", "worker": "fable-rev75"} -->
