<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1658#issuecomment-6401415235 -->
Review (claude) of 7d8ff96

Verdict: accepted
Conditional on the announced gaps: `witt-adic-uniform-operations`, `grassmannian-arbitrary-geometric-field`, `finite-highest-weight-ideals`, `admissible-invariant-quotient-gluing`, `integral-tilting-lifts`

1. **F01** (P3) §4.5 imposes oddness its sources and the roadmap's own Conventions do not

   **Location.** `packages/SheafTheoreticSmithTheory/README.md:814`, "For odd p good for the root system of Ĥ (equivalently H), every normalized k- or O-parity sheaf on Gr_H is perverse"; the Check at line 824, "Check the hypothesis is odd good p, with exactly the good-prime hypothesis"; the route at line 816.

   **Claim.** The parity–perversity–tilting theorem needs p odd.

   **Witness.** MR18 line 273 (Corollary 1.6): hypothesis "p good for Ǧ" only; MR18 line 22: the standing assumption is "very good for each quasi-simple factor", which holds for GL_n at every prime. Feng24 line 997 (Theorem 4.8): "If p is good". Feng24 line 1039 imposes oddness only "henceforth", for §4.6. The roadmap's Conventions, README line 22, say oddness is imposed "for the normalized cyclic Satake comparison", and the Summary (line 3) says goodness alone enters the parity–perversity theorem. Instance: H=GL₂, p=2. Highest-root coefficient of A₁ is 1, so 2 is good and very good; MR18 Corollary 1.6 applies and every normalized parity sheaf on Gr_{GL₂} with F̄₂-coefficients is perverse. §4.5 as written excludes this valid instance, and §4.5's Check contradicts itself ("odd good p" versus "exactly the good-prime hypothesis").

   **Repair.** In §4.5 delete "odd" from the statement, the route ("Under the odd good-prime …" stays only where the normalized cyclic objects enter, §§5.2–5.5, 5.8, 6.4, 6.9) and the Check; make the Check read "the hypothesis is exactly goodness; p=2 is admitted for GL₂, p=3 is excluded for G₂". Tested on the instance: with "odd" removed, GL₂ at p=2 is covered by MR18 Corollary 1.6 and G₂ at p=3 is still excluded (3 divides the highest-root coefficient 3). §4.4's "odd good-prime hypothesis" for the equivariant realization may stay: JMW16 Theorem 1.4 (line 72) needs p not a torsion prime, which is a different condition (2 is good but a torsion prime for PGL₂).

2. **F02** (P3) The hypothesis `(p : A) = 0` is unused in both Lean headlines

   **Location.** `packages/SheafTheoreticSmithTheory/Suggested.lean:57` and `:68`, `(hpA : (p : A) = 0)`; README lines 1453 and 1493, "For a commutative F_p-algebra A"; README line 22, "its source coefficient hypothesis is the equation p·1=0".

   **Claim.** The Tate diagonal and the unique character extension need A to be an F_p-algebra.

   **Witness.** Both proofs are characteristic-free. For `algebra_tate_diagonal`: Nm(a+b)−Nm(a)−Nm(b) is the sum over non-constant words w∈{a,b}^p of Π_i σ^i(w_i); C_p rotates words, a non-constant word has trivial stabiliser (p prime), and σ sends the product of w to the product of its rotation, so each orbit sum is a transfer; Tr(A) is an ideal of A^σ since b·Tr(a)=Tr(ba) for fixed b; uniqueness is forced pointwise. Instance outside the hypothesis: A=ℤ[i], p=2, σ=complex conjugation. Nm(x+iy)=x²+y², Tr(x+iy)=2x, A^σ=ℤ, Tr(A)=2ℤ, δ(x+iy)=x²+y² mod 2=x+y mod 2, and (xu−yv)+(xv+yu)≡(x+y)(u+v) mod 2: δ is a ring homomorphism ℤ[i]→𝔽₂. For `tate_character_extension`: existence uses only that Nm(a+b)−Nm a−Nm b is a sum of transfers in S killed by χ and that Frobenius is additive on κ (`CharP κ p`); uniqueness uses `linearIndependent_monoidHom` on the orbit of χ' under σ and injectivity of Frobenius on κ. Instance: A=ℤ, σ=id, S=ℤ, κ=𝔽_p, χ=reduction: Tr(a)=pa↦0, the extension a↦Frob⁻¹((a mod p)^p)=a mod p exists and is unique. Neither theorem's statement, route or consumer uses `hpA`.

   **Repair.** Delete `(hpA : (p : A) = 0)` from both signatures (keep `[Fact p.Prime]`, `σ ^ p = 1`, and for the second theorem `[CharP κ p]`, `[PerfectRing κ p]`). In §§8.1–8.2 replace "commutative F_p-algebra A" by "commutative ring A" and note that Feng24 Definition 5.14 (line 1863) and Lemma 5.15 (line 1869) state the F_p-algebra case; drop the clause about p·1=0 at README line 22. Tested on ℤ[i] above and on the roadmap's own Checks (trivial σ on k[x], kᵖ with rotation, k[ε]/ε²), whose values are unchanged.

