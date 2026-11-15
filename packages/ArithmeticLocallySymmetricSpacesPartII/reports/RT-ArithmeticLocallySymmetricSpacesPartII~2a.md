<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13108#issuecomment-6896606677 -->
Red team round 2 pass a (claude) of 0d8cb33

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The equality H_cusp^i = H_!^i at Bianchi level has no owner

   **Location.** `README.md:580` ("In these degrees the Bianchi cuspidal comparison identifies H_!^i with H_cusp^i"), `:582` ("Use the Bianchi boundary-kernel/cuspidal comparison in FGT §1 (1.3)–(1.6)"), `:663` ("lies in H_cusp¹=H_!¹"), `:679` ("c(n+1)≤dim H_cusp^i(Γ,E_n)=dim H_!^i(Γ,E_n)≤C(n+1)").

   **Claim.** At a neat Bianchi level the parent's automorphic cuspidal cohomology equals the interior cohomology in degrees 1 and 2.

   **Witness.** ArithmeticLocallySymmetricSpaces §ALS.5b.5 gives only an injection with image in H_!; surjectivity is under the unproved hypothesis `FrankeInput` (§ALS.5b.4). fgt10 line 133 defines H_cusp as the boundary-restriction kernel and line 152 cites Borel for (1.5). No target, supplier section or pinned declaration proves surjectivity.

   **Repair.** Nothing downstream needs the equality; state the inclusion and bound both spaces.

   - `README.md:580`: replace the sentence by "By ArithmeticLocallySymmetricSpaces §ALS.5b.5 the cuspidal cohomology injects into H_!^i; equality of the two is not asserted."
   - `README.md:582`: replace "Use the Bianchi boundary-kernel/cuspidal comparison in FGT §1 (1.3)–(1.6); retain" by "The kernel of H^i→H^i(∂) is H_!^i by the long exact sequence (fgt10 (1.3) is this kernel); retain".
   - `README.md:663`: "lies in H_cusp¹=H_!¹ and gives the same lower bound there and, by self-dual interior duality, in H_!²" → "lies in H_cusp¹⊆H_!¹ and gives the same lower bound in both; dim H_cusp²=dim H_cusp¹, because each cuspidal π with archimedean component `π_{2n+2,0}` contributes its K-invariants once in degree one and once in degree two (§4.1, §ALS.5b.5), and dim H_!²=dim H_!¹ by self-dual interior duality".
   - `README.md:679`: "c(n+1)≤dim H_cusp^i(Γ,E_n)=dim H_!^i(Γ,E_n)≤C(n+1)" → "c(n+1)≤dim H_cusp^i(Γ,E_n)≤dim H_!^i(Γ,E_n)≤C(n+1)".

   Tested on F=ℚ(i), n=99, neat Γ: the base-change classes restricted from SL₂(ℤ[i]) have dimension (1/3)·100+O(1) in H_cusp¹; dim H_cusp²=dim H_cusp¹; H_!^i lies between H_cusp^i and H^i, of dimension at most C·100. Every inequality of §5.8 survives; the `Suggested.lean` statements use ordinary cohomology only and are unchanged.

