<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6917064537 -->
Red team round 1 pass a (claude) of 56ec826

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) "canonical integral model": undefined notion, unowned theorems, and §1.6 and §1.7 need each other

   **Location.** `packages/ShimuraVarietiesPartII/README.md:424` (§1.7): "equip the normal Hodge tower with its
   integral G-shtuka and its local completion identifications. It is the canonical integral model in the
   sense used in KPZ Remark 7.1.9(b)"; `README.md:428`: "Use the canonical extension characterization to
   prove uniqueness"; `README.md:420` (§1.6 *Needs*), `README.md:430` (§1.7 *Needs:* §1.6); `README.md:128`
   (gap:integral-local-shimura); `README.md:1068–1070` (§5.1).

   **Claim.** §1.7 constructs the canonical integral model and proves its uniqueness; §1.6 deduces the
   strict-henselian comparison; §5.1 extends maps of Hodge data to the integral models.

   **Witness.**

   1. The notion is not defined in the roadmap. KPZ Remark 7.1.9(b) (KPZ line 3272–3274) only quotes it
      from Pappas–Rapoport. The definition is PR24 Conjecture 4.2.2 (PR24 line 3277–3292, arXiv
      2106.08270v6 p.78): a system of normal flat models with (a) the pro-level extension property and
      finite étale Hecke maps, (b) an extension of the G-shtuka of the generic tower, (c) for each point
      x an isomorphism between the formal completion of the integral local Shimura variety at its base
      point and the diamond of the completion at x, matching shtukas. Neither the G-shtuka of the
      generic tower nor (a)–(c) is stated anywhere in the README.
   2. Three theorems are used and have no owner. Uniqueness: PR24 Theorem 4.2.4 (PR24 line 3314–3318,
      p.79). Functoriality, used through the product model in the proof of KZ Proposition 4.3.2 (KZ line
      1644–1650) and so in §5.1: PR24 Theorem 4.3.1 (PR24 line 3457, p.82). That the normalized Hodge
      model satisfies (a)–(c): PR24 Theorem 4.5.2 = 1.3.2 (PR24 line 304–317, p.7–8; line 3642, p.87), and
      for a fixer that is not connected the extension KPZ attributes to Daniels–van Hoften–Kim–Zhang
      (KPZ line 3267–3268). All three are statements about the global models S_K of Layer 0. The gap
      gap:integral-local-shimura puts "the completion comparison used in KPZ Theorem 7.1.8" on
      HeckeStacksAndLocalShtukas §HS2, whose head has only generic-fibre objects (HS2.1, HS2.10, HS2.13)
      and cannot state a theorem about S_K. KPZ's proof of Theorem 7.1.8 uses two different completion
      comparisons (KPZ line 3265–3269): the global one (PR24 Theorem 1.3.2(c)) and the local one
      (representability of the completed integral local Shimura variety by the completed local model).
      The gap sentence does not say which it asks for: it is compound.
   3. Order. The proof of §1.6 needs the global identification, which is the first API bullet of §1.7
      (`README.md:434`), but §1.7 *Needs* §1.6 and §1.6 does not need §1.7.
   4. PR24 is not in `packages/ShimuraVarietiesPartII/sources.toml`; the only locator for §1.7 is the
      KPZ remark, which contains no proof.

   **Repair.** Restate §1.7 before §1.6, with its own content, and make §1.6 consume it:

   - §1.6 (new position of the present §1.7), **Definition.** "For integral Hodge data with K_p=G^fix(Z_p):
     the G^fix-shtuka P_(K,E) over the generic fibre Sh_K is the one attached to the pro-étale
     K_p-torsor lim_(K′_p⊂K_p) Sh_(K′_pK^p)→Sh_K. A system of normal flat O_E-models S_K, K^p sufficiently
     small, is canonical when: (a) for every discrete valuation ring R of characteristic (0,p) over O_E,
     lim_(K^p)S_K(R)=lim_(K^p)Sh_K(R[1/p]), and prime-to-p Hecke maps extend to finite étale maps;
     (b) P_(K,E) extends to a G^fix-shtuka P_K on S_K; (c) for every x∈S_K(k), with b_x read from the
     fibre of P_K at x, there is an isomorphism from the formal completion at the base point of the
     integral local Shimura variety of (G^fix,b_x,μ_h) onto the diamond of the completion of S_K at x,
     carrying P_K to the tautological shtuka. (PR24, Conjecture 4.2.2, p.78.)"
   - **Theorem (uniqueness and functoriality).** "Two canonical systems are isomorphic by a unique
     isomorphism inducing the identity on generic fibres and compatible with K^p. For a morphism of
     Shimura data carrying one fixer into the other and levels into levels, the generic map extends
     uniquely to canonical models; the product of two canonical systems is canonical for the product
     datum. (PR24, Theorem 4.2.4, p.79; Theorem 4.3.1 and the corollary after it, pp.82–83.)"
   - **Theorem (Hodge type).** "Under the hypotheses of the present §1.6 (p>2, a self-dual periodic
     lattice chain L with G^fix(Z̆_p)=G(Q̆_p)∩GSp(L)(Z̆_p)), the normalized Hodge models of §0.1 form a
     canonical system. (PR24, Theorem 4.5.2, p.87, for connected G^fix; the extension to full fixers
     cited at KPZ Theorem 7.1.8, proof, p.74.)" *Needs:* §0.1; §0.3; §1.8; the gap below.
   - The present §1.6 then has *Needs:* the three statements above, the gap, GeometricSatakeAndFusionPartII
     §§3.1 and 7.6, AlgebraicModuliForArithmeticGeometry Layer 6; §5.1 keeps *Needs:* §1.7 (renumbered)
     and cites the functoriality theorem instead of the gap for the existence of the map.
   - Replace the compound sentence of gap:integral-local-shimura by local statements only (as a gap
     added at the package stage, since the old sentence cannot be changed in `design/plan.json`): "For
     p>2, a local Shimura datum (G,b,μ) over Q_p and the full fixer G^fix of a point of the extended
     building: (i) define the integral local Shimura variety as the v-sheaf of G^fix-shtukas with one
     leg bounded by μ and a framing by b, with its base point and tautological shtuka; (ii) prove that
     its formal completion at a point is represented by the completion of M_loc(G,{μ}) at the
     corresponding point of the special fibre; (iii) prove that a morphism of data inducing an
     isomorphism of adjoint groups, at associated fixers, induces an isomorphism of these completions."
   - Add PR24 (arXiv:2106.08270v6, open repository) to `sources.toml` with these locators, and the
     Daniels–van Hoften–Kim–Zhang text once fetched.

   Tested on the witness: after the repair §1.6 no longer depends on a later section, every input of
   KPZ line 3265–3269 is a target here or a statement the local supplier can make, and "canonical" in
   §1.7 and §5.1 has a definition with a primary locator.