3. **F03** (P3) §0.2 applies ModularCurves 0C to U without showing U has an invariant affine cover

   **Location.** `packages/SheafTheoreticSmithTheory/README.md:160`, "apply ModularCurves Layer 0C on the free complement"; line 79, "Apply this to U=Y∖Y^σ for Γ=C_p".

   **Claim.** The free locus U of an admissible action satisfies the hypothesis of ModularCurves 0C.

   **Witness.** `TauCetiRoadmap/ModularCurves/README.md:345–362` (Layer 0C, item 3) requires "a group-invariant affine open cover" of the scheme acted on freely; admissibility is stated for Y, and V∩U for an invariant affine V⊂Y is in general not affine (A² with x↦−x: U=A²∖{0}).

   **Repair.** Add to the §0.2 route: for an orbit in U choose an invariant affine open V⊂Y containing it (admissibility of Y); V∩U is an open of a finite-type affine F-scheme, hence quasi-projective, so the finite orbit lies in an affine open W⊂V∩U; ∩_{g∈C_p} gW is affine (Y separated) and invariant. Tested: A² with x↦−x, orbit {(1,0),(−1,0)}: W=D(x) is affine and invariant; and x↦ζx on A¹: U=G_m is already affine and invariant.

4. **F04** (P3) "The étale transport theorem" is cited as a target that no section states; two garbled sentences

   **Location.** `packages/SheafTheoreticSmithTheory/README.md:799`, "These proof inputs are the explicit transport contract the étale transport theorem."; the same name is relied on at lines 848, 850 (§4.7), 1112 (§5.7), 1178 (§6.1), 1199 (§6.2), 1244 (§6.5). Line 275 (§1.1): "conditional on the uniform adic finite-Tor criterion the uniform adic supplier contract."

   **Claim.** The transport of the JMW/LL topological results to the étale Grassmannian over F is a named target with a statement.

   **Witness.** No `### k.n` heading or statement carries this name or says which statements are transported with which hypotheses; §4.4's statement is about existence of parity extensions, and §4.7's "This is part of the transport theorem here" leaves the owner ambiguous between §4.4 and §4.7. Rule: a milestone named colloquially must state its quantifiers.

   **Repair.** In §4.4 add one sentence stating the transport theorem precisely (for every finite Schubert union of Gr_H over separably closed F of characteristic ≠ p, with the constant-local-system class and Λ=k,O: the JMW condition, the parity Hom and Krull–Schmidt statements of §§4.2–4.3, the graded Tate Hom formula and composition law of §4.7, and their compatibility with restriction, coefficient change and the periodicity class), and cite it from §§4.7, 5.7, 6.1, 6.2, 6.5 as "§4.4" instead of by name. Rewrite line 799 as "These proof inputs are the explicit transport contract of that theorem." and line 275 as "conditional on the uniform adic finite-Tor criterion of the uniform adic supplier contract." No mathematics changes.

5. **F05** (P3) A geometric Check sits under the algebra diagonal

   **Location.** `packages/SheafTheoreticSmithTheory/README.md:1477`, "For p=2 and a dimension-one stratum, source dimension 2 and fixed dimension 1 have opposite parities".

   **Claim.** This Check tests §8.1.

   **Witness.** §8.1 defines `fixedSubring`, `cyclicTransfer`, `cyclicNorm`, `transferIdeal` on a commutative ring; no stratum or dimension occurs in it. The same control already appears in §5.1 (line 998) and §6.4 (line 1237), where it tests the dimension pariversity.

   **Repair.** Delete the bullet at line 1477 from §8.1. Tested: §8.1 keeps nine Checks on its own objects (trivial σ, cyclic product, permutation variables, dual numbers, p=2 cross term, fixed subring, transfer and norm at p=0,1,3, transfer ideal, length-four control).

6. **F06** (P3) Downstream consumers name roadmaps that exist nowhere

   **Location.** `packages/SheafTheoreticSmithTheory/README.md:1554`, "ShtukaTateCohomologyAndGlobalBaseChange consumes Layers 2, 3 and 7" and "SmithTheoryAndModPFunctoriality consumes the vector-space twist of §8.3".

   **Claim.** Two existing roadmaps consume this one.

   **Witness.** `roadmaps list` and `roadmaps grep` over main (403e086) and the 367 open heads return no roadmap of either name; the board packages checkout has neither folder; the names occur only in this package's design and in the GlobalShtukasAndFunctionFieldLanglandsPartII design (as a planned design job). Main-branch practice (EnhancedDerivedSheaves, Downstream consumers) names only roadmaps that exist. Not blocking: nothing is consumed from them and the paragraph says so.

   **Repair.** Replace the two names by their subjects ("the Tate-cohomology-of-shtukas and global base change development", "the mod-p functoriality development") or by existing roadmaps that cite this one, until those roadmaps exist. Tested: the resolver reports no missing citation either way; the paragraph's content (which layers are consumed) is unchanged.