2. **F02** (P2) §5.3 uses the amalgam structure of SL₂(ℤ) and its cohomology sequence with a citation as the only owner

   **Location.** `README.md:596` ("The parabolic cohomology Euler characteristic from the amalgam `SL₂(ℤ)≅ℤ/4∗_{ℤ/2}ℤ/6` and its cohomology exact sequence, which give `dim H¹(SL₂(ℤ),W) = …`") and `README.md:598` ("*Needs:* ModularForms §10C; ModularSymbolsPadicLFunctions §0.7.").

   **Claim.** The route's inputs are the two named suppliers.

   **Witness.** Neither supplier states the amalgam or the sequence. ModularCurvesPartII §15.4 has the sequence only "for the actual amalgam of §15.2" (principal level); FourManifolds quotes the presentation inside a proof. Pinned Tau Ceti has one-edge graphs of groups (GroupTheory/GraphOfGroups/OneEdge.lean) but no SL₂(ℤ) statement.

   **Repair.** Own both facts in §5.3. Add after the proof route:

   "The API includes the following facts.

   - SL₂(ℤ) is the amalgamated product of ⟨S₄⟩, of order 4, and ⟨−S₃⟩, of order 6, over ⟨−I⟩ (serre77, I §4.2 Example (c), p. 52), proved here.
   - For an amalgam G=G₁∗_H G₂ and a representation W of G over a field, the sequence 0→W^G→W^{G₁}⊕W^{G₂}→W^H→H¹(G,W)→H¹(G₁,W)⊕H¹(G₂,W) is exact (serre77, II §2.8, p. 169), proved here from the chain sequence of the tree; for finite G₁, G₂ in characteristic zero the last term vanishes.
   - Hence, when −I acts trivially on W, `dim H¹(SL₂(ℤ),W) = dim W − dim W^{⟨S₄⟩} − dim W^{⟨−S₃⟩} + dim W^{SL₂(ℤ)}`."

   and extend the `*Needs:*` line with "Mathlib `groupCohomology`". Tested: W=ℂ gives 1−1−1+1=0 (the abelianisation ℤ/12 is finite); W=Sym²(ℂ²) gives 3−1−1+0=1=2·dim S₄+1; W=Sym^{10}(ℂ²) gives 11−5−3=3, the value in the §4.2 Check (`README.md:522`).

3. **F03** (P2) gap:canonical-dimension-zero states its hypotheses by pointing at a source section, in another paper's vocabulary

   **Location.** `README.md:74` and `design/plan.json` `gaps[1].needs` ("in the semisimple congruence-kernel setting of aw13 §10.12, including deformation index zero, canonical dimension zero is equivalent to finite dimension over the coefficient field").

   **Claim.** The sentence says exactly what the supplier must provide.

   **Witness.** aw13 line 3600–3604 lists three hypotheses in terms of an integer m; "deformation index" is aw14's term and does not occur in aw13 §10.12. The supplier defines canonical dimension in its §0.11, not §F.1 ("Canonical dimension … is defined in §0.11").

   **Repair.** Replace the `needs` sentence, in the README and in the plan's `gaps`, by: "For p odd, m≥1, `G=∏_{i=1}^m ker(SL₂(ℤ_p)→SL₂(𝔽_p))` and `A=ℚ_p⊗ℤ_p[[G]]`, a nonzero finitely generated left A-module M has canonical dimension zero, in the sense of NoncommutativeAndEquivariantIwasawa §0.11, if and only if dim_{ℚ_p} M is finite." Keep the locator (aw13, Lemma 10.13, p. 77) and set the supplier section to §0.11. Tested on the gap's own Checks: M=W_k has canonical dimension 0 and dimension D(k+1); M=A has canonical dimension 3m and infinite dimension; M=A/Aδ with δ a nonzero non-unit has canonical dimension 3m−1≥2 and infinite dimension.