2. **F02** (P2) gap:general-connected-reduction asks a local supplier for a theorem about this roadmap's own torsor

   **Location.** `README.md:130`: "For the integral Hodge-model shtuka at an arbitrary odd-p full fixer,
   supply the reduction of the integral frame torsor to the connected fixer used in the proof of KPZ
   Corollary 7.2.24, compatible with adjoint descent"; used at `README.md:780–782` (§3.9).

   **Claim.** HeckeStacksAndLocalShtukas §HS2 will supply the reduction of structure group used in §3.9.

   **Witness.** KPZ line 3770–3773: the statement used is that the G^fix-torsor of the local-model
   diagram of Theorem 7.1.3, pulled back to S_(K°_p)(G,X), reduces to a G°-torsor. Both objects (the
   frame torsor of §1.4 and the cover of §3.3) are defined only in this roadmap; "the integral
   Hodge-model shtuka" and "the integral frame torsor" name nothing at the supplier's head (HS2.1–HS2.18
   are local). The sentence gives no hypotheses a supplier could state: vague needs.

   **Repair.** State the result where its objects live, in §3.9: "**Theorem.** In the corrected Hodge
   setup with condition (D), the pullback to the connected-parahoric model of §3.3 of the G^fix-torsor
   π of §1.4 has a reduction of structure group to G°, stable under G(A_f^p), on which q restricts to
   a G°-equivariant smooth map to M_loc(G,{μ_h}). (KPZ, Corollary 7.2.24 and its proof, p.85.)" Its
   *Needs:* §1.4; §3.3; §1.7 (the shtuka on the connected-level model); and the gap, reworded so that
   it mentions only local objects, with its exact form read from the proposition KPZ cites there
   (fetch that text before writing it; it is not in the manifest). Tested on the witness: the reworded
   contract names no object of Layers 0–3.