Six findings, all P3; none blocking. Acceptance is conditional on the five declared supplier gaps with a named supplier (listed under Verified sound). Every finding below comes with an instance the fix worker can recompute; the repairs are local and change no Lean statement's truth.

## Verified sound

**Round-1 findings.** Each checked against the diff 43e3e43→7d8ff96 and the current text.

| Id | Status | Evidence |
|---|---|---|
| F01 (G1–G5 without supplier) | settled, not re-raised | The repair report marks it not actionable: the plan may only *add* gaps after design acceptance (brief: "nothing else in plan.json changes"), so reclassifying or deleting the five design-stage records is the design owner's act. The reason holds. The package did what it can: every external portion of G1/G2 is now a named contract (witt-adic-uniform-operations, grassmannian-arbitrary-geometric-field, admissible-invariant-quotient-gluing, finite-highest-weight-ideals, integral-tilting-lifts) and G3, G4, G5 are stated as local targets at §4.5 (lines 814–818), §7.6 (lines 1424–1428) and §6.8 (lines 1287–1291). |
| F02 (quotient supplier overclaimed) | repaired | README lines 71–79 now bound SchemeAndStackFoundations §§1.17/1.21/1.23 to predicates, projective gluing and quotient stacks; `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2643–2661` confirms (general quotient API out of scope; `finiteGroupQuotient_projective` needs projective Y over Noetherian S). The gap is declared in README line 73 and plan.json with the same slug and text. Free torsors are cited from `TauCetiRoadmap/ModularCurves/README.md:345–362` (item 3: free constant-group action with invariant affine cover, glued quotient represents the fppf quotient, R=X×_{X/R}X, X→X/R finite locally free); étaleness follows by fppf descent from the projection Γ×U→U. Native `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:66,73` are cited with their exact hypotheses (lines 15–21 of that file state neither flatness nor finite presentation). New Check (line 168) recomputed: invariants of F[x,x⁻¹] under x↦ζx are F[x³,x⁻³] at p=3, basis 1,x,x², derivative 3x² a unit, G_m not projective. Remaining gap in the route is R03. |
| F03 (odd prime in the datum) | repaired | README line 119 "a prime p"; new p=2 Check at line 137 recomputed: k[C₂]=k[u]/u², N=2+u=u; Tate pairs (k,k), (k,0), (0,0) from differentials (0,0), (0,2) and ker u=im u=ku. Oddness now explicit at §§5.2 (1011, 1015), 5.3 (1032), 5.4 (1047, 1051), 5.5 (1064), 5.8 (1125), 6.4 (1227, 1237), 6.9 (1304); p=2 controls at 998, 1237. The one place oddness is now wrongly kept is §4.5: R01. |
| F04 (integral tilting classification) | repaired | gap:integral-tilting-lifts at README line 105 and in plan.json (identical text); §3.3 lines 653–665 separate the field theorem (JMW16 line 24, over a field) from the integral API; new Checks recomputed: SL₂ at p=3, Δ(3) dim 4 with factors L(3)=L(1)^{[1]} and L(1), T(3) with ch χ(3)+χ(1), dim 6; End_O(O)⊗k=k; O⊕O→k². §§3.2, 4.6 and Layer 3 dependencies cite the contract. |
| F05 (chosen generator) | repaired | README lines 49, 312: `periodicIsoOfGenerator` (Periodic.lean 302, takes g and `hg`), composition identities at 322 and 332 with exactly the names cited; `periodicIso` (346, `hgen.choose`) no longer cited. New Check (line 320) recomputed: for C₃/F₃ the H¹ class σ↦1 becomes σ↦2 under σ↦σ⁻¹ and the F₃-linear Bockstein scales H² by 2≠1; dimensions stay 1. |
| F06 (Frobenius direction) | repaired | F₂₇ control at lines 28, 1103, 1149, 1154, 1267, 1536, 1564. Recomputed modulo β³=β+1: values of β³−β−1 at 0,1,2 are −1,−1,−1 (irreducible); Fr β=β+1; β⁹=(β+1)³=β+2=β−1; β²⁷=(β−1)³=β; (β−1)³=β and (β+1)³=β−1, so D∘Fr⁻¹ fixes β and D∘Fr does not. §5.8's Hom-space form: BC^(p)(βf)=β³BC^(p)(f)=(β+1)BC^(p)(f), BC(βf)=βBC(f). |
| F07 (Stacks tag) | repaired | README line 248 and References line 1578 cite 0A5N; More on Algebra extraction line 8129 carries 0A5M (section), line 8130 "Definition 70.1 0A5N" (bounded complex of projectives). sources.toml keeps the author's entry and adds the section/definition distinction in `version_note` and the part locator. |

