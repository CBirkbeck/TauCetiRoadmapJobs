# Review of NoncompactQuantumSymmetry (pull request #1015 at 04e6334)

**Verdict:** needs changes

This is a full review. The head is the same as at the previous review, and nothing in the folder changed. The gate passes, the dependency check reports no problems, and `Suggested.lean` elaborates with its five `sorry` warnings and nothing else. Every sampled locator that could be read legally matches its source.

There are five findings:
- one P2, new this round: a supplier citation that the open CompactGroups revision breaks, for objects that the pinned Tau Ceti already declares;
- four P3, two of them carried from the previous review.

## R01 (P2) — CompactGroups Layers 1/4 are cited for what the pinned Tau Ceti declares, and the open CompactGroups revision repurposes those layers

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md`:
- `:104` reads "CompactGroups Layers 1/4 supply unitarization/coefficient orthogonality";
- the same layer numbers are cited at `:4162` ("CompactGroups Layer 4 coefficient orthogonality"), `:9066–9067` and `:9153`;
- the gap locator "CompactGroups Layer 5 (`gap:banach-gfinite-density`)" appears at `:9`, `:95`, `:675`, `:972`, `:1023` and `:1085`.

**Claim:** these are supplier citations (of M6's Young fields and of M5.CompactInductionSupport) by main's layer numbers, for content that is no longer in those layers:
- The open CompactGroups revision (#1047, head 5ccf6cc) makes unitarization and Schur orthogonality base-library inputs (`:11–19`).
- It answers the gap at its §2.1 (`:411–490`), and its Layer 5 becomes compact abelian Fourier theory (`:641`).
- Independently of the revision, the content is declared at the pin: also `ContRepresentation.exists_isUnitary_congr` (`Compact/UnitaryModel.lean:88`) and `ContRepresentation.schur_orthogonality_basis` (`Compact/SchurOrthogonality.lean:122`). The supplier contracts must cite such declarations by name.

**Witness:** Main CompactGroups: Layer 1 "unitarizability" (`:226`), Layer 4 "Schur orthogonality" (`:295`). Revision #1047: Layer 1 "invariant Hermitian metrics" (`:286`), Layer 4 "characters of arbitrary products" (`:565`). Pin: `ContRepresentation.isUnitarizable` (`TauCeti/RepresentationTheory/Compact/Unitarizable.lean:241`), `ContRepresentation.schur_orthogonality_self` (`Compact/SchurOrthogonality.lean:104`).

**Repair:**
- Add the four declarations above to "From Tau Ceti" (`:58–65`), with their files.
- At `:104`, `:4162`, `:9066–9067` and `:9153`, replace "CompactGroups Layer(s) 1/4" with those names.
- Optionally, cite Peter–Weyl at `:16` and `:5955` as `TauCeti.stdPeterWeylBasis` (`Compact/PeterWeyl.lean:713`).
- At the six gap citations, write "CompactGroups (`gap:banach-gfinite-density`)" with no layer number. That is correct both on main, where the gap is open, and at the revision, where §2.1 answers it.

Checked on the refuting instance: after the change, each cited object resolves at this pull request's own Tau Ceti pin. None of them depends on either numbering of CompactGroups, and no new revision dependency arises.

## R02 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision, which the description does not name

Re-raised: R01 of the previous review at 04e6334. No repair report marks it as not actionable.

**Location:** README:
- D1.BorelPrefix at `:19`, `:96`, `:179`, `:254`, `:285`, `:303`, `:374`, `:1091`, `:1376`, `:1404`, `:1414–1415`, `:1438`, `:1440`, `:1658`, `:1680`, `:1704`, `:1991` and `:4087`;
- D1.TwistedBorel at `:19`, `:96`, `:1686` and `:1991`;
- D4.Harmonic at `:19`, `:96`, `:140` and `:165`.

The description's line reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145".

**Claim:** these ids resolve on main, or the revision that defines them is named so that it merges first. The overlap tool lists only the first two; I confirmed D4.Harmonic by hand.

**Witness:** Main OperatorAlgebraDynamics has only D1–D9 (`:75–627`), with no BorelPrefix, TwistedBorel or Harmonic. They are headings at the open revision #1137, head 08edaf5 (`:999`, `:1104`, `:1958`). Neither the revision line nor the merge-order chain names #1137.

**Repair:** nothing in the folder changes.
- Name #1137 (OperatorAlgebraDynamics) in the revision-dependency line, next to #1145, and in the merge-order chain before this pull request.
- In the same edit, the description's M0 paragraph should credit the CompactGroups gap with the finite-orbit predicate, the submodule and the Banach density, as the README does at `:9` and `:95`. It should credit AutomorphicFormsOnReductiveGroups §2.1 only with `IsKFinite`.

## R03 (P3) — M4.ParticleLabels states no conclusion and has no locator

**Location:** README `:2396–2400`: "Derive which little-group data yield massive spin, helicity, and continuous-spin models. Separate the two null-orbit time orientations and impose positive energy as an additional spectral restriction."

**Claim:** this is a theorem target consumed by name, for example by "Opposite-energy massive inputs" at `:6612–6614`.

**Witness:** the block names no stabilizer, no label and no positive-energy set, and it cites no source. Those data appear only in M4.SL2R (`:2261`, `:2263–2274`), and the spacelike exclusion only at `:3088–3090`.

**Repair:** state the conclusion for the connected cover `ℝ⁴⋊SL(2,ℂ)`:
- **Timelike orbit:** an irreducible with joint translation spectrum on a timelike orbit of mass m>0 and orientation ε_E is `P_(m,j)^ε_E`, with SU(2) label j∈½ℕ₀.
- **Null orbit:** an irreducible with spectrum on a null orbit of orientation ε_E is one of two kinds:
  - `F_h^ε_E`, with the translation-trivial Δ-character exp(ihθ), h=ℓ/2∈½ℤ;
  - `C_(ρ,e)^ε_E`, with ρ>0 and e∈{0,½}.
- **Positive energy:** joint spectrum in the closed forward cone holds exactly for the future timelike, future null and zero-orbit models.

Cite Mackey1958 Theorems 8.1 and 9.1, as `:3002` already does.

Checked on the instances: `F_h^+` has spectrum in the closed future null cone, inside V̄₊. `S_(r;τ)` has energy spectrum ℝ (`:3088–3090`), so it is excluded.

## R04 (P3) — Two supplier locators point to the wrong place

**Location:**
- README `:98`: "RiemannianGeometry R1/R2/R4, [HopfRinow](../HopfRinow/README.md)".
- README `:792`: "LieGroups Layer 2 (exponential and BCH analytic charts)".

**Claim:** both locate a supplier: the Hopf–Rinow roadmap for complete closed-ball compactness, and LieGroups for BCH analytic charts.

**Witness:** `TauCetiRoadmap/HopfRinow/` exists neither on main nor in this tree. The roadmap is at `Completed/HopfRinow/README.md`, as GeometricCurrents `:18` links it. In main's LieGroups, Layer 2 is the closed-subgroup theorem (`:275`) and BCH is Layer 3 (`:300`, `:321`).

**Repair:**
- Change the link to `../../Completed/HopfRinow/README.md`. It then resolves, from this README's folder, to the archived roadmap.
- Change `:792` to "LieGroups Layers 0 and 3 (exponential map; BCH and the analytic local group law)".

## R05 (P3) — Size

Re-raised: R02 of the previous review at 04e6334. No repair report marks it as not actionable.

**Location:** the folder. The README has 9,184 lines (669,915 bytes). M5 (`:3565–6201`) has 2,637 lines and M6 (`:6202–9156`) has 2,955.

**Witness:** the figures are unchanged and no Part II folder exists. Main has longer roadmaps (PerfectoidSpaces, 17,700 lines), so the request rests on scope: the M5 all-sequence and M6 pair, exchange and tree tables exceed every consumed interface.

**Repair:** as before.
- Move M5.DeSitterNullZero (`:5084`), M5.DeSitterRemainingTransitions (`:5388`), M5.StructuralModelComposition (`:5744`) and the M6 tables after M6.MeasuredPair (`:6204`) into "NoncompactQuantumSymmetry, Part II".
- Its introduction should say that the base roadmap stops at M5.DeSitterFiber (`:4679`) and the M6.MeasuredPair interface.

## Previous findings

- **R01 — not repaired.** The description still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145". `:96` still cites "OperatorAlgebraDynamics D1.BorelPrefix, D1.TwistedBorel, D4.Harmonic". This is carried as R02 above.
- **R02 — not repaired.** The README has 9,184 lines and there is no Part II folder. This is carried as R05 above.

## Verified sound

**Gate.** I ran it on this head:

`gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The worker's gate file records the same, plus `build=0`. Nothing outside the folder changed. The worktree is clean.