3. **F03** (P3) "neat" is redefined in Conventions and its owner is not cited

   **Location.** `README.md:19`: "Neat K^p means a sufficiently small prime-to-p level compatible with the
   Siegel embedding".

   **Claim.** This fixes the meaning of "neat" for §§0.2, 0.3, 3.8, 4.11, 7.1, 7.6.

   **Witness.** `README.md:260` and `README.md:1312` use the standard eigenvalue notion ("meets a neat level
   only in the identity"), which "sufficiently small" does not imply. The owner is
   `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:264` (§4.3, on main) and ShimuraVarieties §0.3
   (`neat_sublevels`); neither is cited. ReductiveGroupsPartIII §3.5, a supplier here, uses that notion.

   **Repair.** Replace the sentence by: "A prime-to-p level K^p is neat when K_pK^p is a neat level in the
   sense of AdelicAlgebraicGroups §4.3 (it suffices that the eigenvalue condition holds at one prime
   ℓ≠p); every K^p contains a neat open normal subgroup (ShimuraVarieties §0.3). Sufficiently small
   means neat and, for a Hodge embedding, such that Sh_K(G,X)→Sh_(K′)(GSp(V),S^±) is a closed immersion
   for the chosen K′^p." Add "From TauCetiRoadmap.AdelicAlgebraicGroups: §4.3 (neat elements and neat
   levels)" to the supplier contracts and to the *Needs* of §0.2 and §0.3. Tested on the witness: with
   this definition the scalar −1 of `README.md:1026` is excluded from a neat level, as §0.3 uses.

4. **F04** (P3) §3.1 (a definition) has one discriminating Check

   **Location.** `README.md:628–632`.

   **Claim.** Three Checks test the definition of A_int(G) and A_int(G)°.

   **Witness.** The second Check ("A rational integral element represented simultaneously in the two
   semidirect factors maps to the identity") restates the first API bullet (`README.md:624`); the third
   is an instruction about closures and computes nothing. Only the torus Check discriminates.

   **Repair.** Replace the second and third by:

   - "For G=GL₂ and the hyperspecial point, H¹(Z_(p),G_m)=0 gives GL₂(Z_(p))/Z_(p)^×=PGL₂(Z_(p)), so the
     amalgam is an isomorphism on the second factor and A_int(GL₂)=GL₂(A_f^p)/Z_(p)^×; here Z_(p)^× is
     already closed in (A_f^p)^×, being {±1} times the discrete group generated by the primes ℓ≠p."
   - "By strong approximation for SL₂ the closure of GL₂(Z_(p))_+ in GL₂(A_f^p) is the set of g whose
     determinant is a positive rational number prime to p, so A_int/A_int° ≅ (A_f^p)^×/Q^×_(>0,(p)) ≅
     ∏_(ℓ≠p)Z_ℓ^×, the set of geometric components of the modular curve tower at level GL₂(Z_p). Taking
     the closure of Z(Z_(p)) in G(A_f) instead would also divide by Z_p^×-components that the integral
     group never sees."

   Computed on the instance: (A_f^p)^× = Q^×_(>0,(p)) × ∏_(ℓ≠p)Z_ℓ^×, so the quotient is ∏_(ℓ≠p)Z_ℓ^×, and
   π₀ of the tower at level GL₂(Z_p) is Q_(>0)∖A_f^×/Z_p^× = ∏_(ℓ≠p)Z_ℓ^×: the two agree.

5. **F05** (P3) *Needs* of §0.3 and §1.8 omit the Siegel inputs their sketches use

   **Location.** `README.md:262` (§0.3) and `README.md:452` (§1.8).

   **Claim.** Each *Needs* line lists the inputs of its statement and route (`README.md:200`).

   **Witness.** §0.3 uses "the finite étale Siegel level maps" (`README.md:260`), which are PELModuli §M6.1
   and, at chain level, gap:siegel-chain-moduli; its *Needs* has neither. §1.8 is stated for every
   normalized Hodge tower of §0.1, chain-level ones included, and its route is the Siegel good-reduction
   criterion; its *Needs* lacks gap:siegel-chain-moduli.

   **Repair.** §0.3 *Needs:* add "PELModuli §§M6.1–M6.4; ShimuraCompactifications Layer 7
   (gap:siegel-chain-moduli)". §1.8 *Needs:* add "ShimuraCompactifications Layer 7
   (gap:siegel-chain-moduli)". Both are already in the Layer 0 and Layer 1 dependency lists.

6. **F06** (P3) Layer 1 and the standing setup are named after an erratum history, not the mathematics

   **Location.** `README.md:334` "## Layer 1: Corrected local geometry"; `README.md:27` "The corrected Hodge
   setup"; `README.md:380` "KPZ repairs the tensor-compatible local-model comparison"; `README.md:658` "after
   repairing the Hodge construction".

   **Claim.** Layers are named by their mathematics; the README carries no process narrative.

   **Witness.** "Corrected" and "repairs" describe what KPZ §7.3 did to earlier papers; the mathematical
   content of the setup is (A)–(C) of KPZ line 3177–3180, whose distinguishing hypothesis is a very-good
   embedding.

   **Repair.** Rename to "## Layer 1: Local geometry of Hodge-type models" and "The very-good Hodge
   setup" (every occurrence of "corrected Hodge setup", 15 lines); replace `README.md:380` by "KPZ proves
   the tensor-compatible local-model comparison under very-goodness, with smoothness of the
   frame-to-filtration map" and `README.md:658` by "KPZ proves the finite étale connected-level passage in
   the very-good Hodge setup". The history stays in "Source conventions and corrections".

Six findings: one P1, one P2, four P3. Dependency check output, run on the package README:
`depcheck: 263 roadmaps, 2566 edges, 0 problem(s)` (no UPWARD or CYCLE line).

Texts read whole: `packages/ShimuraVarietiesPartII/README.md` (1440 lines) and
`packages/ShimuraVarietiesPartII/Suggested.lean` (45 lines, a module docstring and an empty namespace).
`git diff --stat origin/main...HEAD` changes only `packages/ShimuraVarietiesPartII/`.

## Verified sound

Counts: 0 Lean declarations (none exist); 65 bold targets and 73 *Needs* lines read; every source
locator of the README looked up in the cached texts, about 120 distinct items (KZ 45, HT 26, KPZ 31,
KP 24, K17 2), each found at the printed page given; 104 Check bullets and 8 example paragraphs
read, and every one with a numerical or explicit algebraic value recomputed (table below); 25
supplier roadmaps opened at main or at their open heads and every cited section heading found
there; 11 pinned declarations found at the file and line given (Mathlib 1b1ccf4, Tau Ceti 2fd255d).

Adversarial pass (values computed on each side):

| Statement | Instance | Values | Result |
|---|---|---|---|
| Conventions, E: y²=x³+x over F₅ | point count | x=0..4 give 1,0,1,1,0; #E=4; trace 2; inverse roots sum 2/5, product 1/5 | agrees |
| Conventions, norm versus power | ζ of order 24, q=25 | ζ·ζ⁵=ζ⁶; ζ²; dual ζ⁻⁶=ζ¹⁸; ratio ζ¹²=−1 | agrees |
| Conventions, F₂₅ polynomial | trace | 2²−2·5=−6; (2/5)²−2/5=−6/25 | agrees |
| Conventions, quasi-tame Check | norm-one torus of Q₃(∛3) | Galois image S₃, order 6; Weil-restriction shapes give order dividing 8 | agrees |
| §0.1 Check, E: y²=x³−x over F₃ | point count | 3 affine + 1; trace 0; ker F ≅ α_p², lines form P¹ | agrees |
| §0.1 Check, dual numbers | g e₁ g⁻¹ | [[1,−ε],[0,0]] | agrees |
| §0.3, free action | Z(Q)∩K, Hodge type, neat | finite and torsion-free, so trivial | holds |
| Examples L0, Y(9)→Y(3) | degree | kernel of GL₂(Z/9)→GL₂(Z/3) has 3⁴=81 elements; −1∉K(3) | agrees |
| §1.4, relative dimension | GL₂ hyperspecial | dim S̃=1+4=5, dim M_loc=1, q of relative dimension 4 | agrees |
| §2.1 Checks | GU(1,1) split at p; GSp_(2g) | Z^c=U(1)→G_m; Z^c=μ₂ not a torus | agrees with KZ line 1481–1490 |
| §3.4 Check | γ=diag(ℓ,1) | (1,2)↦ℓb, (2,1)↦c/ℓ | agrees |
| §3.8 Check | i∈Z(Q), p=5 | multiplier 1; i^k∉K_1^p for 4∤k; inertia cyclic of order 4 | agrees |
| §3.9 Check | GL₂, edge midpoint | det w=−p of valuation 1; fixer Iwahori; PGL₂ fixer has 2 components | agrees |
| §3.10 Check | GU(1,1) | dim G=5, dim G_ad=3, 1+3=4, 1+5=6 | agrees |
| §4.3 Checks | GL₂, PGL₂ | slopes (0,−1), (−1/2,−1/2), κ=−1; κ∈Z/2 values 0,1 | agrees |
| §4.5 Remark | SL₂, d=diag(3,1) | det 1/3; normalizer determinants ±(a²+b²), even 3-adic valuation | agrees |
| §4.7, openness | ordinary class | ν=μ◇ is the maximum, complement is a finite union of closed S_≤[b] | holds |
| §4.8 Check | p⁻¹ | n^(2d) versus p^(2d)·deg f | agrees |
| §4.9 Checks | 1±2i; π²=−3; δ_D=[[0,−1],[5,0]] | rank 2, e=1; e=2, Z(γ²)=GL₂; δ_D²=−5, standard square −1/5 | agrees |
| §4.11, direction | HT line 989–991, 1038–1041 | orbit → cosets well defined; converse not claimed | agrees |
| §5.3 Checks | 2, −2, −1, −11 mod 5 | non-square, non-square (3), square (4), square (4); ranks 3=2+1 | agrees |
| §5.4 Checks | Tr(i·xȳ/2); lattice f₁,f₂ | value 1 on (1,i); Gram determinant u²; t·f₁=f₁+f₂/5 | agrees |
| §7.1 Check | χ₃χ₇ level | K₃=G(Z₃); K^p∩G(Q₃) of index 2 | agrees |
| §7.2 Check | diag(1,1/5) | T²−(6/5)T+1/5 | agrees |
| §7.6, descent | one embedding per ℓ | a number field with a degree-one prime over almost every ℓ is Q | holds (RG3 §1.2) |
| §7.6, hypotheses | KZ line 2104–2106 | p>2, strongly acceptable, F_q/k_E finite, all ℓ≠p | same generality |

Other items checked and found correct: the Lean file has the single import `import Mathlib`, one
module docstring of the required form, the namespace `TauCetiRoadmap.ShimuraVarietiesPartII`, no
declaration, no `set_option`, no `lemma`; each of the seven headlines it lists lacks a carrier at the
pins (integral Shimura models, B(G), local models, tower local systems), so none is statable and
none is forced through a stand-in; no padding exists to remove. The 22 slugs of the declared gaps
appear both in `design/plan.json` and under "Exact supplier contracts". ArithmeticGaloisRepresentations
§1.11 on main contains the target "Reductive quotients over fields and DVRs" with Conj and χ as
cited. ReductiveGroupsPartIII §5.5 takes the conclusion of §7.6 as an explicit hypothesis and names
no supplier, so there is no cycle. Ownership against the open pull requests was checked with the
roadmaps tool for integral Hodge-type models, Newton strata on them, the tensor quasi-isogeny group
and Conj-valued Frobenius classes: no second owner found.

## Not verifiable

- The definition of "standard data" in GeometricSatakeAndFusionPartII, on which normality of the
  special-fibre components in its §3.1 rests, was not located at its head; §1.9 and §5.4 rely on it
  for the very-good Hodge setup.
- The sources that KPZ and KZ cite for the shtuka inputs other than PR24, and Noot's comparison used
  in §4.13, are not in the manifest and were not read.
- KP §4.6.21, whose assertion KPZ footnote 8 corrects, was not opened; the correction is taken from
  KPZ line 3417–3418.
- No Lean was elaborated: the file has no declaration, and this pass runs no build.

Source independence: 12 passages compared with 4 sources (KZ, HT, KPZ, KP), none shared beyond
runs of at most 5 words forced by the mathematics; largest share KZ, about 70 of 179 locators;
contents compared with KZ: independent (Layers 0–4 draw on HT, KPZ and KP; Layer 7 merges KZ §5.1
and §5.3 and follows Layer 6, an order forced by §7.4 needing §6.3 and §5.10).

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacters of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 and the proof of Lemma 4.3.8 use; affects a stated result.
- **Error** in KZ at (4.2.8.2), p.37: the source says the model is |J| copies of the quotient built from one fixed-level connected piece; it should be the union over j of pieces at the conjugate levels; affects the proof; corrected in print at KPZ §7.3.1(3), pp.86–87.
- **Misprint** in HT at §2.1.3, p.21: the source says the integral points of the isogeny group are its Q_p-points meeting the automorphisms; it should be its Q-points, as in the proof of Lemma 2.1.4, p.22; affects nothing.
- **Gap** in HT at §1.3.15, p.20: the source says a class with Newton point the averaged inverse Hodge cocharacter exists for every group; it should assume existence, automatic only for quasi-split groups (KZ Remark 2.2.5, p.10); affects a stated result.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, pp.202–203: the source says every component piece has the fixed level K_p°; it should be the level conjugated by the coset representative; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.
- **Error** in KP at Theorem 4.2.7, proof, pp.186–187: the source says the local frame-to-filtration map is a torsor; it should be isomorphic to the smooth action map; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Error** in KP at Theorem 4.2.7, hypotheses, p.186: the source says a good embedding suffices for the local-model diagram; it should require a very good one; affects a stated result; corrected in print at KPZ Remark 7.1.4(1), p.73.
- **Gap** in KP at Lemma 3.1.17, proof, p.169: the source says convergence in its auxiliary topology completes the argument; it should prove p-adic completeness and p-adic convergence; affects the proof; corrected in print at KPZ §7.3.1(2), pp.85–86.
- **Error** in KP at §4.6.21: the source says the modified simply connected cover is defined for every classical datum; it should require the type-D condition, satisfied for abelian type; affects nothing; corrected in print at KPZ §7.2.1, footnote 8, p.77.

## For the human reviewers

- **Licence.** HT and K17 are read from author pages (`sources.toml`, `licence_class = "author-page"`), in preprint pagination; the published versions (Duke 2022, JAMS 2017) were not collated.
- **Licence.** KZ is cited in arXiv v2 pagination; `sources.toml` records that it was not collated with the Annals version.
- **Scope.** Every headline depends on the 22 declared supplier gaps; R01 and R02 concern two of them whose statements are about this roadmap's own models. Whether those theorems belong here or in a supplier is an ownership decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "56ec826db4fe808d3ad9528e69ce60306377abb6", "job": "RT-ShimuraVarietiesPartII~1a", "model": "fable", "worker": "chris-x26"} -->