**Principles.** No route-specific shortcut (the Smith and algebra theories are stated for all primes; goodness/oddness enter only at the normalized Satake comparison, now wrongly also at §4.5, R01); no re-planned roadmap (Satake, enhanced sheaves, quotients, highest-weight theory are imported by section); single direction of supply (depcheck below); no copied passages found in the sampled sections; no algorithm; no sorry'd data; no `set_option`; no `lemma`; no LaTeX delimiters; no process words (grep for "so far", "to be checked", "checkpoint", "handoff", "packet", "pull request", "round", "(removed)", "optional", "deferred" returns nothing).

**Source sample.** All fifteen seeded targets were read at their locators in the cached extractions; nothing was unreadable.

| Target | Locator read | Result |
|---|---|---|
| 0.4 | Stacks (Algebra) 11331 Lemma 101.1, 11344 Lemma 101.2 (flat⇔free⇔projective over a local ring with nilpotent maximal ideal); Feng24 779 (§3.4.1, k[σ]-flat iff free via 051E); proof of Lemma 3.2 at 603–622 | supports the arbitrary-rank statement; the "proof of Lemma 3.2" and "line 779" refer to two different supporting passages, both present |
| 1.4 | Feng24 807 §3.4.4 long exact sequence | period two, connecting map of degree +1 as stated |
| 1.5 | Feng24 788 Lemma 3.14 (inflated complexes: T*(C)≅H*(C)⊗T*(k)); 882–885 display (4.1) (Ext of the integral Tate unit in even degrees) | both formulas as stated |
| 3.2 | MV07 1608 Proposition 13.1 (W(λ)→S(λ) corresponds to I_!(λ)→I_*(λ)); Feng24 983 §4.5 | ! ↔ Weyl, * ↔ induced, canonical map matched |
| 3.4 | JMW16 30 Theorem 1.2 (tensor of tiltings), 686/691 Theorems 5.1/5.3 (good filtrations); Feng24 1212 footnote 11 | supports tensor closure; character determination is the triangularity remark, correctly attributed to the route |
| 4.2 | JMW14 228 Definition 2.4 (†,?)-even/odd, Loc_f; Feng24 858 | stalk and costalk conditions both required, as stated |
| 4.3 | JMW14 323 Theorem 2.12 (irreducible support, L[m], uniqueness); Feng24 866 Theorem 4.1 | uniqueness only, existence separate, as stated |
| 4.6 | Feng24 1066 proof of Lemma 4.14 (reduction to F₁⊠…⊠F_p), 997 Theorem 4.8 | the README replaces the source's equivariant filtration by a direct-sum decomposition, owned by the route with §3.3/§3.4 and the integral contract |
| 4.11 | Feng24 965 Definition 4.7; LL21 1120 Theorem 5.6.6 (cross-negative Hom vanishing for all λ, λ′, n<0) | hypothesis quantified over all pairs, as stated |
| 5.1 | Feng24 1036 Lemma 4.11 (Gr_H≅Gr_G^σ as subfunctors); 1039 oddness assumed only from here on | diagonal fixed locus on all test rings; parity equality needs oddness, as stated |
| 5.2 | Feng24 1045 Definition 4.12 and (4.4); JMW16 79 Theorem 1.5 (convolution preserves parity) | definition and equivariant structure as stated |
| 5.4 | Feng24 1090 Proposition 4.15 (smooth strata, trivial/free filtration on fixed stalks and costalks, Tate-parity for the induced stratification) | hypotheses match; the README adds tameness, automatic since p is invertible in F |
| 5.5 | Feng24 2575 §A.3 (additivity via free σ-orbits) | the README correctly marks the map-level factorisation as a new target |
| 6.3 | MV07 879 Proposition 6.4 (weight functor is a tensor functor), 427 Theorem 3.5; Feng24 2628 Remark A.1 | normalized constant term as restriction to the dual torus, as stated |
| 8.1 | Feng24 1863 Definition 5.14 (N·A ideal of A^σ, Nm multiplicative not additive, Δ_p algebra homomorphism) | matches `algebra_tate_diagonal`; the source states it for characteristic p, see R02 |

