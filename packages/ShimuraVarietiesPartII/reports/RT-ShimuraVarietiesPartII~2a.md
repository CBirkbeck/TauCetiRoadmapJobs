<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6918718568 -->
Red team round 2 pass a (claude) of e3fbcf2

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the "torsion-free" Siegel level does not exist

   **Location.** `packages/ShimuraVarietiesPartII/README.md:19`: "a Siegel level K′^p is compatible
   with K^p when it contains the image of K^p, is neat and torsion-free (for instance, contained in
   the principal congruence subgroup of a level N≥3 prime to p)"; used at `README.md:19` ("Every K^p
   contains a sufficiently small normal open subgroup"), `README.md:62`, `README.md:434` ("through
   elements of K′^p, which is torsion-free"), `README.md:438`.

   **Claim.** Compatible Siegel levels exist, principal levels N≥3 are torsion-free, and every K^p
   contains a sufficiently small subgroup.

   **Witness.** Every compact open K′^p⊂GSp(V)(A_f^p) contains GSp(Z_ℓ′) for almost all ℓ′, hence
   the element −1 at one such ℓ′ and 1 elsewhere, of order 2; (1 at 3, −1 at 7) lies in the principal
   level 3. So "sufficiently small" is empty.

   **Repair.** Only one prime is needed.

   - `README.md:19`: replace "is neat and torsion-free (for instance, contained in the principal
     congruence subgroup of a level N≥3 prime to p)" by "is neat and is contained in the principal
     congruence subgroup of level N of a lattice of V⊗A_f^p, for some integer N≥3 prime to p. Fix a
     prime ℓ and k≥1 with ℓ^k exactly dividing N and ℓ^k≥3 (one exists for every N≥3): the image of
     K′^p in GSp(V_Qℓ) lies in the kernel of reduction modulo ℓ^k, which is torsion-free. K′^p itself
     is never torsion-free: it contains −1 at almost every prime".
   - `README.md:434`, in (iii)⇒(ii): replace from "so the inertia group of F acts on the prime-to-p
     Tate module" to "A_s has good reduction over R" by "so the inertia group of F acts on T_ℓ(A_s),
     ℓ the prime of Conventions, through a finite quotient; since the K′^p-level structure of s is
     F-rational, each inertia element acts on T_ℓ(A_s) through the ℓ-component of an element of K′^p,
     an element of finite order of a torsion-free group, hence trivially; so A_s has good reduction
     over R by the criterion at the one prime ℓ".
   - `README.md:62`: replace the last sentence by "Neatness of a level concerns its rational
     intersections only; the principal-level condition on a Siegel level used in §1.6 is imposed
     separately in Conventions."
   - `README.md:438`: replace "The torsion-free Siegel level cannot be dropped" by "The
     principal-level condition on the Siegel level cannot be dropped", and add to §1.6 the Check "The
     element −1 at ℓ′=7 and 1 elsewhere has order 2 and lies in the principal level 3 of GL₂(Ẑ^p),
     p≠3,7: no compact open subgroup of GSp(A_f^p) is torsion-free, and the criterion uses only the
     3-component, which is 1."

   Tested on the witness: the order-2 element is now allowed and its ℓ-component is 1, so the inertia
   argument is unaffected; the level GL₂(Ẑ^p) of the j=0 Remark is in no principal level N≥3 and stays
   excluded. Existence: for K^p with ι(K^p) in the principal level N, intersect a level given by KZ
   §4.1.5 with that principal level; the map to the smaller Siegel variety is still a closed immersion,
   its composite with a finite map being one. Conjugation-stability of compatible pairs (`README.md:19`)
   holds with "principal level of a lattice", the lattice being conjugated too.

