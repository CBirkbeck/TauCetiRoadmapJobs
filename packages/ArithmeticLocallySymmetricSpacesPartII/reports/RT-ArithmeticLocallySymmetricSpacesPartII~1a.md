<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13108#issuecomment-6894220676 -->
Red team round 1 pass a (claude) of 8ac6e0e

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) LieHighestWeight Layer 0 does not contain the sl₂ classification it is cited for

   - **Location.** `README.md:9` ("LieHighestWeight Layer 0 owns split characteristic-zero sl₂ highest
     weights"), `README.md:114` ("Consume Layer 0’s split characteristic-zero sl₂ highest-weight
     classification, irreducibility and dimension n+1"), and the `*Needs:*`/Dependencies lines at
     `README.md:198`, `217`, `569`, `698`.
   - **Claim.** Layer 0 of LieHighestWeight supplies the sl₂ classification, irreducibility and
     dimension.
   - **Witness.** LieHighestWeight on main: Layer 0 is "normalized rank-one tensor comparisons" with the
     single section 0.1; its supplier table (README line 77) says the classification is Tau Ceti
     `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` etc., "the present Layer 0 holds the normalized
     tensor comparisons built on them".
   - **Repair.** Delete every "LieHighestWeight Layer 0" citation. In `### From Tau Ceti` add: "Use
     `TauCeti.exists_isIrreducible_hasPrimitiveVectorWith` in TauCeti/Algebra/Lie/Sl2/Standard.lean
     (for every n an irreducible sl₂-module with a primitive vector of weight n),
     `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` in TauCeti/Algebra/Lie/Sl2/WeightString.lean
     (its dimension is n+1) and `TauCeti.exists_int_of_hasEigenvalue` in
     TauCeti/Algebra/Lie/Sl2/Spectrum.lean (integrality of h-eigenvalues)." Replace the subsection
     `### From TauCetiRoadmap.LieHighestWeight` by: "Consume §5.1 for self-duality of the sl₂-module
     V(n) with its alternating (n odd) or symmetric (n even) invariant form, and §3.1 for the PBW
     interface." In §0.3, §5.1 and both Dependencies lines replace "LieHighestWeight Layer 0" by the
     three Tau Ceti names. Tested: n=1 gives dimension 2 and an alternating form, as the README's
     §0.3 route uses; all three declarations exist at the pin (files and lines above: Standard.lean
     1086, WeightString.lean 324, Spectrum.lean 151).

2. **F02** (P2) Three analytic gaps, and the action quotient of §0.3, are already planned by LocallyAnalyticDistributionsPartII; the fourth gap asks its supplier to build on its own consumer

   - **Location.** `README.md:64`, `72`, `80`, `88` (gaps flat-microlocalisation,
     algebraic-quotient-comparison, integral-central-faithfulness, generic-cyclic-growth, all
     "Supplier section: Layer 0, after §0.15" of NoncommutativeAndEquivariantIwasawa); `README.md:185`
     ("Prove that its rational action has image `End_{ℚ_p}(W_k)`").
   - **Claim.** These are missing everywhere and NoncommutativeAndEquivariantIwasawa Layer 0 should
     build them; §0.3 owns A/Ann_A(W_k)≃End(W_k).
   - **Witness.** Open roadmap LocallyAnalyticDistributionsPartII (new folder): §3.4 (K[[G]]→Û(h)_K,
     flat on both sides), §3.10 (M_W→M̂_W isomorphism, natural in M), §4.14 (ℚ_p[[G₁^m]]→Û(g)_λ
     injective for all λ∈ℤ_p^m), §5.2 (iii) (K[[G]]/Ann(W_k)≅End_K(W_k)); its "Downstream consumers"
     names Fu's Theorems 1.2–1.4 as importers. It consumes NoncommutativeAndEquivariantIwasawa Layer 0.
   - **Why it is a defect.** Two owners for one object (the gap makes NoncommutativeAndEquivariantIwasawa
     a second builder of what the sibling plans), and Û is owned downstream of the named supplier, so
     gap:generic-cyclic-growth as assigned needs NoncommutativeAndEquivariantIwasawa Layer 0 to use its
     own consumer's carrier. LocallyAnalyticDistributionsPartII excludes Fu §3 growth ("Applications
     outside this roadmap"), so that estimate has no owner but this roadmap.
   - **Repair.** (1) Remove the three paragraphs "What NoncommutativeAndEquivariantIwasawa must provide
     (gap:flat-microlocalisation | gap:algebraic-quotient-comparison | gap:integral-central-faithfulness)"
     and their slugs from the plan's `gaps`; keep their Checks under a new subsection:
     "### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII — Consume §0.2 for the first congruence
     subgroup of SL₂(ℤ_p) and its products; §2.1 for Û(h)_K; §§3.4 and 3.7 for the microlocalisation
     ℚ_p[[G]]→Û, flat on both sides, and M̂=Û⊗_A M; §3.10 for the isomorphism
     M/Ann_A(W)M→M̂/Ann_Û(W)M̂, natural in M; §4.1 for the central specialisations Û/(Δ_i−λ_i)_i;
     §4.14 for injectivity of A→Û/(Δ_i−λ_i)_i at every λ∈ℤ_p^m; §5.2 for absolute irreducibility and
     self-duality of W_k on every open subgroup and A/Ann_A(W_k)≅End_{ℚ_p}(W_k)."
     (2) In §0.3 replace the sentence "Prove that its rational action has image …" and the Burnside
     route by "The action quotient A/Ann_A(W_k)≅End_{ℚ_p}(W_k) is LocallyAnalyticDistributionsPartII
     §5.2 (iii)"; keep the two p=3 Checks.
     (3) Turn gap:generic-cyclic-growth into a target of Layer 1 owned here, with the same statement
     and locators and "*Needs:* LocallyAnalyticDistributionsPartII §2.1; §4.1; Tau Ceti
     `Module.Basis.pbwBasis`", and remove its slug from `gaps`.
     (4) Replace the four `gap:` entries in the `*Needs:*` of §1.2 and the Layer 1 Dependencies by
     these sections. LocallyAnalyticDistributionsPartII does not cite this roadmap (0 occurrences) and
     its roadmap suppliers that are in the merge order sit at lines 30, 33, 45 and 79, so no cycle
     arises; it is at line 199, after this roadmap's line 180, so the movable placement must put this
     roadmap after it. If the board does not allow that move, the alternative is to restate the four
     gaps with supplier LocallyAnalyticDistributionsPartII (same sections), not
     NoncommutativeAndEquivariantIwasawa.
     Tested on the README's own instance M=A, k=(1,2): the sibling's §3.10 gives both quotients
     End(W_k), dimension 36, as `README.md:76` requires.

3. **F03** (P2) aw14 §5.4 is misread: it allows deformation index n=0, so the first congruence kernel is covered

   - **Location.** `README.md:80` ("aw14 covers deformation index n≥1 directly, and the first congruence
     kernel has index zero") and `README.md:793` ("§5.4 assumes … with n>0, which … excludes the first
     congruence kernel").
   - **Claim.** aw14 Theorems 4.6 and 5.4 do not apply to ker(SL₂(ℤ_p)→SL₂(𝔽_p)).
   - **Witness.** The extraction prints every "≥" as ">": aw14 line 365 defines the n-th deformation
     as a sum over "i>0" of π^{in}F_iA, which must include F₀A∋1; line 256 runs an induction "for all
     n>0" starting at π⁰. The file contains no "≥" at all. aw14 line 737 gives the example level
     p^{n+1}; fu24 line 169 says Theorem 1.5 follows from these two theorems.
   - **Repair.** `README.md:80`: replace the parenthesis's last clause by "aw14 §5.4 takes any
     deformation index n≥0; the first congruence kernel is the case n=0, level p^{n+1}=p". 
     `README.md:793`: replace from "with deformation index n≥1" to the end of the entry by "§5.4
     assumes `p^n 𝔤=(1/p)R⊗L_G` for an integer n≥0, which covers the congruence kernels
     `ker(G(O_L)→G(O_L/p^(n+1)))` for every n≥0, the first congruence kernel being n=0; odd p is very
     good for type A₁." Tested at G=G₁, p=3: (1/p)L_G=sl₂(ℤ₃)=p⁰𝔤, so n=0 satisfies the hypothesis as
     printed with ≥.

4. **F04** (P2) The cusp-form space S_κ(K_f) is never defined and has no owner

   - **Location.** `README.md:495` ("giving `dim H_cusp^q(Y(K_f),V_κ)=2^{r₁}dim` S_κ(K_f)") and the
     headline `README.md:509`; `Suggested.lean:33` says the carrier "does not exist at the pins".
   - **Claim.** §4.1–§4.4 are theorems about S_κ(K_f).
   - **Witness.** `grep "S_κ"` in the README returns only uses (lines 13, 17, 432, 495, 509, 529, 538,
     542); no target defines it and no `*Needs:*` line names an owner. Wrong models not excluded: all
     cohomological π (gives 2^{r₁} times too much), or forms of weight κ_v at complex v in a
     different normalisation (κ_v versus κ_v/2).
   - **Repair.** Add to §4.1, before the identity: "Define S_κ(K_f)=⊕_π m_cusp(π)·π_f^{K_f}, the sum
     over cuspidal automorphic representations π of SL₂(𝔸_F) whose component at each real v is the
     holomorphic discrete series of weight κ_v and whose component at each complex v is the unitary
     principal series of SL₂(ℂ) induced from diag(z,z⁻¹)↦(z/|z|)^{κ_v}, the infinite-dimensional
     irreducible unitary representation with nonzero relative Lie algebra cohomology in
     `Sym^{κ_v/2−1}(ℂ²)⊗conjugate Sym^{κ_v/2−1}(ℂ²)`; m_cusp is the multiplicity in the cuspidal
     spectrum of ArithmeticLocallySymmetricSpaces §ALS.5b.5. (marshall12, §2.1, p. 3; fgt10, §3.3,
     (3.9), p. 17.)" with Checks: at F=ℚ, K_f=SL₂(Ẑ), κ=12 the dimension is 1 (Δ) and
     H¹_cusp has dimension 2=2^{1}·1; at F=ℚ(i), κ=2(n+1) the complex component is π_{2n+2,0} of
     fgt10 (3.9); replacing the holomorphic series by both discrete series of weight κ_v doubles the
     count at each real place and contradicts the factor 2^{r₁}. Tested on F=ℚ, κ=12: 2·1=2=dim
     H¹_par(SL₂(ℤ),Sym^{10}), and the README's own Check at `README.md:522` (dim H¹=3 with the
     Eisenstein class) agrees.

5. **F05** (P2) §3.3 is stated for admissible κ only, but the headline of §4.2 uses it for every embedding tuple t

   - **Location.** `README.md:447` ("Construct the algebraic local system `V_{κ,E}` … Its complex scalar
     extension is V_κ and its p-adic extension is W_t with t from §3.1") against `README.md:513`
     ("Apply §3.4 for every t∈ℕ^d, the realization comparison of §3.3").
   - **Claim.** §3.3 supplies the ℂ/ℚ_p dimension comparison needed by
     `finrank_groupCohomology_weightRep_le`, which quantifies over all `t : (F →+* ℂ) → ℕ`.
   - **Witness.** F=ℚ(i), t=(3,0): no even κ has embedding tuple (3,0) (a complex place forces
     t_σ=t_σ̄), so §3.3 as stated gives no E-form of `weightRep Γ t` and no comparison with W_{(3,0)}.
   - **Repair.** In §3.3 replace "containing the embeddings needed for V_κ" … "W_t with t from §3.1"
     by: "Choose a number field E containing the normal closure of F, with embeddings E→ℂ and E→ℚ_p,
     the latter existing because p splits completely in the normal closure; composing with the d
     embeddings F→E identifies Hom(F,ℂ) with Hom(F,ℚ_p), that is with the places above p. For every
     t:Hom(F,E)→ℕ construct `V_{t,E}=⊗_σ Sym^{t_σ}(E²)`, on which SL₂(F) acts on the factor at σ
     through σ, and its local system from the parent's coefficient functor. Its complex scalar
     extension is `weightRep Γ t` (V_κ when t is the embedding tuple of κ) and its p-adic extension is
     W_t." Tested at t=(3,0): V_{t,E}=Sym³(E²) through one embedding, dimension 4 in both
     realizations, and −I acts by −1 in both, so both cohomologies vanish, matching `README.md:428`.

6. **F06** (P2) gap:skew-rank asks for a division ring Mathlib already constructs

   - **Location.** `README.md:96` ("For a two-sided noetherian domain R, construct its classical Ore
     division ring Q(R) and the finite skew rank …").
   - **Claim.** The whole construction is missing.
   - **Witness.** Pinned Mathlib, Mathlib/RingTheory/OreLocalization/Ring.lean:209–211:
     `variable {R} [Ring R] [Nontrivial R] [NoZeroDivisors R] [OreSet R⁰]` and
     `instance : DivisionRing R[R⁰⁻¹]`. Not included there: the Ore condition for a noetherian domain,
     modules, rank.
   - **Repair.** Replace the `needs` sentence (README and plan `gaps`) by: "For a two-sided noetherian
     domain R, prove `OreLocalization.OreSet (nonZeroDivisors R)` on both sides, so that Mathlib's
     `OreLocalization (nonZeroDivisors R) R` with its `DivisionRing` instance
     (Mathlib/RingTheory/OreLocalization/Ring.lean) is the classical division ring Q(R), and define the
     finite skew rank `dim_{Q(R)}(Q(R)⊗_R M)` on finitely generated left R-modules, additive on exact
     sequences, zero exactly for torsion modules and equal to a on R^a." Add the instance to `### From
     Mathlib`. Tested on the gap's Check R=ℚ_p[X,Y]: commutative domains are Ore, Q(R)=ℚ_p(X,Y), rank
     of (X,Y) is 1.

7. **F07** (P3) The AdelicAlgebraicGroups §4.2 contract states a more general theorem than the section proves

   - **Location.** `README.md:54` ("for a connected semisimple simply connected group over a number
     field every one of whose simple factors has noncompact points at the archimedean places").
   - **Witness.** AdelicAlgebraicGroups §4.2 on main, *strong-approximation-sufficiency*: "connected,
     absolutely almost simple and simply connected over a number field F, and S … with G_S noncompact".
     `Res_{F/ℚ}SL₂` is not absolutely almost simple for F≠ℚ.
   - **Repair.** Replace the sentence by: "Consume §4.2's *strong-approximation-sufficiency*: a
     connected, absolutely almost simple, simply connected group G over a number field F with G(F_∞)
     noncompact has strong approximation for the archimedean places, so G(F)\G(𝔸_F^∞)/U is a single
     point for every compact open U (the consequence stated in the same section's strong-approximation
     bullet). It is applied to SL₂ over F, never to `Res_{F/ℚ}SL₂` over ℚ; the two adelic quotients are
     the same set." Delete "equivalently to the ℚ-simple group `Res_{F/ℚ}SL₂`". Tested: SL₂/ℚ(i) is
     absolutely almost simple with SL₂(ℂ) noncompact; one double coset at U=SL₂(Ẑ[i]).

8. **F08** (P3) CompletedCohomologyPartII §5.6 is used but not in the contract or any `*Needs:*`

   - **Location.** `README.md:23` and `README.md:470` ("apply CompletedCohomologyPartII §§5.6–5.7");
     contract `README.md:58` and `*Needs:*` `README.md:474` list §5.7 only.
   - **Witness.** CompletedCohomologyPartII §5.7 `*Needs:*` already contains §5.6; this roadmap uses
     only the torsion conclusion.
   - **Repair.** Write "§5.7" in both places instead of "§§5.6–5.7".

Files read in full: `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` (797 lines) and
`packages/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean` (101 lines). No Lean was run (the
brief forbids builds); elaborated types were taken from the worker's `signatures.md` and compared
with the README by hand.

## Dependency check

    depcheck: 245 roadmaps, 2237 edges, 0 problem(s)

No UPWARD or CYCLE line. After R02 the roadmap names LocallyAnalyticDistributionsPartII (line 199 of
`merge-order/ORDER.txt`, after this roadmap's line 180); the check must be rerun and is expected to
print a `moved:` line.

## Adversarial pass (values computed)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.1 B_c | m=3, c_∅=2, c_{0,2}=3, x=(2,5,4) | 2+3·2·4=26 | agrees |
| §0.2 B_c(x)≤(Σc)D/a | m=1; x=(1,t), c_{1}=7 | const; 7t≤7·t/1 | agrees, no saving claimed |
| Casimir Δ=½h²−h+2ef | highest weight k=0,1,2 | 0, 3/2, 4=½k(k+2) | agrees |
| Untwisting | p=3, g=(1 3;0 1), w=(0,1) | g⁻¹w=(−3,1); gh=(10 3;3 1) | agrees |
| §1.2 strip bound | α=(3,3), k=(1,t) | 2[3(t+1)+3·2]=6(t+1)+12≥2(t+1) | agrees |
| §1.2 m=1 | k≥α | ((k+1)²−(k+1−α)²)/(k+1)=2α−α²/(k+1) | agrees |
| §1.3 Hom bound | 0→T'→T→Q→0 | dim Hom(T)≤dim Hom(Q)+dim Hom(T') | agrees |
| §2.3 | rank N=ℓ−a | ℓD−(ℓ−a)D−U_N=aD−U_N | agrees |
| §2.5 | four-term sequence | H₁=H₀(N)−ℓD+H₀(M)≤U_N+U_M | agrees |
| §2.6 | p=2 | −I in kernel, (1−g)(1+g)=0 | exclusion correct |
| §3.1 D≤Δ, min x≥min κ/2 | κ=2; (1,1),κ=(4,6) | 1≥1; D=27≤144, min x=3≥2 | agrees |
| §3.1 trace Check | γ=(i 1;−1 0) | det 1, tr i; i·(−i)=1 | agrees |
| `finrank_groupCohomology_weightRep_le` | t=0; t=(1,0) over ℚ(i); t=(n,0); i>3d; F=ℚ | Betti ≤C; 0; boundary bounded, ≤C(n+1); 0; excluded by hypothesis, k/6 growth | true as typed |
| same, 𝔞=⊤ | quotient ring zero | kernel=⊤, Γ=SL₂(O_F) | covered |
| `bianchi_groupCohomology_linear_growth` | ℚ(i), n=0; n=99,100 | H¹=0 needs n₀; slopes 1/3, 1/12 | true as typed |
| §5.1 | n=2, z=(1,i) | det −2i; (9,18,9), ranks (8,8) → (1,2,1) | agrees |
| §5.2 | i=1,2 | b_i+b_{i−1}=3c | agrees |
| §5.3 formula | N=1: k=2,4,…,14; N=2: k=6,8; N=3: k=3,4,5 all types | 0,0,0,0,0,1,0; (0,1,0),(0,0,1); totals 0,1,2 = dim S_k(Γ(3)) | agrees |
| §5.4 | ℓ=3 cuspidal type | θ of order 4, trivial on centre, factors through S₃, tr S₄=2, tr S₃=−1 | agrees |
| §5.6 A_F/B_F | u=1,2,5 | 5/3, 3, 5 ≥(5/3)3^{s−1} | agrees |
| fgt10 Thm 4.17 at ℚ(i), n=0 | all terms | 1/12−0−1/2−1/4−1/3+1=0 | agrees with H¹(SL₂(ℤ[i]),ℂ)=0 |
| §4.2 Check, F=ℚ | k=10, 22 | 2·1+1=3, 2·2+1=5 | agrees |

## Verified sound

- Declarations read: 4 of 4 (`embeddingStdRep`, `weightRep`, `finrank_groupCohomology_weightRep_le`,
  `bianchi_groupCohomology_linear_growth`); each elaborated type compared with README §3.1, §4.2,
  §5.8: binders, hypotheses and quantifier order agree (C before t, i, a; c, C, n₀ before n, i). No
  padding, no `set_option`, no sorry'd data, single Mathlib import plus one existing Tau Ceti module.
  Headlines not stated (§2.6, cusp-form bound, support forms of §5.8) are named in the docstring with
  the missing carrier.
- Targets read: 30 sections (0.1–0.3, 1.1–1.4, 2.1–2.7, 3.1–3.4, 4.1–4.4, 5.1–5.8), 6 gaps, 10
  source corrections.
- Locators verified against the cached texts: 41 (fu24 20, fgt10 9, marshall12 4, aw13 3, aw14 2,
  serre77 3; serre77 pages are the printed ones). fu24 Remark 5.8 starts on p. 20 and runs to p. 21.
- Checks tested by computation: 58; none false.
- Sibling citations resolved at main or the open heads: 43 section headings (ArithmeticLocallySymmetricSpaces
  18, CompletedCohomologyPartII 6, NoncommutativeAndEquivariantIwasawa 7, AdelicAlgebraicGroups 1,
  Chebotarev 1, ModularForms 1, ModularSymbolsPadicLFunctions 1, GL2AutomorphicRepresentationsAndTransfer 7,
  AutomorphicFormsOnReductiveGroups 3); all exist except as reported in R01.
- Pinned declarations grepped: all 25 named (18 Mathlib, 7 Tau Ceti) in the two contract subsections exist in the files cited.
- Names: `weightRep`, `embeddingStdRep` and both theorem names occur in no other roadmap.
- Policy: package folder only; no pull-request numbers, `lemma` or `set_option`; every target has a
  locator; each definition has at least three Checks.

## Not verifiable

- Elaboration of `Suggested.lean`: not run here; relied on the worker's elaborated signatures.
- fgt10 Theorem 4.17's omitted "tedious but elementary" summation: only the n=0, F=ℚ(i) value was
  recomputed.
- aw14 and aw13 inequality signs: read from an extraction that prints no "≥"; R03 rests on the
  internal evidence listed there, not on the printed page.
- The published paginations of fu24 and fgt10 (the README cites the arXiv versions it read).

## Source issues

- **Misprint** in fgt10 at Proposition 4.18, p. 25: the source names the order-three coefficient ρ_k, a symbol it never defines; it should be μ_k of display (4.7); affects nothing.
- **Misprint** in fgt10 at Theorem 4.17, p. 25, final display: the source indexes the CM factor by k in the correction for a fractional ideal; it should be indexed by n as in Proposition 4.11; affects nothing.

## Copyright, licences and scope

Wording: the 41 verified locators and 8 further passages (README §1.1, §2.2, §2.5, §3.4, §5.3, §5.4,
§5.6 and the `weightRep` docstring) were set beside fu24 lines 1116–1149 and 1162–1181, fgt10 lines
1288–1410 and aw13 lines 3617–3628; no run of more than six consecutive shared words outside
formulas. Arrangement: fu24 has 37 of 67 locators; its sections 2–7 (algebra, growth, comparison,
specialisation, local, global) do not map onto Layers 0–5 (fu24 §§3–5 are supplier inputs, §6 is
split over Layers 1–2, Layer 5 is from fgt10). Reuse: the trace values of §5.4 are restated as prose
facts with locators; no table or figure is taken over.

Source independence: 49 passages compared with 6 sources, none shared; largest share fu24, 37 of 67 locators; contents compared with fu24: independent.

## For the human reviewers

- **Licence.** aw14 and aw13 are read from author pages (`sources.toml` records `author-page`); their
  inequality signs are lost in extraction, see R03.
- **Scope.** R02 changes which roadmap supplies the microlocalisation inputs and requires this roadmap
  to sit after LocallyAnalyticDistributionsPartII in the merge order; whether that move is wanted is
  a board decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8ac6e0e4eade88c715fa0542a7b95e9f63f1ef91", "job": "RT-ArithmeticLocallySymmetricSpacesPartII~1a", "model": "fable", "worker": "chris-x79"} -->