Repaired locators also read: Feng24 650 (admissible in the SGA1 V sense), 759 (T⁰, T¹ conventions), 1162 (Construction 4.17), 1189 (Definition 4.18), 1896 (Construction 5.17), 2634 (CT_H[deg_H] commutes with Psm), 1869 (Lemma 5.15); JMW16 24 (Theorem 1.1 over a field), 72 (Theorem 1.4, non-torsion prime); LL21 641 (Proposition 4.6.1). The remaining cited lines were confirmed one line each (Feng24 656, 661, 677, 684, 703, 709, 712, 729, 742, 816, 824, 849, 888, 892, 906, 950, 962, 1017, 1126, 1198, 1209, 1228, 1234, 1239, 1273, 1742, 2590, 2648, 2701, 2707, 2742; JMW14 199, 785; LL21 624, 899, 1072; MV07 356, 427, 1647; Braden03 45; TV16 207, 512; MR18 105, 273; Stacks sites 5207, 5300; Fields 728): each names the theorem, definition or section the README cites.

**Computed adversarial table.** p=3, k=F̄₃, O=W(k), A=k[u]/u³, u=σ−1 unless stated; Tate pairs are (even, odd).

| Statement | Instances | Values on each side / failing control | Result |
|---|---|---|---|
| 0.1 datum, p=2 | k[C₂]; trivial k, O; regular | N=u; (k,k): ker u/0, ker u/0 with ker u=k; (k,0): O/2O=k, ker 2=0; (0,0): ker u=im u | Check correct; all primes admitted |
| 0.2 admissible actions | x↦ζx on A¹; rotation on X³; trivial | fixed equation (ζ−1)x=0, ζ−1 a unit, so Y^σ={0}; invariants F[x^p,x^{−p}], rank p, derivative p x^{p−1} a unit; diagonal fixed on dual numbers (ε,ε,ε); trivial action U=∅ | correct; R03 for the cover of U |
| 0.3 equivariant category | point; free 3-orbit; ⊕_n Λ[2n] | D(A) at a point; q_*Λ has rank 3 with N(e₀)=e₀+e₁+e₂ versus N=0 on Λ³ trivial; H^{−2n}=Λ for all n, unbounded | descent and common bound discriminate |
| 0.4 flat modules | A, k, A^{(ℕ)} | A free; Tor₁^A(k,k)=k so k not flat; A^{(ℕ)} free of infinite rank, outside `Module.free_of_flat_of_isLocalRing` (finite generation at Module.lean:299) | arbitrary-rank supplier needed and cited |
| 1.2 periodicity, generator | C₃/F₃, σ↦σ⁻¹ | H¹ class σ↦1 becomes σ↦2; Bockstein F₃-linear so H² class ×2; 2≠1 | explicit-generator API needed; cited |
| 1.3 Tate sheaves | two points, stalks k and 0; trivial O | sections k⊕0=k, restrictions the projections; T^{2i}O=O/3=k, T^{2i+1}O=ker 3/0=0 | internal Hom, as stated |
| 1.4 exact sequence | 0→O→³O→k→0; split | T⁰O→T⁰k is k→k identity; T¹k=k→T²O=k iso (×3 on T⁰O is 0); split boundary 0 | degree +1 connecting map |
| 1.5 trivial action | k⊕k[1]; O^r, r=0,1,2; A | (k²,k²); (k^r,0) including (0,0); (0,0) | formula holds; mod-p and integral units distinct |
| 1.6 stratified integral | O, O[1], O² at a point | T*O even unit, T*O[1] odd; O²/3=k² | inflation and pariversity as stated |
| 2.3 free quotient | three permuted points | q_*k=k[C₃] rank 3; unrelated trivial k³ has N=0 | geometric equivariance required |
| 2.4 nearby stalks | x↦ζx on A¹ at 0 | [A→u A]: H⁰=(u²)≅k, H¹=A/u≅k(−1), Tor amplitude [0,1]; class in quotient 0, cohomology modules nonflat | complex-level criterion, as stated |
| 2.6, 2.7 Smith, compact pushforward | i=id; free orbit; fixed origin | Psm=T*, keeps k; ∅ fixed locus gives 0; origin (k,k); RΓ_c(orbit)=A, T*A=0; id_!k=k, T*k≠0 | as stated |
| 3.2 standards | SL₂ at p=3, λ=0,3 | Δ(0)=∇(0)=k; dim Δ(3)=dim ∇(3)=4, head/socle L(3)/L(1) reversed; T(3) dim 6 | not identified by characters, as stated |
| 3.3 tilting (new Checks) | trivial group; SL₂ p=3; 0; O⊕O | End_O(O)=O, ⊗k gives k=End_k(k); T_O(3) rank 6 → T_k(3) dim 6; Δ_O(3) rank 4 → non-tilting Δ_k(3); 0 tilting not indecomposable; O⊕O→k² with two summands | integral API made conditional on the contract |
| 3.4 tensor/characters | V=T(1), SL₂ p=3; D=diag(1,2), U=[[1,1],[0,1]] | V⊗V: χ(1)²=χ(2)+χ(0), T(2)=L(2)=Δ(2) (2=p−1), dims 3+1=4; (DU)₁₂=1, (UD)₁₂=2 | torus restriction faithful, not full |
| 4.1 JMW condition | A¹, P¹, elliptic curve, constant Λ | Ext: A¹ only degree 0; P¹ degrees 0,2; elliptic curve H¹ rank 2 (odd, excluded) | even nonzero Ext allowed, odd excluded |
| 4.2 parity | 1-dim stratum Λ[1], Λ[0]; O/p; k⊕k[1] | i*Λ[1] degree −1≡1=dim, i^!Λ[1]=Λ(−1)[−1] degree 1: even; Λ[0] odd; O/p not O-free; k⊕k[1] parity, neither even nor odd | definitions discriminate |
| 4.3 uniqueness | O, O², O[1] at a point | End(O)=O local; End(O²)=M₂(O)∋diag(1,0); O[1] restricts in degree −1 | uniqueness without existence |
| 4.5 parity–tilting | GL₂ p=2; G₂ p=3; GL₂ minuscule | A₁ highest-root coefficient 1: 2 good and very good, MR18 Cor. 1.6 applies at p=2; G₂ coefficient 3: excluded; k[1] on P¹ perverse, image the 2-dim tilting | R01: oddness is not a hypothesis of the cited theorem |
| 4.6 external products | r=0,1,2; E⊕E; zero factor | O, O_{P¹}[1], O_{(P¹)²}[2], dense ranks 1; E⊕E dense rank 2; E⊠0=0; transposing two odd factors gives −1 | normalization and signs as stated |
| 4.8 Tate parity | O, O[1], regular, k at a point | (k,0) even; (0,k) odd; (0,0) both; k gives (k,k), fails the even-unit test | integral coefficients essential |
| 4.11 normalized | O, O[1], O[2]; Tate | O normalized, shifts not; T*O[2]≅T*O | cross-negative Hom quantified over pairs |
| 5.1 diagonal | tuples; dim-one stratum p=2,3 | fixed tuples (ν,ν,ν); dims 3 vs 1 (same parity), 2 vs 1 (opposite) | oddness only for the pariversity |
| 5.2 norm | unit; scalar α (α²=−1 in F₉); (E⊕F)^{*3} | Nm(1)=1; α³=−α; 8 words = 2 pure + 2 free orbits of 3 | non-additive before quotient |
| 5.3 stalk words | basis e₀,e₁; odd constant word; p=2 | 2 fixed words + 2 orbits of size 3; cycle sign (−1)^{p−1}=+1 for p=3, −1 for p=2 | oddness correctly stated |
| 5.4 Smith parity | O; regular; shifts | (k,0); (0,0); 3d−d=2d even for odd p; at p=2 difference d | general assertion needs no oddness, as stated |
| 5.5 additivity | f+g; scalars 3, α | 8 terms = 2 pure + 6 mixed = 2 transfers, killed by T*; 3↦0; α↦α³=−α | semilinear before correction |
| 5.6, 5.8, 6.6, 8.3 Frobenius direction | α∈F₉; β∈F₂₇, β³=β+1 | Fr α=Fr⁻¹α=−α (no discrimination); Fr β=β+1, Fr⁻¹β=β−1; (β−1)³=β, (β+1)³=β−1; BC^(p)(βf)=(β+1)BC^(p)(f), BC(βf)=βBC(f) | inverse source Frobenius pinned |
| 6.2 extreme orbits | GL₂ λ=(1,0): ν=w₀λ=(0,1); ν=λ; ν=(2,−1) | ⟨ρ,λ+ν⟩=0: one point; ⟨ρ,(2,0)⟩=1: A¹; (2,−1) outside the polytope: ∅ | dimension stated only for nonempty intersections |
| 6.3 normalized CT | P¹ generator Λ[1] at (1,0), (0,1); V⊗V | RΓ_c(A¹,Λ[1])=Λ(−1)[−1], shift ⟨(1,−1),(1,0)⟩=+1: degree 0; point: Λ[1], shift −1: degree 0; multiplicities 1,2,1 | positive normalization pinned |
| 6.4 Smith/CT shifts | ν with ⟨2ρ,ν⟩=±1; torus; p=2 | p=3: 3−1=2, −3+1=−2; torus 0; p=2: difference 1 not removable by [2]≅Id | oddness correctly required here |
| 6.7 characters | V^{⊗3}, SL₂ p=3 | (x+x⁻¹)³ coefficients 1,3,3,1; (T(2)⊕T(0))⊗V=T(3)⊕T(1), χ(3)+2χ(1) has the same coefficients, dim 6+2=8 | objects identified, maps not |
| 7.1 conservativity | 0; minuscule generator | CT(0)=0; lowest-weight component rank 1 | finite support used |
| 7.3 equivariantization | S₃ on k³; Γ=∏_ℕ C₂ | P₁₂P₂₃ a 3-cycle, cube 1, ≠P₂₃P₁₂; a character trivial on ⊕_ℕ C₂ (dense) with a nontrivial value has non-open kernel | ordered cocycle; continuity needed |
| 8.1 `algebra_tate_diagonal` | trivial σ; Bᵖ rotation; ε²=0; p=2; ℤ[i] (R02); length 4 on F₂[x,y] | Δ(a)=a^p; Tr(b,0,0)=(b,b,b) so T⁰=0; Δ(ε)=0; aσb+bσa=Tr(aσb); ℤ[i]: δ(x+iy)=x+y mod 2 a ring map; Tr₄=0, Nm₄(x+y)−Nm₄x−Nm₄y=(x+y)⁴≠0 | statement true; `hpA` unused (R02); primality essential |
| 8.2 `tate_character_extension` | trivial σ on k[x]; kᵖ rotation; F_p(t) control; ℤ (R02) | χ'(x)=Frob⁻¹(χ(x)^p)=χ(x); 1=Tr(1,0,…) so no χ; t∉κ^p so no extension without perfectness; ℤ: extension a mod p, unique | hypotheses discriminate; `hpA` unused |
| gap admissible-invariant-quotient-gluing | x↦ζx on A¹; identity; ∅ | quotient coordinate x^p, G_m-restriction rank p; q=id; ∅→∅ | precise, minimal (affine case native, free case ModularCurves 0C, projective case SSF §1.17) |
| gap integral-tilting-lifts | trivial group; e=diag(1,0)∈M₂(O) | End_O(O)=O→k; e²=e lifts diag(1,0), images rank 1 | precise; one highest-weight-order package |