2. **F02** (P2) the Hodge-type theorem of §1.7 is routed through a Siegel model that is not canonical

   **Location.** `README.md:473`: "G^fix(Z̆_p) is the stabilizer in G(Q̆_p) of Λ⊗Z̆_p for the single
   lattice Λ"; `README.md:477`: "compare completions through the Siegel model at the level of the
   lattice or chain, which is canonical (DvHKZ Lemma 4.2.1)". Consumed by §3.9 (`README.md:815`) and
   §5.1 (`README.md:1111`), both at single-lattice level.

   **Claim.** For any lattice Λ⊂Λ∨ the Siegel model of §0.1 is a canonical integral model, so DvHKZ
   Theorem 4.1.8 gives (c) and (d).

   **Witness.** DvHKZ line 1141, 1214, 1458 need a quasi-parahoric model of GSp. For
   G=GL₂×_(G_m)GL₂⊂GSp₄ and Λ=⟨e₁,p³f₁⟩⊕⟨e₂,f₂⟩, Stab_(GSp₄)(Λ) has opposite root groups
   e₂↦e₂+te₁, e₁↦e₁+se₂ with t∈Z̆_p, s∈p³Z̆_p; a parahoric allows exponent sum ≤1.

   **Repair.** The statement is kept; the route changes. In `README.md:477` replace the sentence "For
   (d), compare completions … DvHKZ Theorem 4.1.8)." by:

   "For (c) and (d) at a single lattice Λ, first pass to the Zarhin enlargement (§0.1;
   PadicDifferentialEquationsAndRigidCohomology §RD.5.116): the Hodge embedding on (V⊕V∨)⁴ with the
   self-dual lattice Λ_Z built from Λ and Λ∨, whose stabilizer in G(Q̆_p) is that of Λ. The morphism
   A↦(A×A∨)⁴ from the Siegel model of Λ to the hyperspecial Siegel model of Λ_Z is finite, and both
   closures contain Sh_K as a dense open subscheme, so the two closures of Sh_K have the same
   normalization. At a hyperspecial or lattice-chain level the Siegel model is canonical (DvHKZ Lemma
   4.2.1), and DvHKZ Theorem 4.1.8, whose hypothesis is the stabilizer equality, gives (c) and (d) for
   the normalized closure (PaRa24 §§4.6–4.7)."

   Add `PadicDifferentialEquationsAndRigidCohomology §RD.5.116` to the *Needs:* line at `README.md:479`
   and to the Layer 1 *Dependencies*. Add to the §1.7 Checks: "For G=GL₂×_(G_m)GL₂ in GSp₄ and
   Λ=⟨e₁,p³f₁⟩⊕⟨e₂,f₂⟩ the stabilizer of Λ in G is hyperspecial, but its stabilizer in GSp₄ is not
   quasi-parahoric (opposite root groups with exponents 0 and 3), so 'canonical' has no meaning at
   that Siegel level; Λ_Z is self-dual and its stabilizer is hyperspecial."

   Tested on the witness: for Λ=⟨e₁,p³f₁⟩⊕⟨e₂,f₂⟩ the model is the product of two smooth modular
   curves, mapped by (E₁,E₂)↦E₁×E₂ with polarization p³λ₁×λ₂; its Zarhin image is in the principally
   polarized moduli of dimension 16, a hyperspecial level, and the normalization is unchanged.

