<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17981#issuecomment-6907518978 -->
Red team round 1 pass b (claude) of 160a122

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) "switch parameter" is defined by how it was produced, not by a property, and has no Checks

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:126-128`
   (Conventions): "A *switch parameter* is a `t ∈ U(K)` produced by the parent's §7.4
   `simultaneous_specialization` for a finite set of places containing those above `3p`, lying in the
   opens of the parent's §6.5".

   **Claim.** The term is the standing hypothesis on `t` in Theorems 2.1, 2.2, 2.5 and 7.5 ("for every
   such `t`") and in 8.1.

   **Witness.** "Produced by" an existence theorem is not a predicate on `t`: no example can be tested
   for or against it. The parent's §7.4 is an existence statement with conclusions (1)–(3) and an API
   clause on the image of `G_D`; Theorem 2.1(a) uses (1) and (3), Theorem 2.2 uses (1)–(2), §7.5(a)
   uses the `G_D` clause. The definition has no Check.

   **Repair.** Replace the sentence at README:126-128 by:

   > A *switch parameter* is a point `t ∈ U(K)` with the following three properties. (S1) `t` lies in
   > the opens of the parent's §6.5 `local_type_opens` at every place of `K` above `3p`. (S2) The three
   > conclusions of the parent's §7.4 `simultaneous_specialization` hold for `t`: for each pair
   > `(m, ℓ) ∈ {(3, p), (3, 5), (p, 3)}` and every character `θ` of order `m`, the residual `V_θ` is
   > absolutely irreducible on `G_{F(ζ_ℓ)}` and decomposed generic over `F`; the residual `V₁` modulo
   > `p` is absolutely irreducible on `G_{F(ζ_p)}` and decomposed generic over `F`; and `A_t` is
   > geometrically non-CM. (S3) For the field `D` of the parent's §7.4, the image of `G_D` on each of
   > these residual systems contains the geometric monodromy of the parent's §7.1. The parent's §7.4,
   > applied to any finite set of places containing those above `3p` and any nonempty opens contained
   > in the opens of §6.5 there, gives a switch parameter in the prescribed opens; in particular switch
   > parameters exist for every CM field `K` and every geometrically non-CM `E/K`.
   >
   > **Checks.** (1) (S2) is used in Theorems 2.1(a) and 2.2, (S1) in the local alternatives of
   > Theorem 2.2, (S3) only in §7.5(a); no statement uses how `t` was found. (2) A `t ∈ U(K)` for which
   > `A_t` has geometric CM fails (S2): the base change of Theorem 2.1(c) need not be cuspidal
   > (third Check of §2.1). (3) A `t` satisfying (S2) and (S3) but lying outside the §6.5 open at one
   > place above `3` fails (S1): the potential reduction types of source and target in a row of the
   > lifting table may then differ, and the alternatives of the parent's §5.2 are not available.
   > (4) A switch parameter for a larger set of places and smaller opens, as in §7.5, is a switch
   > parameter.

   Tested on the refuting instance: with this text "let `t` be a switch parameter" in Theorem 2.1 is a
   hypothesis `(S1) ∧ (S2) ∧ (S3)` on `t`, each clause of which Theorem 2.1(a), 2.2 or 7.5(a) cites.

2. **F02** (P2) §7.4 cites the parent's `solvable_preparation` and `switch_five` for a statement they do not make

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1440-1450`: "This
   is the parent's §0.3 `switch_five` with the places `Σ`: in the solvable preparation add trivial
   prescribed completions at the places of `F⁺` below `Σ`"; *Needs:* lists `solvable_preparation`,
   `switch_five`.

   **Claim.** The extension `L/F` in which every place of `Σ` splits completely is obtained from the
   parent's §0.3.

   **Witness.** The parent's `solvable_preparation` (EllipticCurveModularityImaginaryQuadratic §0.3)
   controls only the places above `2, 3, p` and one witness prime `q > 5`; `switch_five` gives
   `L ∩ F_avoid = F` and nothing at other places. Neither yields splitting at `Σ`; without it a place
   above `v` may have ramification index divisible by five and lose protection (§3.3, fourth Check).
   The step is taken from inside the parent's construction, and its inputs are not in the *Needs:*
   line.

   **Repair.** State the strengthened preparation as the first assertion of §7.4 and prove the rest
   from it. Insert before "Prove: there are a finite solvable Galois CM extension":

   > Prove first (a), the preparation with split places: in the setting of the parent's §0.3
   > `solvable_preparation` at `p = 5` (an imaginary CM field `F`, `ρ̄ : G_F → GL₂(𝔽₅)` continuous with
   > cyclotomic determinant and decomposed generic, a finite Galois `F_avoid/F`) and for a finite set
   > `Σ` of finite places of `F` not above `2, 3, 5`, the extension `L/F` of that statement can be
   > chosen so that, in addition to all its conclusions, every place of `Σ` splits completely in `L`.
   > The route is the construction of that statement with one more family of local conditions: the
   > soluble extension is made over `F⁺` with prescribed completions (GL2ModularityLifting §1.7,
   > PotentialAutomorphyInfrastructure §2.5) and composed with `F`; prescribe in addition the trivial
   > completion at every place of `F⁺` below `Σ`. The new places lie above none of `2, 3, 5`, and
   > where one lies above the witness prime the prescription there is already trivial, so the local
   > conditions are compatible. A place `u` of `F⁺` with trivial completion gives `L_{w'} = F_w` for
   > every `w | u` and `w' | w`. (CaptainSude26, proof of Proposition 5.2, lines 549–556; CHT08,
   > Lemma 4.1.2, p. 116.)

   Replace "This is the parent's §0.3 `switch_five` with the places `Σ`: in the solvable preparation
   add trivial prescribed completions at the places of `F⁺` below `Σ` (GL2ModularityLifting §1.7,
   PotentialAutomorphyInfrastructure §2.5), and in the Hilbert selection add" by "(b) is proved as the
   parent's §0.3 `switch_five`, with (a) in place of `solvable_preparation`; in the Hilbert selection
   add", and label the existing statement (b). In the *Needs:* line replace "`solvable_preparation`,
   `hilbert_local_selection`, `seed_modular`, `switch_five`" by "`hilbert_local_selection`,
   `seed_modular`, and the inputs of `solvable_preparation` (GlobalNumberFields Layer 1,
   InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.7, ArithmeticGaloisRepresentations
   §§4.2–4.7, EllipticCurves Layer 4)". Add the Check: "For `Σ = ∅`, (a) is `solvable_preparation`
   and (b) is `switch_five`. With `Σ` a place `v | 11` and a preparation of ramification index five at
   `v`, residual inertia `U` becomes `U⁵ = 1`: (a) is what excludes this."

   Tested on the refuting instance: a `v | 11` in `Σ` now has `L_{w'} = F_v` by (a), so the
   ramification index is one and §3.3 keeps protection.