**Lean.** `lake env lean packages/SheafTheoreticSmithTheory/Suggested.lean` from the content checkout: exit 0; the only output is "declaration uses `sorry`" at lines 56 and 67. No `TauCeti.*` import, so nothing to build. A scratch copy with `#check @` for all six declarations elaborated once (exit 0, same two warnings); the elaborated types carry every hypothesis of §§8.1–8.2 (`Fact p.Prime`, `(p:A)=0`, `σ^p=1`, `S ≤ fixedSubring σ`, norm and transfer containment, transfer annihilation, `Field κ`, `CharP κ p`, `PerfectRing κ p`); no section binder was lost; the README's generality equals the Lean's (and both exceed what is needed: R02). One-tactic probes on a scratch copy: `simp [fixedSubring, cyclicTransfer, cyclicNorm, transferIdeal]` leaves both goals open, `rfl` fails, `infer_instance` fails, `exact?` finds only the sibling probe copies. No padding. The four definitions are needed to state the two headlines; `fixedSubring` specialises `RingHom.eqLocus` (Subring/Basic.lean:867); the pinned `FixedPoints.subring` (used in Affine.lean) is the group-action form and would also serve. Module docstring is in the required form and names the unstatable headline groups with their missing carriers; I found no headline statable at the pins that is absent: étale equivariant sheaf categories, affine-Grassmannian perverse/parity/tilting categories and hyperbolic-localization functors do not exist in Mathlib or Tau Ceti at the pins.