3. **F03** (P3) one letter for two points in the Definition of §1.7

   **Location.** `README.md:442`: "x a point of the extended building of G_Qp with full fixer G^fix";
   `README.md:447`: "(d) for every x∈S_K(k), with b_x∈G(Q̆_p)".

   **Claim.** The definition names its data unambiguously.

   **Witness.** In (d) "the completion of S_K⊗O_Ĕ at x" and "b_x" refer to the point of S_K, while
   "quasi-parahoric model at x" (`README.md:442`, `:465`) refers to the building point; §1.8
   (`README.md:483`, `:487`) uses x for the special-fibre point and b_x again.

   **Repair.** In `README.md:442` and `:465` write the building points as z and z′ ("z a point of the
   extended building … a quasi-parahoric model at z", "quasi-parahoric models at points z, z′"); keep
   x for points of S_K.

Round 2. Three new findings: one P1, one P2, one P3. Both blocking findings are errors introduced
by the round-1 repairs (the new Conventions on Siegel levels, and the proof route of the new
Hodge-type theorem of §1.7). Texts read whole: `packages/ShimuraVarietiesPartII/README.md` (1486
lines) and `packages/ShimuraVarietiesPartII/Suggested.lean` (45 lines, no declaration).

## Round-1 findings at this head

| Id | Status | Witness at this head |
|---|---|---|
| 1a/F01 (P1) canonical integral model undefined, unowned, order inverted | repaired, with a new defect in the proof route (S02) | `README.md:442–449` defines axioms (a)–(d); `README.md:465` and `:473` state uniqueness, functoriality and the Hodge-type theorem; §1.6 is now the extension property and §1.8 consumes §1.7 (`README.md:489`). Axioms compared with PaRa24 line 3277–3292 and DvHKZ line 1141–1165: same content. gap:integral-local-shimura (`README.md:132`) has only local items (i)–(vi). |
| 1a/F02 (P2) gap asked a local supplier for a global reduction | repaired | `README.md:811`: "The pullback of π to S_(K°) has a reduction of structure group to a G°-torsor"; hypotheses equal DvHKZ Theorem 4.3.6 with (A)–(C) (DvHKZ line 1624–1627, 1959–1966). The gap (`README.md:134`) names only the exact sequence and the v-sheaf local-model map. |
| 1a/F03 (P3) "neat" redefined | partly repaired: the neat part is right, the added Siegel-level clause is false (S01) | `README.md:19`: "every rational intersection G(Q)∩xK_pK^px⁻¹ … consists of neat elements" agrees with AdelicAlgebraicGroups §4.3 (`Neat.IsNeatLevel`, all rational intersections). |
| 1a/F04 (P3) §3.1 Checks | repaired | `README.md:666–667`; recomputed below. |
| 1a/F05 (P3) *Needs* of §0.3 and the extension theorem | repaired | `README.md:270`, `:428`, `:436` list PELModuli §§M6.1–M6.4 and gap:siegel-chain-moduli. |
| 1a/F06 = 1b/F05 (P3) erratum vocabulary | repaired | `README.md:342` "Layer 1: Local geometry of Hodge-type models"; "corrected" occurs only under "Source conventions and corrections" (`README.md:1481–1485`). |
| 1b/F01 (P2) companions without p-plain | repaired | `README.md:188` assumes eigenvalues "units at every finite place not above p"; witness (Frobenius 3, ℓ′=3) is excluded; §7.3 (`:1405`) now says "algebraic". |
| 1b/F02 (P2) finite-level criterion unstated | repaired as a statement; its proof and hypothesis rest on S01 | `README.md:430` states (i)⇔(ii)⇔(iii); §4.5 (`:953`, `:955`) and §5.4 (`:1180`) cite it. |
| 1b/F03 (P2) gap:compact-quotient-borel vague | repaired | `README.md:122` states (a), (b) with both boundary cases; agrees with K17 line 1383–1394. |
| 1b/F04 (P3) Checks on an excluded datum | repaired | `README.md:1398–1399`, `:1453`, `:1461` use T=Res_(Q(i)/Q)G_m at p=5; recomputed below. |
| 1b/F06 (P3) restating Checks | repaired | `README.md:594`, `:618`, `:746`, `:773`, `:1337`; each recomputed below. |
| 1b/F07 (P3) page of KPZ §7.3.1(2) | repaired | `README.md:1482`: "p.86". |

## The pass: recomputed instances

`Suggested.lean` declares nothing: 0 declarations, 0 section variables, 0 instances; no `#check`
file was elaborated because there is no name. Its docstring lists 7 headlines; the README lists
the same 7 (`README.md:15`). None is statable at the pins (each needs an integral model of a Shimura
variety), none is forced through a stand-in, nothing is padding.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, compatible Siegel level | (1 at 3, −1 at 7) in principal level 3; GL₂(Ẑ^p) | order 2; −1∈GL₂(Z_ℓ′) for all ℓ′ | no torsion-free level exists | S01 |
| Conventions, neat | K(3)⊂GL₂(Ẑ); GL₂(Ẑ) | rational intersections neat; contains −1 | agrees with AdelicAlgebraicGroups §4.3 | none |
| Conventions, E: y²=x³+x over F₅ | point count | 1,0,1,1,0; #E=4; trace 2; T²−(2/5)T+1/5; over F₂₅ trace 4−10=−6 | agrees | none |
| §1.6 finite level, (iii)⇒(ii) | y²=x³+p, p≥5 | Δ=−432p², v_p=2<12, c₄=0: additive; j=0 | fails at level GL₂(Ẑ^p), as the Remark says | S01 for the hypothesis |
| §1.6 finite level, kernel of reduction | 1+ℓ^kM(Z_ℓ), ℓ^k=3, 4, 2 | torsion-free for 3 and 4; contains −1 for 2 | N≥3 needed, one prime suffices | S01 |
| §1.7 (a), deleted supersingular locus | E supersingular over W(k) | inertia trivial on prime-to-p torsion; no extension | (a) fails, (b)–(d) hold | none |
| §1.7 (d), blow-up at (p,t) | chart p=tv | W[[t,v]]/(tv−p), special fibre tv=0 a node; W[[t]] regular | (d) fails at the node | none |
| §1.7 Check 3 | GSp₄, p=3, E: y²=x³−x | 3 affine points, #E=4, trace 0; ker F=α_p², P¹ of subgroups | fibre of dimension ≥1, not finite | none |
| §1.7 axioms against sources | PaRa24 a)–c); DvHKZ (i)–(iv) | (a)=(i), (b)=(ii), (c)=(iii), (d)=(iv) over k; DvHKZ proof of 4.1.10 uses only F̄_p-points (line 1295) | k-points suffice for functoriality | none |
| §1.7 Hodge type, single lattice | GL₂×_(G_m)GL₂, Λ=⟨e₁,p³f₁,e₂,f₂⟩ | root exponents (0,3), sum 3>1 | GSp-stabilizer not quasi-parahoric | S02 |
| §1.7 Hodge type, chain | Λ⊂Λ∨⊂p⁻¹Λ | self-dual periodic chain, parahoric stabilizer | PaRa24 Theorem 4.5.2 applies | none |
| §1.8 | GL₂ hyperspecial | both completions W[[t]] | consistent | none |
| gap:integral-local-shimura (v) | PaRa26 condition (A) | (A) is p≠2 (PaRa26 line 342) | "p>2, abelian type" is the source hypothesis | none |
| gap:integral-local-shimura (vi) | derived isomorphism f | f(Z)⊂Z′ since G′=G′^der·Z′; adjoint groups equal | is an ad-isomorphism (PaRa26 line 1279–1282) | none |
| §3.1 Checks | GL₂, Z_(p)^×∩∏Z_ℓ^×; (A_f^p)^× | {±1}; Q_(>0,(p))×∏_(ℓ≠p)Z_ℓ^×; π₀=Ẑ^×/Z_p^× | both sides ∏_(ℓ≠p)Z_ℓ^× | none |
| §3.5 Check | principal level N, p∤N; level Γ(p) | Ẑ^×/(1+NẐ)=(Z/N)^×; (Z/Np)^× | Q(ζ_N) unramified at p; Q(ζ_(Np)) ramified | none |
| §3.6 Check | w=[[0,1],[p,0]], diag(p,1) | wMw⁻¹=[[d,c/p],[pb,a]]; [[a,pb],[c/p,d]] with c=p gives 1 | w normalizes I, diag(p,1) does not | none |
| §3.8 Check | GU(1,1) of Q(i), scalar i | i·ī=1; order 4 | inertia of order 4 | none |
| §3.9 theorem | GL₂ edge midpoint; PGL₂ | fixer Iwahori (det w=−p); 2 components in PGL₂ | reduction needed only for disconnected fixers | none |
| §3.9 theorem, hypotheses | DvHKZ (A)–(C) | p coprime to 2·|π₁(G_der)|, R-smooth, very good | equal to the very-good Hodge setup | none |
| §2.4, §2.5 Checks | index 3 and 2 at p=3; x²≡−1 mod 5, mod 3; x²≡−2 mod 3 | 3∣3, 3∤2; 2²=4; none; 1²=1 | agree | none |
| §4.9 Checks | (1∓2i)/5; π²=−3; δ_D=[[0,−1],[5,0]] | rank 2, e=1; e=2, Z(γ²)=GL₂; δ_D²=−5 | agree | none |
| §5.1 sketch | f with G^der≅G′^der | centre to centre, adjoint isomorphism | hypothesis of PaRa26 Proposition 5.3.1 met | S02 for the single-lattice input |
| §5.3 Checks | 2, −2, −1, −11 mod 5 | non-square, 3 non-square, 4 square, 4 square | agree | none |
| §5.4 Checks | Tr(i·xȳ/2) on (1,i); f₁=e₁+e₂/5 | 1; t=(1,2) gives f₁+f₂/5 | agree | none |
| §6.3 Check | γ² for γ=(1−2i)/5 | (−3−4i)/25: trace −6/25, norm 1/25 | T²+(6/25)T+1/25 | none |
| §7.2 Checks, Examples, Downstream | γ=(1∓2i)/5 | trace 2/5, norm 5/25=1/5; inverse 1±2i: (2,5) | agree | none |
| §7.1 Check 4 | χ₃χ₇ level | image at 3 is G(Z₃); intersection of index 2 | agree | none |
| gap:open-curve-companions | Frobenius 3, ℓ=2, ℓ′=3 | 3 not a 3-adic unit | excluded by the hypothesis | none |
| gap:compact-quotient-borel | G_m, I=1; GL₂, I=B | F^× not compact; P¹(F) compact, I° solvable | both hypotheses needed | none |