**Dependency check.**

`depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`

There are no UPWARD, CYCLE or moved lines. QuantumFoundations (merge-order line 210) and RelativisticQuantumFieldTheory appear only as consumers (`:9157–9165`).

**Build.** `lake env lean` on `Suggested.lean` takes 7.2 s. It warns `declaration uses sorry` at `:75`, `:88`, `:100`, `:116` and `:189`, and nothing else.

**Signatures.** All five "looks dropped" leads in the worker's signature file are `[IsClosed (H : Set G)]`. Each elaborated type carries `[IsClosed ↑H]`, so the leads are false.

**Padding probe.** I ran `first | rfl | simp | infer_instance | aesop | exact?` on a scratch copy. It closes none of the five theorems. The five definitions are exactly those that the two headlines `wigner_reconstruction` and `exists_inducedRepresentation` mention.

**Headlines.** These are stated:
- Wigner (P.1);
- Whitehead one and two (P.4);
- Becker–Kechris realization (M1);
- the induced representation on `Lp` (M1).

The module docstring names every other headline as not statable, with its missing carrier. Each Lean name occurs in the README. AffineLieAlgebras on main states the complex case (`complexWhitehead_one/two`, `Suggested.lean:45`, `:57`) and names this roadmap's P.4 as the characteristic-zero extension (`README.md:1170`), so ownership agrees.