**Pinned declarations opened** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `DerivedCategory` Basic.lean:87; `WittVector` Defs.lean:52; `WittVector.isDiscreteValuationRing` DiscreteValuationRing.lean:148; `WittVector.quotientPEquiv` Complete.lean:105 and `isAdicCompleteIdealSpanP` :116; `Module.free_of_flat_of_isLocalRing` LocalRing/Module.lean:299 (finite generation is a hypothesis); `tateCohomologyFunctor` :140 and `tateCohomology` :146 of TateCohomology/Basic.lean; `frobeniusEquiv` Perfect.lean:121; `linearIndependent_monoidHom` LinearIndependent/Basic.lean:502 (commutative domain target); `RingHom.eqLocus` Subring/Basic.lean:867; `MonoidAlgebra` MonoidAlgebra/Defs.lean (module docstring lines 27–40); `TauCeti.TateCohomology.H0IsoNormQuotient` LowDegree.lean:151; `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` :167, `tateCohomologyIsoOdd` :200, `periodicIsoOfGenerator` :302, the two composition identities :322 and :332, `periodicIso` :346 (chooses a generator) of Periodic.lean; `TauCeti.AffineInvariantQuotient.isFinite_projection` :66 and `isFinite_projection_of_finiteType` :73 of Quotient/FiniteGroup/Affine.lean (the only file in that directory: no gluing at the pin).