Dependency check (the command of the brief, on this head):
`depcheck: 265 roadmaps, 2607 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Declarations read:** 0. Single `import Mathlib`, one module docstring of the required form,
  namespace `TauCetiRoadmap.ShimuraVarietiesPartII`, no `set_option`, no `lemma`.
- **Targets read:** 63 numbered sections in 8 layers, every statement, sketch, API bullet, Check
  and Remark.
- **Locators verified this round (new or changed text):** 31. PaRa24: §4.1 and Proposition 4.1.2
  (line 3205–3245, p.77), Conjecture 4.2.2 and (4.2.1) (3271–3292, p.78), remark after it
  (3293–3298), Theorem 4.2.4 (3314, p.79), Theorem 4.3.1 and Corollary 4.3.2 (3457–3471, pp.82–83),
  §4.5.2 (3576–3633, pp.85–86), Theorem 4.5.2 (3642, p.87), Proposition 2.6.3 (1660, p.40), Theorem
  2.7.7 (2059, p.48), Corollary 2.7.10 (2117, p.50), §§4.6–4.8 (3652, 3956, 4132), §4.9.1 (4179,
  p.99). DvHKZ (printed page = file page − 4): Definition 4.1.2 (1141, p.28), Theorem 4.1.8 (1214,
  p.30), Proposition 4.1.10 (1261, p.31), Corollary 4.1.13 (1385, p.34), Theorem 4.1.15 (1405, p.35),
  Lemma 4.2.1 (1458, p.36), Theorem 4.2.3 (1470, pp.36–37), Remark 4.2.4 (1483, p.37), (4.3.1) (1502,
  p.37), Proposition 4.3.3 (1549, p.38), Lemma 4.3.4 (1565, p.39), Theorem 4.3.6 (1624, p.40),
  Theorem A.3.3 (1990, p.50). PaRa26: Definition 2.4.1 (293, p.7), Theorem 2.5.5 (367, p.9),
  Propositions 3.2.1–3.2.2 (499, 514, pp.12–13), Proposition 5.3.1 (1433, p.35). HT Lemma 1.3.6
  (764–773, p.17). KZ Proposition 4.3.2 and proof (1636–1668, pp.37–38). The locators of unchanged
  text were verified in round 1 (about 120 and 74 items in the two passes) and were not repeated.
- **Checks tested:** 34 recomputed (table), among them all Checks added or replaced in the repair
  round.
- **Sibling citations checked:** the 9 new or changed ones, each at main or at its open head:
  AdelicAlgebraicGroups §4.3 (main, `Neat.IsNeatLevel`, rational intersections);
  ShimuraVarieties §0.3 ("Shimura specialization of cofinal neat levels");
  DiamondsAndVStacksPartII §§D7.6, D9.8, D10.11 (headings and statements as cited);
  HeckeStacksAndLocalShtukas §§HS2.1, HS2.10, HS2.11, HS2.13. The other citations were checked in
  round 1 and `roadmaps resolve` reports none missing.
- **Gaps:** 22 slugs, the same set in `design/plan.json` and under "Exact supplier contracts", each
  with the plan's supplier. For 17 the README sentence contains the plan's `needs` verbatim; for 5
  (noot-coarse-comparison, component-specialization, siegel-chain-moduli, rg3-r-smooth-tori,
  integral-hodge-realization-extension) the wording differs without change of content. The six
  items of gap:integral-local-shimura and the two of gap:general-connected-reduction were compared
  with their sources and carry the sources' hypotheses.
- **Ownership.** Checked with the roadmaps tool against main and the open heads for canonical
  integral models and connected-level reduction: no second owner; no fully qualified name is
  shared, the Lean file having none.
- **Policy.** The pull request changes only `packages/ShimuraVarietiesPartII/`. No pull-request
  number, no process narrative outside "Source conventions and corrections", every target has a
  locator, no algorithm.
- **Build order.** §1.6 → §1.7 → §1.8 has no forward reference; §3.9 needs §1.7 and §3.3, both
  earlier; no cycle.

## Not verifiable

- That the Zarhin morphism of S02's repair is finite on the integral Siegel models is taken from
  the standard argument (properness by good reduction, quasi-finiteness) and was not checked
  against a written source.
- PaRa24 §§4.6–4.8 and DvHKZ Appendix A were read only at the statements cited, not line by line.
- Truth of the declared supplier gaps beyond the instances in the table.
- KZ, HT and K17 are cited in preprint pagination; agreement with the published numbering was not
  checked. PaRa24, PaRa26 and DvHKZ are cited in arXiv numbering, as the References say.
- No Lean was elaborated: the file has no declaration.

Source independence: 10 passages compared with 5 sources (PaRa24 Conjecture 4.2.2, Theorem 4.2.4
and Theorem 4.5.2; DvHKZ Definition 4.1.2, the proofs of Propositions 4.1.10 and 4.3.3; PaRa26
Theorem 2.5.5 and §5.1; HT Lemma 1.3.6; KZ proof of Proposition 4.3.2), none shared beyond runs of
at most 5 words forced by the mathematics; largest share KZ, 101 of 283 locators; contents compared
with KZ: independent (Layers 0–4 draw on HT, KPZ, KP, PaRa24 and DvHKZ; Layers 5, 6, 7 use KZ
§§4.3–4.4, 5.2, and 5.1 with 5.3, an order forced by §7.4 needing §6.3 and §5.10); no table, figure
or list reused.

## Source issues

- **Error** in DvHKZ at the proof of Theorem 4.2.3, p.36, and §A.3, p.49: the source says the stabilizer in GSp of any lattice on which the form is integral is a parahoric; it should take a self-dual lattice or a lattice chain; affects the proof.
- **Gap** in KZ at the proof of Proposition 4.3.2, p.37: the source says the Pappas–Rapoport existence theorem applies to its single-lattice normalized models; it should first compare them with the lattice-chain or self-dual-lattice models; affects the proof.

The source issues of round 1 (KZ Proposition 4.2.3(5); HT §§1.3.15, 2.1.3 and the proof of
Proposition 1.3.10; KP Theorem 4.2.7, Lemma 3.1.17, Lemma 4.6.13 and §4.6.21) stand as reported
there and were not re-examined.

## For the human reviewers

- **Licence.** HT and K17 are read from author pages (`sources.toml`, `licence_class = "author-page"`); KZ, PaRa24, PaRa26 and DvHKZ from arXiv, not collated with the published versions.
- **Scope.** HeckeStacksAndLocalShtukas, at its open head, places integral local models and integral deformation-space representability outside its scope; gap:integral-local-shimura (i), (v), (vi) ask it for them (`README.md:132`).
- **Scope.** KZ and DvHKZ treat single-lattice Hodge models as canonical without the comparison of S02; whether the roadmap states that comparison as its own target or leaves it in a proof sketch is an ownership choice.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e3fbcf2559d13990640be55f34330df59d2e8c60", "job": "RT-ShimuraVarietiesPartII~2a", "model": "fable", "worker": "chris-x29"} -->