3. **F03** (P3) "width-three" is used in headings and scope but never defined; the text uses "thickness" and type `I₃`

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:58`, `:110`,
   `:451`, `:1333` ("the width-three multiplicative degeneration of `A_t`").

   **Claim.** The degeneration has "width three".

   **Witness.** §7.1 (README:1341-1350, 1361) states the result with "thickness" (`2 + 1 = 3`) and
   Kodaira type `I₃`; "width" occurs in no statement, Check or supplier (EllipticCurves Layer 4 and
   the parent's §2.3 speak of nodes and smoothing order).

   **Repair.** Replace "width-three multiplicative degeneration" by "multiplicative degeneration of
   type `I₃`" at the four places, the heading of §7.1 becoming "### 7.1 The multiplicative
   degeneration of type `I₃`"; at README:110 write "the degeneration of type `I₃`".

4. **F04** (P2) §7.1(b)–(c) follows CaptainSude26's proof of Lemma 5.1 clause by clause

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1339-1344`: "the
   reflection `w` fixes exactly one of the three nodes, acting by `−1` on both branches there, and
   exchanges the other two; (c) the quotient … after resolving the `A₁` point the fiber is a cycle of
   three rational curves".

   **Claim.** The statement is in the roadmap's own words.

   **Witness.** CaptainSude26 lines 513–516: the same seven clauses in the same order (one node fixed
   and two exchanged; `−1` on both branches; local quotient equation in `s²`; one node of thickness
   one from the pair; rational components; resolution to a cycle of three; type `I₃`). Longest
   consecutive shared run: 4 words.

   **Repair.** Replace parts (b) and (c) of the statement (README:1339-1344, from "(b) in the nodal
   model" to "type `I₃` in the smoothing parameter `s`;") by a statement organised by the output, the
   special fibre of the quotient:

   > (b) among the three nodes of the nodal model of the parent's §2.3 at `R_*` for `m = 3`, exactly
   > one, `ν₀`, is stable under `w`; in the chart `xy = s` of the parent's §2.1 at `ν₀`, `w` is
   > `(x, y) ↦ (−x, −y)`, and `w` interchanges the two remaining nodes; (c) the quotient `𝒟` of that
   > regular model by `w` has a special fibre with two components, each of genus zero, and two
   > singular points, so its dual graph is a cycle of length two; the edge at the image of `ν₀` has
   > thickness two (there `𝒟` is `z₁z₂ = s²` with `z₁ = x²`, `z₂ = y²`) and the edge at the common
   > image of the two interchanged nodes has thickness one. Hence the minimal regular model of `D_t`
   > over the `s`-line has special fibre a triangle of projective lines: `D_t` and `A_t` have
   > semistable reduction of Kodaira type `I₃` in the smoothing parameter `s`;

   The route for (b) (the lifts of `[−1]` on `E'`) and the three Checks are the roadmap's own and
   stay. Tested: the repaired text gives the same thicknesses `2 + 1 = 3` and the same type as the
   first two Checks of §7.1.

Four findings: three P2 (R01, R02, R04), one P3 (R03). No P1. The declared gap
`gap:acc-torsion-inertial-comparison` is precise, minimal and declared with the same slug in
`packages/EllipticCurveModularityImaginaryQuadraticPartII/design/plan.json` and in the README; it is
not raised.

## The pass (values computed)

`Suggested.lean` declares nothing (module docstring, empty namespace); the `#check` comparison of
elaborated types has no subject. Rows are the bold README targets.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1(a),(b) CM-ness | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `ℚ(i,√3,√5)`; `ℚ(2^(1/3))(ζ₃)`; `S = {1,2}`; `ℚ(√−3)`, `S={4}` | `Gal ≅ (ℤ/5)ˣ`, middle field `ℚ(i,√5)`; 7 quadratic subfields, roots of unity `μ₁₂`; `S₃`, `c₁c₂` a 3-cycle; `L=K`; `ℚ(ζ₁₂)` | true; Checks true |
| 1.2 descent | `K=F=ℚ`; `1⊕1` over `𝔽₃`, `q=2`; over `ℚ(ζ₃)` | ratio `1 ≠ 2`; split primes `≡ 1`, ratio `1 = q` | true; converse fails as stated |
| Layer 1 Examples `K₆₀` | `{1,29} ⊂ (ℤ/60)ˣ` | `29 ≡ −1 (15)`, `≡ 1 (4)`, `≡ 4 (5)`, `≡ 2 (3)`; degree `16/2 = 8`; `K₆₀(ζ₃) = ℚ(ζ₆₀)` | true |
| 2.1 seed before base change | `K₆₀`; imaginary quadratic | `cm_modularity` hypothesis `ζ₅ ∉ L` at `L=K₆₀` holds, at `L=F` fails | true |
| 2.2 three lifts | residual chain | `V_η ≡ V_χ (p)`, `V_χ ≡ V_ψ (3)`, `V_ψ ≡ V₁ (p)`; `χ_(h(t))² = 1` | true |
| 2.3 local factors | `q_v=4`, `a=4`; `z=i`; split multiplicative | `T²−4T+4=(T−2)²`, unitary roots `1,1`, `(1−2·4^(−s))^(−2)` both sides; `diag(i,−i)`; `(1−T)⁻¹` versus `((1−T)(1−4T))⁻¹` | true |
| 2.4 CM branch | `y²=x³−x`, `y²=x³+1` over `ℚ(ζ₈)`; `y²=x³−x` over `ℚ(√−3)` | `ℚ(i) ⊆ K`: sum; `KM=ℚ(ζ₂₄)`: induction; induction | true |
| 3.1 `ad⁰` of `SL₂` | `U`, `Uᵀ`, `diag(2,3)`, characteristic 2 | `UX−XU=[[z,−2x],[0,−z]]`, `UᵀX−XUᵀ=[[−y,0],[2x,y]]`; `D(h)=h−2e`, `D(f)=f+h−e`; `2/3=3/2=4`; `H⁰=k·1`; Gram determinant `−2` | true |
| 3.2 detection | `𝔽₅`, `𝔽₇`, `𝔽₃` | norm `5+10N+10N²`; `7+21N+35N²=0`, target 1-dimensional, source 0; `N²≠0`, `ker = im = ke⊕kh` | true |
| 3.3 protected | Tate curve `5∤v(q)`, `q=ϖ⁵`; `M=[[0,−1],[1,−1]]`, `Φ=[[4,1],[0,1]]`, `q_v=11` | `Φ²=1`, `ΦMΦ⁻¹=[[4,1],[4,0]]=M²=M¹¹` | true |
| 3.4 unipotent-inertia ring | `q_v=11`, `δ=1`; `(1+εf)U`, `(1+εh)U`; `𝔽₂₅`, `ζ` | `11·12²=1584=12²·11`; traces `2+ε`, `2`; `ζ ↦ ζ+x`, `x∈𝔽₅` | true; 3 free parameters `a, b−1, z−[z̄]` |
| 3.5 tangent line and dual | `μ₅ ⊂ F_v`; `q_v ≡ 2 (5)`; `p=3` | `h⁰=h²=1`, `h¹=2`; `h⁰=0`; `Σ_{i<q} Dⁱ = ((q−1)/p)·Norm + 1`, norm `≠ 0` at `p=3` | true; `p ≥ 5` in (d) needed |
| 4.1 exceptional classes | no protected place; inertia of order 2; `𝔽₇` | inflated class unramified; restriction zero; `H¹=0` | true |
| 4.2 Taylor–Wiles primes | `diag(2,3)`; `κ(γσ₀)` | eigenvalues `4,1,4`; `κ(γσ₀)=κ(γ)+κ(σ₀)` | true |
| 4.3 presentation | `ℚ(ζ₅)`: `d=2,t=1,r=6`; `d=2,t=3,r=10` | `g=0`; `14+6=20=r+4t−d`, `22=r+4t` | true |
| 5.1 prepared datum | `d=40`, degrees `(8,8,24)`; five of degree 8; `d=36` | `24>20`, `8<20`; `24>20`; `8∤36` | true |
| 5.2, 5.4 dimensions | `d=40,t=10,R=∅` | `1+10·11=111`; `r=111`, `151` | true |
| 5.3 Hecke maps | `q_w=11`, `diag(2,3)`, `𝔽₅[ε]` | index `12`, `60`; `diag(1+ε,1−ε)¹¹` equal to itself | true given the gap |
| 6.1 preparation | `p_b=109`, `p_c=2617`; `E=ℚ(√31,√59,√71)`; Hilbert symbols | `2617=6·436+1` prime, `≡ −1 (11)`, `−4·109 ≡ 4 (11)`; residues `1,4,1 (5)`, `9,4,5 (11)`; product formula `−1` | true |
| 6.2 lifting theorem | `𝔽₂₅`, `μ²=2`, `γ=diag(1,2)`; determinant of order 4 | `det=−1`, `(μγ)²=diag(2,3)`, order `240`, kernels of index `120`; `120<240` | true |
| 7.1–7.3 degeneration | three nodes; `v(q_A)=3,15` | one fixed node (three give `p_a=2`); thickness `2+1=1+1+1`; `[[1,3],[0,1]]`, trivial | true |
| 7.4, 7.5 | `Σ=∅`; transvections with entry 3 | group of order 120 | true; R02 on the route |
| 8.1 headline | `ℚ(ζ₅)`, `K₆₀`, `ℚ(√−1,√5)` | `K₆₀(ζ₅)=ℚ(ζ₆₀)`; `(ℤ/2)²` has no cyclic quotient of order 4 | true |

Dependency check, run on the README as it stands:

    depcheck: 246 roadmaps, 2312 edges, 0 problem(s)

## Copyright, licences and scope

Wording: 21 passages compared (LeHung26 lines 318–321, 342–355, 352–355, 357–366; CaptainSude26
lines 177–220, 221–226, 231–241, 242–263, 264–289, 299–314, 416–444, 509–519, 520–532, 538–556,
582–588; CN23 lines 3849–3872, 4226–4260,
4462–4509; ACC23 lines 2309–2355, 7163–7187; MilneCM lines 273–300), including the module
docstring of `Suggested.lean` against CN23 lines 3849–3872. One passage follows its source clause by clause (R04). Elsewhere no run of shared wording beyond
formulas and lists of hypotheses that the mathematics fixes. Arrangement: CaptainSude26 has the
largest share. Its sections are §2 (the cover family), §3 (four local and global lemmas), §4 (Hecke
maps and patching), §5 (degeneration and switch), §6 (the chain). The roadmap has no layer for §2
(imported from the parent), opens with two layers that have no counterpart there, splits §3 over
Layers 3 and 4, has Layer 6 with no section of its own, and places the chain (Layer 2) before the
lifting theorem; the order of Layers 3 to 7 is forced by their *Needs:* lines (3 → 4 → 5 → 6 → 7).
Reuse: no table, figure or data taken over.

Source independence: 21 passages compared with 5 sources, one following its source clause by clause (R04), none shared verbatim; largest share CaptainSude26, 24 of 60 source citations in Layers 1–8; contents compared with CaptainSude26: independent.

## Verified sound

- Declarations read: 0 in `Suggested.lean` (it declares nothing; the module docstring names
  Theorems 2.5, 8.1 and 6.2 as not statable and what each lacks). At the pins neither library has
  automorphic representations, Weil–Deligne representations or potentially semistable
  representations (searched by object in both source trees), so no headline is statable and none is
  forced through a stand-in. One `import Mathlib`, no `set_option`, no `sorry`.
- Targets read: 27 (1.1–1.2, 2.1–2.5, 3.1–3.5, 4.1–4.3, 5.1–5.4, 6.1–6.2, 7.1–7.5, 8.1), every
  line of the README, with the table above.
- Checks tested: the 93 Check bullets and the Frobenius witness of the Conventions recomputed; none
  false, none vacuous.
- Pinned declarations checked at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`: 18 (all exist with the
  cited files and hypotheses): `NumberField.IsCMField`, `IsCMField.of_isAbelianGalois`,
  `IsCyclotomicExtension.Rat.isCMField`, `NumberField.isTotallyComplex_of_algebra`,
  `Matrix.SpecialLinearGroup.toGL`, `groupCohomology.map`,
  `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`, `Matrix.SL2.commutator_eq_top`,
  `WeierstrassCurve.localPolynomial`, `LFunction`, `LSeries`, `ModularForm.L`,
  `NumberField.AdeleRing`, `continuousCohomology`,
  `WeierstrassCurve.tateModuleGaloisRepresentation`,
  `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`, `tateDualityPairing_perfect_mixed`,
  `GalRep`; Mathlib's CM file has no statement on composita or intermediate fields.
- Sibling citations checked at the cited roadmaps' current texts: the 41 declaration names of the
  parent and every cited section, layer or target id of the 21 supplier roadmaps (about 90 ids);
  all resolve. Read in full for hypotheses: the parent's §0.3, §5.1–5.3,
  §7.1–7.4, §8.3–8.6 and its boundaries section; CrystallineLocalGlobalCompatibilityCM §8.6–8.7,
  §9.1, §9.3–9.12; AutomorphicGaloisRepresentationsPartII AG2.7; PotentialAutomorphyInfrastructure
  §0.11, §2.1, §2.3, §2.5; MordellLawrenceVenkatesh §1.3–1.4; ArithmeticGaloisRepresentations §4.3,
  §6.3, §7.2, §7.7, §7.9 (with `ResidualImage.adZeroRep` in its Lean file, defined over any field);
  LocalGaloisDeformationRings §2.3, 2.5, 2.6, 2.8, 2.16, 2.21; GlobalGaloisDeformations §3.6, 3.7,
  5.1, 5.6; ModularityAndLanglandsExtensions §2.29. The lead of the citation tool on
  `ResidualImage.adZeroRep` is a sibling declaration, not a missing library name.
- Gap: PotentialAutomorphyInfrastructure §0.11 states ACC23 Theorem 2.4.8 only, and no roadmap
  states ACC23 Theorem 3.1.1; the gap asks for nothing already provided.
- Ownership: no other roadmap on main, on the board or at an open head states the Layer 1
  statements, the protected condition, or the lifting theorem at five; ShimuraData uses "a
  compositum of CM fields is CM" in passing without a target. EllipticCurveModularityTotallyReal
  places CM bases outside its scope and names this roadmap.
- Locators verified against the texts: 50 (LeHung26 10, CaptainSude26 18, CN23 14, ACC23 4, AKT23 1,
  MilneCM 1 block of three results, CHT08 1, OpenAI26 1 block of three); all correct in line and
  page.
- Policy: the pull request changes only `packages/EllipticCurveModularityImaginaryQuadraticPartII/`;
  no pull-request numbers or process narrative in the README or the docstring; every target has a
  locator and a *Needs:* line.

## Not verifiable

- OpenAI26: only the pages of Proposition 9.3, Lemma 9.4 and §9.4 were located; the content of the
  parent's §8.5–8.6 arguments was checked against the parent roadmap, not against OpenAI26.
- §7.1(b)–(d) and §7.2(a) rest on the parent's nodal model at `R_*` (its §2.1, §2.3); the count of
  fixed nodes and thicknesses was recomputed, the existence of the integral model over
  `O_{K₁}[1/n₀]` was not.
- The truth of CaptainSude26's patching argument (§5.3–5.4) beyond the dimension counts and the
  inertial computation at `P`: it depends on the declared gap and on
  CrystallineLocalGlobalCompatibilityCM §9.7–9.10, which are contracts, not proofs.
- No Lean was elaborated: the file has no declaration.

## Source issues

- **Gap** in LeHung26 at Lemma 5.1, p. 9 (lines 357–360): the source says descent goes one cyclic step at a time along an abelian extension of CM fields; it should note that each intermediate field is CM, which the base-change theorem requires; affects the proof.

## For the human reviewers

- **Scope.** Layers 3–7 rest on CaptainSude26, a pseudonymous, unrefereed manuscript (GitHub release, 15 pages); Layers 1–2 on LeHung26, a discussion draft; the parent on OpenAI26, unrefereed. No refereed source states Theorems 6.2 or 8.1 (`sources.toml`).
- **Licence.** CaptainSude26 has no stated licence (`sources.toml`, its `version_note`); it is cited by locator only and recorded with `licence_class = "author-page"` for a file on a code-hosting site.
- **Licence.** MilneCM is recorded as `licence_class = "open-repository"` in `sources.toml`; the copy is on the author's own page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "160a122eb495f95a8c207aa9597e6339f16dc27e", "job": "RT-EllipticCurveModularityImaginaryQuadraticPartII~1b", "model": "fable", "worker": "chris-x79"} -->