4. **F04** (P3) BianchiModularForms owns the Bianchi coefficient modules under a different index; the scope does not say so

   **Location.** `README.md:9` (the sentence comparing `weightRep` with GL2AutomorphicRepresentationsAndTransfer §R16.6.3) and `README.md:25` ("E_n=Sym^n(ℂ²)⊗conjugate Sym^n(ℂ²) … Here κ=2(n+1)").

   **Claim.** `weightRep` has no neighbouring owner besides §R16.6.3.

   **Witness.** Open roadmap BianchiModularForms (merge order line 197, before this roadmap's moved place), §1.3: "define the coefficient module `E_k := Sym^{k−2}(ℂ²) ⊗ conj(Sym^{k−2}(ℂ²))` as a representation of `GL₂(K)`", with H¹_cusp as the cusp-restriction kernel. Its E_k is this roadmap's E_{k−2}.

   **Repair.** Append to `README.md:9`: "BianchiModularForms §1.3 defines, for an imaginary quadratic field, the coefficient modules E_k of GL₂(K) indexed by k≥2; its E_k is the E_{k−2} of this roadmap, so κ=2k−2, and its H¹_cusp is the kernel of restriction to the cusps, which contains the automorphic cuspidal cohomology used here. `weightRep` differs in covering every number field and every embedding tuple on subgroups of SL₂(O_F)." Tested: k=4 there is n=2 here, dimension (k−1)²=9=(n+1)², κ=6. With this sentence added on a scratch copy the dependency check prints `moved: … from #180 to #199, right after its last supplier LocallyAnalyticDistributionsPartII (BianchiModularForms also came after it)` and `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)`.

5. **F05** (P3) Two layer Dependencies lines omit entries of their `*Needs:*` lines

   **Location.** `README.md:270` (Layer 1 Dependencies) and `README.md:481` (Layer 3 Dependencies).

   **Witness.** §1.3 `*Needs:*` (`README.md:244`) lists NoncommutativeAndEquivariantIwasawa §0.5 and §0.8; line 270 has neither. §3.1 `*Needs:*` (`README.md:408`) lists Mathlib `Matrix.SpecialLinearGroup.map`, `Matrix.SpecialLinearGroup.toGL`, `PiTensorProduct.mapMonoidHom`, `MonoidHom.pi` and Tau Ceti `TauCeti.symPowerRep`; line 481 has none of them.

   **Repair.** Line 270: insert "NoncommutativeAndEquivariantIwasawa §0.5; NoncommutativeAndEquivariantIwasawa §0.8;" after "§F.1;". Line 481: insert "Mathlib `Matrix.SpecialLinearGroup.map`; Mathlib `Matrix.SpecialLinearGroup.toGL`; Mathlib `PiTensorProduct.mapMonoidHom`; Mathlib `MonoidHom.pi`; Tau Ceti `TauCeti.symPowerRep`;" after "Mathlib `Finset.prod`;".

6. **F06** (P3) Equation (34) of fu24 is on p. 22

   **Location.** `README.md:312` ("fu24, §6, p. 23, equation (34) and following inequalities").

   **Witness.** fu24 line 1123 displays (34) on p. 22; p. 23 begins at fu24 line 1126.

   **Repair.** "(fu24, §6, equation (34), p. 22, and the inequalities following it, p. 23.)"

Three P2 findings (S01–S03) and three P3 findings (S04–S06). No statement of `Suggested.lean` was found false. All fourteen round-1 findings are repaired at this head and no repair introduced an error.

Files read in full: `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` (797 lines) and `packages/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean` (104 lines). No Lean was run (this pass is read-only); the elaborated types are the worker's `signatures.md`, compared by hand with README §3.1, §4.2 and §5.8.

## Round 1 findings at this head

| Round-1 finding | Status | Witness at 0d8cb33 |
|---|---|---|
| 1a/F01, 1b/F03 LieHighestWeight Layer 0 cited for the sl₂ classification | repaired | `README.md` has 0 occurrences of "LieHighestWeight"; §0.3 (`README.md:162`): "are LocallyAnalyticDistributionsPartII §5.2 (i) and (iii) … consumed here, not proved again"; §5.1 computes the raising operator in Tau Ceti `Module.Basis.symmetricPower` (exists at the pin, Basis.lean:162). |
| 1a/F02, 1b/F01, 1b/F02 three analytic gaps and the action quotient owned by LocallyAnalyticDistributionsPartII | repaired | `README.md:84`: "Consume, for odd p: §0.2 … §2.1 … §3.4 … §3.7 … §3.10 … §4.1 … §4.14 … §5.2 (i) and (iii)". All eight headings exist at that roadmap's open head with the cited content (§3.4 flat on both sides, §3.10 natural isomorphism of isotypic quotients, §4.14 every λ∈ℤ_p^m, §5.2 (iii) the action quotient). The growth estimate is the new target §0.4; that roadmap's scope lists it under "Applications outside this roadmap". |
| 1a/F03 aw14 §5.4 misread | repaired | `README.md:793`: "§5.4 assumes `p^n 𝔤=(1/p)R⊗L_G` for an integer n≥0 … the first congruence kernel being the case n=0". |
| 1a/F04, 1b/F04 S_κ(K_f) undefined; factor 2^{r₁} | repaired | `README.md:487`: "define the space of cusp forms … `S_κ(K_f)=Hom_{SL₂(F_∞)}(π^+_κ, L²_cusp(…)^{K_f})`" and "`dim H_cusp^q(Y(K_f),V_κ)=Σ_ε m_ε(κ,K_f)`, and `m_ε=m_{−ε}`"; 2^{r₁} only under the unit hypothesis. |
| 1a/F05 §3.3 only for admissible κ | repaired | `README.md:438`: "For every tuple t:Hom(F,ℂ)→ℕ, admissible or not, construct … `V_{t,E}=⊗_σ Sym^{t_σ}(E²)`"; Check at t=(3,0). |
| 1a/F06, 1b/F05 gap:skew-rank asked for Mathlib's division ring | repaired | `README.md:66` asks only for the rank; `README.md:44` cites `OreLocalization.OreSet`, `IsNoetherianRing.strongRankCondition` (InvariantBasisNumber.lean:250), `nonempty_oreSet_of_strongRankCondition` (Dimension/Localization.lean:299), the `DivisionRing` instance (OreLocalization/Ring.lean:211); all exist at the pin, and `ore_eq` reads `oreDenom r s * r = oreNum r s * s` as the README says. Same sentence in `design/plan.json` `gaps`. |
| 1a/F07 AdelicAlgebraicGroups §4.2 contract | repaired | `README.md:56`: "a connected, absolutely almost simple, simply connected group G … never to `Res_{F/ℚ}SL₂`"; matches the *strong-approximation-sufficiency* bullet on main. |
| 1a/F08 CompletedCohomologyPartII §5.6 | repaired | `README.md:23` and `:462` read "§5.7" only. |
| 1b/F06 three locators | repaired | E2 "pp. 20–21", E3 "proof of Theorem 5.1, p. 21 (statement p. 16)" agree with fu24 lines 1010, 1012, 782; the serre77 entry says the pages are the printed pages of the scan (serre77 line 9 prints 1977). |

New statements introduced by the repairs (§0.4, the §4.1 definitions, the Ore paragraph, the LocallyAnalyticDistributionsPartII contract and its Checks) were recomputed; values are in the table at the end. None is wrong.

## Dependency check

Run as the brief gives it, on the README at this head:

    moved: ArithmeticLocallySymmetricSpacesPartII moved in the merge order from #180 to #199, right after its last supplier LocallyAnalyticDistributionsPartII; checked as moved (the worker moves it there when it submits)
    depcheck: 245 roadmaps, 2237 edges, 0 problem(s)

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` lists six files, all under `packages/ArithmeticLocallySymmetricSpacesPartII/`.

## The pass: statements, instances and values

### `Suggested.lean` (4 declarations, no section variables)

| Declaration | Context | Instances and values | Result |
|---|---|---|---|
| `embeddingStdRep` (def) | `{F : Type} [Field F] [NumberField F]`, σ, Γ | F=ℚ(i), γ=(i 1;−1 0): det 1, trace i under one embedding, −i under the other | real body; matches §3.1 |
| `weightRep` (def) | same, `t : (F →+* ℂ) → ℕ` | t=0: dimension 1; ℚ(i), t=(1,0): −I acts by −1; t=(n,n): −I acts by (−1)^{2n}=1; dimension ∏(t_σ+1) | real body; matches §3.1 |
| `finrank_groupCohomology_weightRep_le` | `¬IsTotallyReal F`, 𝔞≠⊥, kernel ≤ Γ; ∃C ∀t i, ∀a | t=0, i=0: 1≤C; i=0, t≠0: H⁰=0 (Γ Zariski dense); i above 3d: 0; non-conjugate t at a complex place: cuspidal part 0, boundary part bounded, right side ≥C·1; 𝔞=⊤: Γ=SL₂(O_F); F=ℚ excluded (dim H¹(SL₂(ℤ),Sym^{10})=3, Sym^{22}: 5, growth k/6 against constant C) | true as typed; hypothesis needed |
| `bianchi_groupCohomology_linear_growth` | `[IsTotallyComplex F]`, finrank 2; ∃c C, 0<c, ∃n₀ | ℚ(i), Γ=SL₂(ℤ[i]): slopes 5/24±1/8 = 1/3, 1/12; n=0: H¹=0, so n₀ needed; degree 2: H²−H¹ bounded (torsion traces on E_n bounded, −I trivial) | true as typed |

Headline theorems of the README: §2.6 (local homology), §4.2 (cusp forms and ordinary form), §5.8 (four support conventions). Stated: the ordinary forms of §4.2 and §5.8. Named as not statable in the module docstring with the missing carrier: §2.6, the cusp-form bound with §§4.3–4.4, the cuspidal, interior and compact-support forms of §5.8. No padding: one-tactic probe fails on both theorems; the two definitions are needed to state them.

### README targets

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| §0.1 B_c | m=3, c_∅=2, c_{0,2}=3, x=(2,5,4); m=1; m=2, x=(t,t) | 2+3·8=26; constant; t² unbounded by degree 1 | holds |
| §0.2 saving | x=(1,t), c_{1}=7; diagonal | 7t≤7·t/1; ≤(Σc)t^{m−1} | holds |
| §0.3 W_k | k=(1,2); k=0; p=3, k=3 | 6; 1; integral dual is divided powers (3 divides a binomial) | holds |
| §0.4 growth | m=1; α=(3,3), k=(1,t); δ=Δ₁−Δ₂ at (n,n); telescoping | 2α−α²/(k+1)≤2α; 2(t+1)≤6(t+1)+12; (n+1)² (not generic); (k+1)²−(k+1−α)²≤2α(k+1) | holds |
| §1.1–1.4 | M=A; δ=1; δ=0; ℚ_p[X,Y]/(X,Y) | dim W both sides; 0; D(k+1) excluded; controlled by A/(X) | holds |
| §2.1–2.6 | M=A^a; four-term sequence | error 0; h₁(M)=h₀(N)−ℓD+h₀(M)≤U_N+U_M | holds |
| §2.7 | M=W_k; M=A | cd 0, dim D(k+1); cd 3m | holds given the gap |
| §3.1 | (0,1), κ=6; (1,1), κ=(4,6); κ=2 | t=(2,2), dim 9, Δ=36; dim 27, Δ=144; dim 1, Δ=2^d; κ−1≥κ/2 | holds |
| §3.2 | (1 1;−3 −2) | det 1, trace −1, order 3, ≡ unipotent mod 3 | Check correct |
| §3.3–3.4 | t=(3,0) over ℚ(i); d=2 | dim 4 both realisations; dim K₀=6 | holds |
| §4.1 | r₁=0; ℚ, Γ(3), κ=4; r₁=2 | 1 pattern; m_±=1, H¹_cusp=2, dim S₄(Γ(3))=3·(−1)+1·4=1; two conjugation orbits | holds |
| §4.2–4.4 | (1,1) parallel; ℚ(i), a=n+1 versus a=1 | κ³/κ=κ²; C(n+1) versus C(n+1)² | holds |
| §5.1 | n=0; n=2; z=(1,i) | 1,2,1; (9,18,9) ranks (8,8); determinant −2i | holds |
| §5.2 | i=1,2 | max(b_i,b_{i−1})≤2c≤3c | bounds hold; equality with H_cusp is S01 |
| §5.3 | N=1: k=2,4,6,8,10,12,14,16; N=2: k=6, 8, three types; N=3, k=4, σ=ω and ω⊕ω̄; N=3, k=3 odd types | 0,0,0,0,0,1,0,1; (0,1,0) total 1 and (0,0,1) total 2 = k/2−2; ½ and 1; 2−2+0=0=dim S₃(Γ(3)) | formula holds under σ^ι≃σ; route input is S02 |
| §5.4 | ℓ=2, ν=2,3; ℓ=3 | dims 6,2 and 12,4; 4 and 2, cuspidal type of GL₂(𝔽₃) with θ of order 4 factors through S₃, so σ(S₄)=1, trace 2 | agrees with fgt10 lines 1359–1392 |
| §5.5 | principal class; ℚ(i); ℚ(√−3) | no L with ω_L(N𝔞)=−1; ν=(0,1) at n=0,1; ν=(0,0,1) | agrees with fgt10 lines 1183–1218 |
| §5.6 | u=1,2,5; u=3,7; ℚ(i), n=0 full formula | A/B=5/3, 3, 5 ≥(5/3)3^{s−1}; B=0; 1/12−1/2−1/4−1/3+1=0=dim H¹_cusp(SL₂(ℤ[i]),ℂ) | holds |
| §5.7–5.8 | Γ=SL₂(O_F); degree 2 by invariants | index 1; dim H²(Γ)≥dim H_!²(Γ′)^Q=dim H_!¹(Γ′)^Q | holds; wording of equality is S01 |
| Conventions Checks | g,h at p=3; Casimir | gh=(10 3;3 1), hg=(1 3;3 10), g⁻¹(0,1)=(−3,1); ½k²−k+2k=½k(k+2), 0 and 3/2 | correct |
| Contract Checks | λ=1, p=3; ℚ_p[X,Y] | μ=−1±√3, 1+2λ=3; ranks 1, 1, 0 | correct |
| E1–E10 Checks | E3, E5, E8, E9, E10 | (1−px)⁻¹=Σp^n x^n; geometric series; |λ_n|r^n=1; p∈𝔪²; ½ versus (1,0) | correct |

## Verified sound

- Declarations read: 4 of 4; elaborated signatures compared with README §3.1, §4.2, §5.8 (binders, hypotheses and quantifier order agree; no section variable exists to lose).
- Targets read: 31 numbered sections, 2 gap contracts, 10 source corrections.
- Locators verified against the cached texts: 42 (fu24 22, fgt10 10, marshall12 3, aw13 2, aw14 2, serre77 3); one is wrong (S06).
- Checks recomputed: 47; none false.
- Sibling citations checked: 52 section headings exist where cited (NoncommutativeAndEquivariantIwasawa 7, CompletedCohomologyPartII 5, ArithmeticLocallySymmetricSpaces 18, GL2AutomorphicRepresentationsAndTransfer 7, AutomorphicFormsOnReductiveGroups 3, ModularSymbolsPadicLFunctions 1, ModularForms 1, Chebotarev 1, AdelicAlgebraicGroups 1, LocallyAnalyticDistributionsPartII 8); 27 were read against the claim made of them.
- Pinned declarations: all 22 Mathlib names and all 7 Tau Ceti names of the contracts exist at the pins in the files named.
- Declared gaps: both slugs are in the README and in the plan's `gaps` with the same sentence and a named supplier; skew-rank is precise and minimal; canonical-dimension-zero is S03.
- Ownership against open work: checked by object with `roadmaps grep` over main and the open heads (Bianchi coefficient modules, Fu, Finis–Grunewald–Tirao, Marshall, the SL₂(ℤ) amalgam). No `Suggested.lean` name of this roadmap occurs in another roadmap. Moved notions: none.
- Policy: no pull-request number or process word in the README or the Lean file; `theorem` only; no `set_option`; imports are Mathlib and one existing Tau Ceti module.

## Not verifiable

- The 2-adic trace values of §5.4 (ν₂=2, 3): they agree with fgt10 Lemma 4.19, whose proof the source only sketches; not recomputed.
- The count `Z_F(n)` and the 2^{−|R(π)|} weighting of §5.5: agree with fgt10 Proposition 4.10; the derivation is omitted in the source.
- The step of §0.4 from genericity modulo `p^(n_δ)` to injectivity of right multiplication on `F_(k−α)`: read against fu24 lines 388–414 and 492–530 only at the level of the statement.
- Elaboration of `Suggested.lean` at this head: not run here; the last repair report records two `sorry` warnings and no error.

## Source issues

- **Misprint** in fu24 at Theorem 1.2, p. 2: the source says the minimum runs over indices up to r, the degree; it should be over the r₁+r₂ places that index the weights; affects a stated result.
- **Error** in fu24 at equation (2), p. 2, and Corollary 1.3, p. 3: the source says cusp forms are counted by compactly supported cohomology; it should be the interior or cuspidal subspace, as marshall12 §2.1 defines; affects a stated result.
- **Gap** in fu24 at equation (2), p. 2: the source says the cuspidal degree-(r₁+r₂) dimension is 2^{r₁} times the cusp-form dimension for SL₂; it should be the sum over sign patterns, equal only in pairs; affects nothing.
- **Error** in fgt10 at Proposition 4.18, p. 25: the source says the multiplicity formula holds for every σ of the right central parity; it should assume σ isomorphic to its conjugate by diag(−1,1); affects nothing.
- **Misprint** in fgt10 at Proposition 4.18, p. 25: the source says the order-three coefficient is ρ_k, a symbol it does not define; it should be μ_k of display (4.7); affects nothing.
- **Misprint** in fgt10 at Theorem 4.17, p. 25, last display: the source says the correction factor is indexed by k; it should be indexed by n as in Proposition 4.11; affects nothing.
- **Gap** in fgt10 at Corollary 4.20, p. 27: the source says it suffices that the coefficient of n+1 is non-negative; it should be strictly positive, which holds since the main constant exceeds c₂; affects the proof.

## Copyright, licences and scope

Wording: 14 passages of the README and the Lean docstrings (§0.4, §1.2, §2.5, §2.6, §3.4, §4.1, §4.2, §5.3, §5.4, §5.5, §5.6, §2.7, the two theorem docstrings) were set beside fu24 lines 89–137, 365–414 and 1150–1181, fgt10 lines 131–169, 964–986, 1183–1218 and 1272–1422, marshall12 lines 103–144, aw13 lines 3598–3628 and serre77 lines 625–627 and 5190–5198. No run of more than five consecutive shared words outside formulas and standard names. Arrangement: fu24's sections 2–7 (algebra, growth, comparison, specialisation, local, global) do not map onto Layers 0–5: its §§2, 4, 5 are supplier inputs, its §3 is one target of Layer 0, its §6 is split over Layers 1 and 2, and Layer 5 comes from fgt10. Reuse: the trace values of §5.4 and the constants of §5.6 are restated as prose facts with locators; no table or figure is taken over.

Source independence: 14 passages compared with 5 sources, none shared; largest share fu24, 33 of 51 locators; contents compared with fu24: independent.

## For the human reviewers

- **Licence.** aw14 and aw13 are read from the authors' university pages (`sources.toml`, `licence_class = "author-page"`); page numbers in the README are those of these versions, and the extraction prints "≥" as ">".
- **Scope.** After the round-1 repair the roadmap sits after LocallyAnalyticDistributionsPartII (merge order line 199) and so after BianchiModularForms (line 197); S04 proposes a citation of the latter. Whether that order is wanted is a board decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0d8cb33eae60e28948f7c6114429a97e7481ef65", "job": "RT-ArithmeticLocallySymmetricSpacesPartII~2a", "model": "fable", "worker": "chris-x79"} -->