**Supplier citations resolved** (line numbers of the README as printed by `roadmaps show` for open heads, of the file on main otherwise): ModularCurves (main) 0C at 345; SchemeAndStackFoundations (main) 0.23a 1508, 1.17 2624, 1.21 2951, 1.23 3021; EnhancedDerivedSheaves (main) 0.1 429, 0.2 441, 0.3 455, 0.4 492, E1.3 549, E1.4 580, E3.4 1229, E5:abstract 1436; EtaleCohomologyFoundations (main) F.1 457, F.2.1–F.2.7 504–759, F.3 676, 0.8 565, 0.10 1145, F.5 1179, F.6 1200; ReductiveGroups (main) Layer 1 176, Layer 4 432, Layer 9 1092, 10A 1733, 10B 1759; EtaleDualityAndPerverseSheaves (open head) 0.1 106, 0.2 146, 2.2 1464, 2.4 1784, 2.5 2063, 3.1 2888, 3.2 3095, 5.2 4913, 7.3 7343; DeformationAndDerivedPatchingAlgebra (open head) 7.5 1417; GlobalShtukasAndFunctionFieldLanglands (open head) 1.1 544, 1.2 571, 1.3 597, 1.5 655, 1.8 720, 1.9 734, 1.14 857; GeometricSatakeAndFusion (open head) Layer GS0 218 and the target "Equal-characteristic Schubert models and coefficient comparison" 785; ReductiveGroupsPartII (open head) RG2.0a 944 with *weil-restriction-separable-splitting* 1206, RG2.5.1 6725 with *langlands-dual-group* 6788 and *galois-action-on-dual-group* 6889, RG2.5.2 6932 with *dual-isogenies-and-products* 7068; LanglandsParameterStacks (open head) LP3.0 730; AInfCohomology (open head) AI.7.2 3816 with the spectral Tate diagonal at 3874. All suppliers are on main or earlier in the merge order (SheafTheoreticSmithTheory is at position 170, after GlobalShtukasAndFunctionFieldLanglands at 169). Every `*Needs:*` line was read; none cites a later roadmap.

**Dependency check.** Output of the prescribed movable depcheck, verbatim:

```text
depcheck: 56 roadmaps, 639 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (the earlier `sources.toml` lead is a file name).

**Ownership.** Searched by object (admissible finite-group quotients, invariant affine covers, free torsors; sheaf Tate quotients, parity and Tate-parity sheaves, Smith functors; tilting categories; Frobenius twists; algebra Tate diagonal) on main, at the 367 open heads and in the board packages checkout: the only owners found are those cited (ModularCurves 0C, SchemeAndStackFoundations 1.17, LanglandsParameterStacks LP3.0, AInfCohomology AI.7.2, native affine quotients). The SchemeAndStackFoundationsPartII design (read at its indexed head) is flat cohomology and claims no admissible quotient. No other `Suggested.lean` declares the namespace `TauCetiRoadmap.SheafTheoreticSmithTheory` or any of the six names.

**Declared gaps.** Five with a named supplier, each with the same slug and text in `design/plan.json` and the README's supplier subsection: witt-adic-uniform-operations (EtaleDualityAndPerverseSheaves 3.1–3.2: its coefficient ring is O_E finite over ℤ_p, so W(F̄_p) is a genuine extension), grassmannian-arbitrary-geometric-field (GlobalShtukasAndFunctionFieldLanglands 1.1–1.3: curve setting), finite-highest-weight-ideals and integral-tilting-lifts (LanglandsParameterStacks LP3.0: field-valued at the head), admissible-invariant-quotient-gluing (SchemeAndStackFoundations 1.17: projective case only). Each is precise and asks for nothing provided at the pins or by an earlier roadmap. The five design-stage records G1–G5 with no supplier are settled per F01 above.

**Shape.** Title, Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eight roadmaps), How to read the build, Layers 0–8 each ending in Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition block has at least four Checks; every target a locator; Checks are prose and name no Lean counterpart.

## Not verifiable

- Board package READMEs at the 19 indexed heads other than SchemeAndStackFoundationsPartII were not read (only its design README was fetched; its package README does not exist at that head). The board checkout holds the board's main-branch packages, which were grepped by object; a package not yet merged there could not be checked.
- The source texts do not certify the roadmap's new theorems (W(k)-adic uniform operations, étale transport of the JMW/LL results, root-subgroup-equivariant comparison components, norm-image naturality): they are targets, correctly marked as such; elaboration of `sorry` and finite checks do not settle them.

## Source issues

- **Misprint** in Feng24 at Example 3.4, printed p.14, Feng24 line 643: the source calls the four-term periodic complex nullhomotopic; it should say exact (acyclic), since a σ-equivariant contraction would split a trivial module off an induced one; affects nothing (the argument uses only that the middle terms vanish in the quotient).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7d8ff96", "job": "REV-PKG-SheafTheoreticSmithTheory~2", "model": "fable", "worker": "fable-rev117"} -->