**Library declarations opened at the pins:**
- Mathlib `LieModule.Cohomology.oneCochain` (`Mathlib/Algebra/Lie/Cochain.lean:43`), `d₁₂` (`:101`, with ⁅x,f y⁆−⁅y,f x⁆−f⁅x,y⁆) and `twoCocycle` (`:156`);
- Mathlib `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:55`, a monoid hom with no orbit continuity);
- the Cartan-criterion and semisimple-radical instances (`Algebra/Lie/CartanCriterion.lean:33`, `Killing.lean:89–90`);
- the four Tau Ceti declarations of R01 and `TauCeti.stdPeterWeylBasis`.

**Seeded sample (15 targets): sources checked at their locators.**

| Target | Locator | Source, as read |
| --- | --- | --- |
| M2.InducedRefinement `:1960` | Echterhoff2010 Rem. 5.10(2) p.20, Thm 7.10 p.38 | Echterhoff2010 line 975–978 (induction in steps in Corr), line 1938–1943 (Green's induction in stages). The README says these do not give the parameterized refinement, which is correct. |
| M4.ParticleLabels `:2396` | none | R03 |
| Continuous spin `:3042`; Actual stabilizer geometry `:3092`; Endpoint crosswalk `:3505` | derived; M4.Endpoints cites Gel'fand–Naimark §8 | computed (rows 158–162); Gel'fand–Naimark was not re-read this round |
| Fixed-label rows `:5007`; Every moving zero-orbit row `:5343` | M5.ScalarLorentzBranching: Möllers–Oshima §§2–4, Lemma 2.2, Thm 4.1, measure before Cor. 3.5 | MoellersOshima2012 line 176–207 (branching, discrete iff k<(\|σ\|−n+m)/2), line 728 (Lemma 2.2, p.17), line 1129–1142 (`dm_(σ,μ)`, Cor. 3.5, p.26), line 1231 (Thm 4.1, p.28) |
| Dixmier labels used by both rows `:3588–3591` | Dixmier Eq.(12) p.12, pp.27–28 | Dixmier1961 line 659 (σ>¼, half-integral p), line 679–682 ((53)–(55)), line 711–713 (Ω′ values), line 714–723 (corrections of the earlier tables) |
| M5.PrincipalTwoSheet `:5912` | Primet §2.7 p.12, §4 p.14, theorem pp.15–16 | Primet1983 line 209 (χ_λ(a_t)=e^{itλ}), line 352 (§2.7, printed 12), line 403–429 (§4, printed 14), line 438–446 (theorem: limit a.e., uniform on compacts, u₁(m)=u(wmw), printed 15) |
| Euclidean adapters `:6467`; two opposite-energy null `:6866` | derived | computed (rows 169–171, 174) |
| Opposite-energy massive `:6610` | Lang Ch. VIII pp.163–177 | not verifiable; computed (rows 172–173) |
| Identical spacelike exchange `:7948` | Groenevelt §2 (2.1)–(2.3) | Groenevelt2003 line 123 (recurrence), line 128–132 (₄F₃), line 145–152 (orthogonality with residue atoms) |
| M6.PairField `:8757`; change of normalization `:8936`; normalization transport `:9100` | Echterhoff2010 Rem. 5.10(2) p.20 | as above; computed (rows 176–179) |

**Headline locators:**
- Freed2012Wigner line 97 (sequence (7)), line 99–100 (Theorem 8), line 109–113 (Example 10) and line 12 (separable H, as the README says).
- BeckerKechris1993 line 79–85 (Theorem 1.1 and its reformulation: a Polish topology with the same Borel structure making the action continuous) and line 221 (§4).
- Also checked: Echterhoff2010 line 991 ((5.4), p.20) and line 1110 (Prop. 5.16, p.23), for `:4163`.

**Adversarial table.** Rows 1–147 of the earlier reviews remain on record for statements this head leaves untouched. The rows below cover the sample, the headlines and the findings. All signs and conventions are the README's.

| # | Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 148 | `wigner_reconstruction` | H=ℂ; H=ℂ² with coordinate conjugation C | ℂ: one ray, U=id gives disjunct 1; ℂ²: C acts on the Bloch sphere by (x,−y,z), det −1, outside SO(3)=image of U(2) | Pass: both disjuncts needed |
| 149 | P.1 Checks `:204–206` | e₁/e₂; e₁/e₁+e₂; 2e₁/i(e₁+e₂) | 0; 1/(1·2)=½; \|2i\|²/(4·2)=½ | Pass |
| 150 | kernel 𝕋·Id iff dim≥2 `:218–224` | λC on ℂ²; ℂ | C(e₁+ie₂)=e₁−ie₂, not proportional; on ℂ every element fixes the one ray | Pass |
| 151 | `whitehead_one` | f=⁅·,v⁆; L=ℝ abelian, V=ℝ trivial, f=id | d₁₂f=⁅x,⁅y,v⁆⁆−⁅y,⁅x,v⁆⁆−⁅⁅x,y⁆,v⁆=0; abelian case: d₁₂f=0 but ⁅x,v⁆=0≠f | Pass: sign matches Mathlib, IsSemisimple needed |
| 152 | `whitehead_two` | L=ℝ² abelian, V=ℝ, c=det | d₂₃c=0; d₁₂f=−f⁅x,y⁆=0≠det | Pass: hypothesis needed and present |
| 153 | `exists_polishTopology_continuousSMul` | G trivial; source | any Polish topology generating the Borel σ-algebra works; BeckerKechris1993 line 83–85 is the same statement | Pass |
| 154 | `exists_inducedRepresentation` | norm; cocycle; H=G; H={1}, s=id, Haar | ∫r‖F(g⁻¹x)‖²dμ=‖F‖² for r=d(g_*μ)/dμ; c(g,x)c(h,g⁻¹x)=c(gh,x); H=G: U=σ; H={1}: c≡1, r≡1, left regular | Pass |
| 155 | M2 Examples `:1987` | shear t·(a,b)=(a+tb,b) | b=1: orbit ℝ×{1}, stabilizer {0}; b=0: stabilizer ℝ, labels (a,τ) | Pass |
| 156 | null label `:2188` | r_θ=exp(−θJ₀₁) | iθσ_z/2 ↦ diag(e^{iθ/2},e^{−iθ/2}); off-diagonal ×e^{iθ} gives (x₀cosθ+x₁sinθ, −x₀sinθ+x₁cosθ, x₂, x₃); U(r_θ)=e^{iℓθ/2} gives Ĵ₂=ℏℓ/2 | Pass |
| 157 | M4.ParticleLabels `:2396` | data at `:2261` | SU(2) j∈½ℕ₀; Δ: ℓ∈ℤ with centre (−1)^ℓ, or radius r>0 with stabilizer {0,2π}; spacelike energy spectrum ℝ | statement missing: R03 |
| 158 | continuous-spin carrier `:2969–2990` | f(φ+2π)=η_e f(φ) | J₀²f=f(φ−2π)=η_e f; J_C R f=conj f(φ−π)=J₀f; R J_C f=conj f(φ+π)=η_e J_C R f; A₀²=u_e²=η_e; B₀A₀=conj(u_e)η_e RJ_C=u_e RJ_C | Pass |
| 159 | continuous-spin table `:3042–3062` | F_E=ker(ε+t_F) | (0,1): F; (1,0): {1,ST}; (1,1): {1,T}; c=1, β_eff=±1: two 1-dim or two 2-dim; c=−1: one 2-dim | Pass |
| 160 | stabilizer geometry `:3095–3121` | Q_sp=J_alt `:2297`, k, C₀ | C₀(−iX)C₀⁻¹=[[0,1],[−1,0]]; C₀⁻¹kC₀=k_{π/2}; Q²=−I; Qk=−kQ; L(Q)=diag(1,−1,−1,1), so (0,0,r,0)↦(0,0,−r,0); Ad X: J,H₀,X ↦ −J,−H₀,X | Pass |
| 161 | b_f squares `:3109` | S with a=1 and a=0; ST | Qk⁻¹Qk⁻¹=(−k)k⁻¹=z; k⁻²=z; a+r+ar=1; ST: z^a | Pass |
| 162 | endpoint crosswalk `:3505–3530` | e^{−2πi⟨x,ξ⟩} (`:4995`) | F(∂_zφ)=πi conj(ξ)φ̂; U₋=(1/π)∂_z; U₊=−π∂_{z̄}⁻¹; for both signs U_±CU_±⁻¹: ψ̂↦(conj ξ/ξ)conj ψ̂(−ξ) | Pass |
| 163 | scalar complementary row `:5029` | MO n=3, m=2, σ=2λ | discrete iff k<λ−½: k=0 iff λ>½, τ=2λ−1=2s; k=1 needs λ>3/2 | Pass |
| 164 | π_(p,0) row | σ=2P+1 | τ=2+2u−2k−4j: k=0 gives L=P,P−2,…; k=1 gives P−1,P−3,…; together 1…P once; (0,2) has no even τ | Pass |
| 165 | principal row | Ind_{SU2}D_p | P_(m,ω) has K-types j≥\|m\|/2 with integer gap, so \|m\|≤2p, m≡2p | Pass |
| 166 | moving row `:5353–5365` | σ=¼−λ²∈(−2,0) | λ∈(½,3/2); η_s→0 iff λ−½→s; η(P_(2,0))=3/2−λ→0 iff s↑1, whose limits are {1,P_(2,0)} | Pass |
| 167 | Dixmier values `:3588–3591` | Ω, Ω′ | (53)–(55) and Ω′ values agree with the README | Pass |
| 168 | M5.PrincipalTwoSheet | Primet, n=3 | SO₀(1,4)→ℝ⁴⋊SO₀(1,3), M=SO(3); λ_r=−m/r is U_{u,−ρ/r} | Pass |
| 169 | adapter item 2 `:6481` | sphere of radius η | z=±√(η²−κ²); dA=ηκ/√(η²−κ²); two sheets | Pass |
| 170 | adapter item 3 `:6487` | circles a, b | (2ab sinφ)²=((a+b)²−κ²)(κ²−(a−b)²) | Pass |
| 171 | items 4–5 | line, restriction | κ=√(t²+λ²), dt=κdκ/√(κ²−λ²); λ=a cosθ, density 1/√(a²−λ²); B⊗C range \|λ\|<min(ζ,κ) | Pass |
| 172 | opposite massive `:6655` | q(t), j₁=j₂=½ | q(0)=Δ_m²; q=0 at t=\|log(m₁/m₂)\|; w_{±2}=1, w₀=2, d=4, A₂=1, N₀=2, N₁=4 | Pass |
| 173 | Ind χ_n `:6673` | n=3; n=0 | D₃⁺ only, I_(1,iν); n=0: no discrete; (1+ν²)/4 and l(2−l)/4 | Pass |
| 174 | opposite null `:6897` | p₁, p₂ | sum (0,0,r,0); Qr_θQ⁻¹=r_{−θ} gives weight −h₂; n=2(h₁−h₂); measure scales λ⁴, so r³dr | Pass |
| 175 | identical spacelike `:7969` | trivial τ | r<2a: one sheet, parity (−1)^k on D_{2k}, so Sym has L≡0 mod 4 and Λ has L≡2 mod 4; r>2a: sheets swapped, giving V^(1) in each; timelike (−1)^J=s_X | Pass |
| 176 | pair normalization `:8819` | Z, w | (3): ½, ⅓, √3; (1,3) one layer: (¼,¾); two layers: Z=¾, w=(⅔,1/9), giving (⅔,⅓); three singletons: (4/7,2/7,1/7) | Pass |
| 177 | root measure `:8885` | leaves (½,½,1) | (1/6,2/3,1/6), (¼,½,¼), average (2/9,5/9,2/9); r=(¾,6/5,¾), (9/8,9/10,9/8); κ at root 1: (¾,¼) | Pass |
| 178 | change of normalization `:8952` | atoms (1,3) | t=(8/3,4/9); t^{−½}=(√(3/8),3/2); (3/8)(⅔)=¼, (9/4)(⅓)=¾; ρ′=kρ, r′=kr/h_B, κ′=(f/k)κ | Pass |
| 179 | transport `:9100` | F′=U_R F U_L⁻¹ | F is decomposable in c, so the factors h_B^{∓½} cancel; range(We₁₁W⁻¹)=W·range(e₁₁) | Pass |
| 180 | R01 | CompactGroups on main and at #1047 | Layer 1/4 = unitarizability/Schur on main, but metrics/products at #1047; both declarations present at the pin | Fail: R01 |
| 181 | R04 | the HopfRinow link | absent on main and in this tree; `Completed/HopfRinow` present | Fail: R04 |

**Cross-roadmap citations resolved:**
- OperatorAlgebraDynamics D1, D3 and D5 on main (`:75`, `:205`, `:277`), and the three revision ids of R02.
- CompactGroups on main and at #1047, including its `Suggested.lean` `IsGFinite` (`:52`), `gFiniteSubmodule` (`:59`) and `gFiniteSubmodule_dense` (`:101`).
- AutomorphicFormsOnReductiveGroups (#1037): the gap at `:51`, `:301` and `:307–308`.
- InductionRestriction Layer 2.1 (main `:346`, `Suggested.lean:729`). This settles the citation tool's `Gassmann` lead; its other three leads are this roadmap's own declarations.
- UnboundedOperators UO-B04 (`:295`) and UO-B05 (`:313`) at #1027.
- SmoothBanachRepresentations Layers 0–4 at #1145 (`:76–286`).
- PseudodifferentialOperators P5 (`:928`) and P6 (`:1485`).
- LaguerreJacobi Parts A and B (`:220`, `:278`).
- MetaplecticAutomorphicForms 0.1–0.13 (`:78–240`).
- On main: RiemannianGeometry R1, R2 and R4 (`:179`, `:300`, `:607`); SpinRepresentations Layer 7 (`:881`); VonNeumannAlgebras V4.Normality and V4.0.Decomposition (`:244`, `:1279`); LieGroupoidsPoisson G0.0 (`:261`); AffineLieAlgebras A1 (`:150`); SelfAdjointSpectralTheory SA-B85 (`:132`); LieGroups (numbering unchanged at #1051).

**Ownership against the closest open roadmaps:**
- QuantumFoundations (#1771) cedes Wigner's theorem, `UA(H)` and `PUA(H)` to P.1 (`:22`, `:65`, `:817`).
- RelativisticQuantumFieldTheory (#1772) consumes M4 (`:3836`).
- QuantitativeOrbitMethod (#1842) consumes M0 (`:244`, `:585`).
- OperatorAlgebraDynamics (#1137) owns the Borel and Fourier objects, and this README cedes them (`:19`).

No object has two owners. Ownership against open pull requests whose files were not provided was not checked beyond these.

## Not verifiable

- **Mackey1958** (Acta Math. 99, DOI 10.1007/BF02392428): the sources service resolves it only to a paywalled page, so it is uncertified. It covers Theorems 8.1 and 9.1 at `:3002` and `:7256`.
- Parthasarathy 1969 (CMP, paywalled), §§3–5.
- Books not held:
  - Lang *SL₂(ℝ)*, Ch. VIII, pp.163–177;
  - Weibel1994, Cor. 7.8.10 and 7.8.12;
  - Kechris1995, Thm 9.10.
- Gel'fand–Naimark 1947 §8 and the p.457 footnote, which the endpoint crosswalk uses through M4.Endpoints. I did not re-read it this round, and an earlier review records that the OCR of Eq. 188 is illegible.
- Dooley and Grundling course notes: no legal source.
- The README flags no locator as unverified.

## Source issues

- **Error** in Freed2012Wigner at sequence (7), p.3: the source says the scalars 𝕋 are exactly the kernel of G(H)→Aut(PH) for every H, finite or infinite dimensional; it should require dim H≥2, since for H=ℂ complex conjugation also acts trivially; affects nothing.
