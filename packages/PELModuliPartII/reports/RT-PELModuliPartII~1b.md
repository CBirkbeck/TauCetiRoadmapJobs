<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6907764769 -->
Red team round 1 pass b (claude) of 107b660

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.7 uses "vertex lattice", Λ^∨ and t(Λ) undefined, in a convention that contradicts the roadmap's own dual

   **Location.** `packages/PELModuliPartII/README.md:889` ("…indexed by a vertex lattice Λ of V^exo…
   dimension t(Λ)/2−1…orthogonal group of Λ^∨/Λ"), `:898` ("every vertex lattice has type 2 (types are
   even and positive)"), `:899`, `:908`.

   **Claim.** Vertex lattices of V^exo have even positive type t(Λ), and V_Λ^ε has dimension t(Λ)/2−1.
   The README never defines "vertex lattice", Λ^∨ or t(Λ). Its only dual is the hermitian one of the
   Conventions (`README.md:103–104`, `{x : h(x,Λ)⊆O_L}`), which is also the dual of the imported
   GeometryOfNumbersAndQuadraticArithmetic §2.7 (`HermitianLatticeInvariants.ofDualQuotient`: "Vertex
   means a_i∈{0,1}", t = number of positive a_i).

   **Witness.** n=2, V^exo nonsplit: Gram diag(1,a), −a a non-norm unit. The unique maximal lattice
   M=O_Le₁⊕O_Le₂ has hermitian dual M, so its type in the roadmap's convention is 0 and t/2−1=−1.
   LL22 line 519–520 uses the trace dual, u⁻¹ times the hermitian dual, giving type 2.

   **Repair.** Insert in §3.7, after "…indexed by a vertex lattice Λ of V^exo":

   > Here Λ^♯={x : h(x,Λ)⊆O_L} is the hermitian dual of the Conventions and Λ^∨=u⁻¹Λ^♯ is the dual for
   > the K-valued trace form Tr_{L/K}h (the inverse different of L/K is u⁻¹O_L). A vertex lattice of
   > V^exo is an O_L-lattice Λ with Λ^♯⊆Λ⊆u⁻¹Λ^♯, that is Λ⊆Λ^∨ and uΛ^∨⊆Λ, and its type is
   > t(Λ)=dim_k(Λ^∨/Λ), an even integer with 2≤t(Λ)≤n because V^exo is nonsplit. This is the
   > convention of LL22 Definition 2.10, p. 12; it is not the type of
   > GeometryOfNumbersAndQuadraticArithmetic §2.7, which is computed from Λ^♯/Λ and for which these
   > lattices are not integral.

   and add the Check: "At n=2 the unique vertex lattice is M with Gram matrix diag(1,a), −a a non-norm
   unit: M^♯=M (type 0 in the convention of GeometryOfNumbersAndQuadraticArithmetic §2.7) while
   M^∨=u⁻¹M and t(M)=dim_k(u⁻¹M/M)=2, so V_M^ε has dimension 2/2−1=0."

   Tested on the witness: M^♯=M⊆M⊆u⁻¹M holds, t(M)=2, dimension 0, as the existing Check at `:898`
   requires; uM is excluded (u⁻¹(uM)^♯=u⁻²M, quotient of length 4, not killed by u).

2. **F02** (P2) gap:zink-display-equivalence presupposes displays over rings where the supplier does not define them

   **Location.** `packages/PELModuliPartII/README.md:39–40` ("Zink displays and the functor BT to
   formal p-divisible groups are PELModuli §M2.15; the equivalence over every ring in which p is
   nilpotent is the contract"), `:242`, and the same `needs` in `design/plan.json` (`gaps`,
   `zink-display-equivalence`).

   **Claim.** §M2.15 supplies displays and BT; only the equivalence over p-nilpotent rings is missing.

   **Witness.** PELModuli §M2.15 at its open head: "Define `Display`, Zink's displays over a ring `R`
   of characteristic `p`"; BT an equivalence "over complete local noetherian rings with perfect residue
   field". R=ℤ/p² (needed for every Artinian thickening in §§1.2, 3.4, 4.4, 6.6) has no `Display`.

   **Repair.** Replace the `needs` sentence, in `README.md:242` and in the `gaps` entry of
   `design/plan.json`, by:

   > For every ring R in which p is nilpotent, extend the displays of §M2.15, their duals and base
   > change and the functor BT, which are defined there over rings of characteristic p, to R, and prove
   > that BT is an equivalence from nilpotent displays over R to formal p-divisible groups over R,
   > compatible with base change and with duality of biformal objects.

   and replace `README.md:39–40` by: "Zink displays over rings of characteristic p and the functor BT to
   formal p-divisible groups are PELModuli §M2.15; their extension to every ring in which p is nilpotent
   and the equivalence there are the contract gap:zink-display-equivalence."

   Tested on R=ℤ/p²: the amended contract defines `Display` over R and gives the equivalence that the
   route of §0.1 (`README.md:368`) uses; the original sentence quantifies over objects the supplier
   does not have.

3. **F03** (P3) "minimal cover" is used without definition

   **Location.** `packages/PELModuliPartII/README.md:889` ("the parity invariant κ₂(ρ)=ht(ρ₁) mod 2 of
   the minimal cover (X̃,ρ₁,ρ₂) of the height-zero framing ρ") and `:893`.

   **Claim.** κ₂ is determined by the statement.

   **Witness.** The term is defined only in Wu16 line 627–631 (a terminal pair of isogenies). Without
   it ρ₁ is unspecified: replacing (ρ₁,ρ₂) by (ρ₁∘u, ρ₂∘u) with i(u) of height n changes ht(ρ₁) by n,
   harmless only because n is even; for an arbitrary common cover the parity is not constant.

   **Repair.** After "…of the height-zero framing ρ" insert: "that is, the p-divisible group X̃ with
   isogenies ρ₁:X̃→X and ρ₂:X̃→𝕏 such that ρ∘ρ₁=ρ₂, through which every other such pair of isogenies
   factors uniquely; over a geometric point its Dieudonné module is the intersection of those of X and
   𝕏, and ht(ρ₁)=ht(ρ₂) because ρ has height zero".

   Tested: for ρ an isomorphism the minimal cover is X itself, ρ₁=id, κ₂=0.

4. **F04** (P3) the consumer's request for the LTXZZ models is addressed to another roadmap

   **Location.** `packages/PELModuliPartII/README.md:1961–1964` ("the smooth models of LTXZZ22 §4.2,
   which that roadmap requests in its supplier contracts as native Shimura models, are §§8.1–8.4 and 8.7
   here").

   **Claim.** This roadmap is the single owner of the models of LTXZZ22 §§4.2 and 5.2.

   **Witness.** SelmerIwasawaCohomologyPartII at its open head, Scope: "ShimuraVarieties owns
   construction and strict semistability of the native special-level model … through gap
   native-shimura", and "What ShimuraVarieties must provide (gap:native-shimura)". Two prospective
   owners of one object; no roadmap cites PELModuliPartII.

   **Repair.** Replace the clause by: "which that roadmap requests from ShimuraVarieties in its contract
   gap native-shimura; ShimuraVarieties does not state them, and they are owned here, as §§8.1–8.4 and
   8.7 (construction, local equations, strict semistability, generic-fibre comparison)". The repointing
   of gap native-shimura to PELModuliPartII §§8.1–8.4, 8.7 is a change in SelmerIwasawaCohomologyPartII,
   later in the merge order; it is not made in this package.

Two P2 findings (R01, R02) and two P3 findings (R03, R04). No P1. `Suggested.lean` has no
declaration and no finding.

## Dependency check

    depcheck: 248 roadmaps, 2338 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` shows changes only under
`packages/PELModuliPartII/`.

## Adversarial pass

`Suggested.lean` declares nothing (one `import Mathlib`, one module docstring, an empty namespace);
the declaration table is empty and no `#check` audit applies. README targets:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 V depends on π | K=ℚ_p(√p), R=𝔽_p, π↦−π | exponent i(1+q^{n−i}) even for q odd, ghost maps match; w₁(Vx)=πx₀ changes sign | pass | none |
| §0.1 strictness Check | twist by √p↦−√p over O_K/(p) | 2√p has valuation 1/2<1, so √p≠−√p | pass | none |
| §0.2 parameter counts | height 2d, dimension 1, d=[K:ℚ_p] | 1·(2d−1); wrong model d·(2d−d)=d² | pass | none |
| §0.2 relative versus Cartier dual | K/ℚ_p ramified of degree 2, relative height 2 | Cartier dual dimension 4−1=3; relative dual 2−1=1 | pass | none |
| §0.4 degree of P(r,s) | [K:K₀]=ef | deg P₀₁=fe, deg P(r,s)=nef=n[K:K₀]; ranks r at ψ₀ and ne−r at its conjugate (Mih19 line 379–382) | pass | none |
| §0.4 μ-ordinary Check | K₀=K=ℚ_p; (r,s)=(1,0),(1,1) | multiplicities min, |r−s|, min, doubled: 2n slopes; (1,0): 1/2,1/2; (1,1): 0,0,1,1 | pass | none |
| §0.6 clause (ii) Check | K=ℚ_p(√p), n=2, (2,0), over k | P(2,0)≡(t−a₀)²(t−ā₀)²; F_ψ₀=0⊕k[π]/π² has quotient with π≠0, π²=0 | pass | none |
| §1.5 sesquilinearity | h(ax,by) | i(b̄)·h·i(a)=ab̄h; Rosati adjoint of h(x,y) is h(y,x) | pass | none |
| §1.6 dimensions | n=2,3,4 | relative (n−2, 2n−3): (0,1),(1,3),(2,5); arithmetic (1,2),(2,4),(3,6) | pass | none |
| §2.3 invariants | W_n split ⊥⟨ϖ⟩ | even+1 odd valuation: nonsplit V_{n+1} | pass | none |
| §2.4 degree of α | q=3, n=2 | q²·q²=(deg α)², deg α=9; 27²=729≠81 | pass | none |
| §3.2 symmetry of σ | λ=σ∘i(u), ū=−u | i(u)^∨σ^∨=−σi(u)=i(u)^∨σ, so σ^∨=σ; orders q^n and q^{2n} | pass | none |
| §3.4 coefficient ring Check | n=2 | O_L̆[[t]]⊗k = k[u]/(u²)[[t]], nonreduced | pass | none |
| §3.6 hermitian symmetry | g=λ₀⁻¹y^∨λx | adjoint λ₀⁻¹x^∨λ^∨y(λ₀⁻¹)^∨λ₀ = g(y,x) (two signs cancel); u⁻²∈K | pass | none |
| §3.7 types at n=2 | Gram diag(1,a), −a non-norm unit | hermitian dual: type 0; trace dual: type 2 | fail as written | R01 |
| §4.6 dimensions | f=2, n=2 | L-dimension 2, ℚ_p-dimension 2·[L:ℚ_p]=8 | pass | none |
| §5.2 fixed lattice | M(Y)=O_L̆e | ⟨e,Πe⟩ unit, (e,e)=δ⟨Πe,e⟩ unit; (ue,ue)=−u²(e,e), K-valuation 1 | pass | none |
| §5.4 trace recovery | (x,y)=δ(A+uB) | Tr(u⁻¹δ(A+uB))=2δB; (ux,y)=δ(u²B+uA)=u(x,y) | pass | none |
| §5.6 chart | n=2; general n with x_k=1 | gradient of 1+Σ_{i≠k}x_i² vanishes only if 1=0; Kraemer03 line 428–430 has y(Σx_i²)−2π | pass | none |
| §6.2 admissibility Check | F⁺_v=ℚ_p(√p), F_v inert | {(σ,+),(σ̄,−)} is a CM type, not pulled back | pass | none |
| §6.6 Check on k[ε] | R[x]/(x²) | x²≡α² mod (x+α), so α=εc | pass | none |
| §6.6 Check on units | c=1+√2 | c²=3+2√2, c⁴=17+12√2, c⁻¹=√2−1; Nm(c)=−1 | pass | none |
| §6.6 route | cyclic quotient of R[x]/(E) free of rank d | Nakayama: basis 1,…,x^{d−1}, so quotient R[x]/(H), H the characteristic polynomial | pass | none |
| §6.8 parity | n=3, r_φ=2 | 3·1−2=1 odd; 3·0−2=−2 even | pass | none |
| §7.6 bad-prime Check | F⁺=ℚ(√3), F=ℚ(ζ₁₂), p=3 | 3 ramified in F⁺; −1 nonsquare mod 3: inert; 3 divides Disc(O_F×O_F) | pass | none |
| §7.7 isotropy Check | F⁺=ℚ, n=4 | trace form signature (6,2), 8≥5 variables | pass | none |
| §8.4 chart | N=2 | x₁x₂−p∉𝔪², Krull dimension 2 | pass | none |
| §9.1 statement | supersingular E; ordinary E; conjugated CM action | 4=4; 2≠4; Hom_K=0 against dimension 2 | pass, hypothesis needed | none |
| §9.2 lattice Check | H with rows (0,1,0),(1,0,0),(0,0,3) | det −3; dual-quotient lengths 3,3,1; gHg*=H; gΛ₋=Λ₊ | pass | none |
| §9.6 normalization | val_u(ϖ)=1 and 0 | u²/ϖ of valuation 0, respectively 1 | pass | none |
| gap:zink-display-equivalence | R=ℤ/p² | supplier `Display` defined only in characteristic p | fail as written | R02 |

## Verified sound

- Declarations read: 0 (the file states none). Its docstring names every headline of the README
  Summary (§§1.2, 2.2, 3.4, 3.7, 5.7, 6.6, 7.6–7.9, 8.4, 8.7, 9.5–9.10, and 9.1) with the carrier it
  lacks. At the pins: no p-divisible groups or formal-scheme category in Tau Ceti
  (`TauCeti/AlgebraicGeometry/FormalScheme/Spf/` has four files, no morphisms);
  `TauCeti.AlgebraicGeometry.AbelianVariety` is over a field. No headline is statable; nothing is
  padding.
- Targets read: 75 (all of Layers 0–9), with every Check and Example; 31 rows computed above.
- Locators verified against the cached texts: about 80, in LL22, HLSY23, Kraemer03, LZ22, Cho18,
  Mih19, RSZ21, RZ96, Wu16, Stacks (all six tags), LTXZZ22 Theorem 5.2.5(1), Zhang21 Definition 6.1
  and Theorem 6.2.
- Sibling citations: 84 section or heading ids resolved at the current heads or on main (PELModuli
  30, AbelianSchemesAndArithmeticModuli 8, FiniteFlatGroupsAndIntegralPadicHodgeTheory 6,
  VectorBundlesAndIsocrystals 6, EndoscopicTransferAndUnitaryTraceComparison 4, ShimuraVarieties 7,
  SelmerIwasawaCohomologyPartII 6, others 17); all exist. Contents read for PELModuli §§M0.10,
  M2.11, M2.15, M4.7, ShimuraCompactifications §§7.5, 7.18, GeometryOfNumbersAndQuadraticArithmetic
  §§2.7, 2.9, VectorBundlesAndIsocrystals Layer 0, IgusaVarietiesAndTorsionConcentration §§0.9,
  0.27, 0.31.
- Pinned declarations: all named Mathlib and Tau Ceti declarations exist at the pins in the files
  given.
- Gaps: the four slugs agree between `design/plan.json` and the README; each has a supplier.
  hermitian-local-global, unitary-multichain-stabilizer and bad-prime-projectivity are precise;
  zink-display-equivalence is R02.
- Ownership: `roadmaps grep PELModuliPartII` finds no citing roadmap. No object of Layers 0–9 is
  stated by a roadmap on main or by the suppliers read, except as R04 records.

## Not verifiable

- The published page numbers of Zhang21 (pp. 879–909) and LTXZZ22 (pp. 147–193): the cache holds
  the arXiv versions with their own pagination (Zhang21 Definition 6.1 is at Zhang21 line 1667, arXiv
  p. 29–30). Statement numbers were checked; pages were not.
- LL21, Howard19, RZ17, LRZ26, RSZ20 Appendix A and LL22 §§2.8, 4.5: not opened in this pass; their
  locators (about 45) are unchecked here.
- The README's source notes on LZ22 §13.4 (degree q), LL22 §4.5 (A₀ for A) and LTXZZ22 (four notes):
  not re-read against the texts.
- Elaboration of `Suggested.lean`: not run (no Lean command is permitted in this pass); the file has
  no declaration.
- Ownership against the open pull requests whose files are not in the brief's list was checked
  through `roadmaps show` and `roadmaps grep` only.

Source independence: 15 passages compared with 10 sources, none shared beyond formulas and
statements of a dozen words; largest share LL22, 38 of about 217 locators; contents compared with
LL22 (§§1–4) and LZ22 (§§1–15): independent. Layer 4 §§4.1–4.6 runs in the order of LL22 §2.8, which
the lines `*Needs:* §4.1`, `§4.2`, `§4.3`, `§4.4` force.

## Source issues

- **Error** in RZ96 at Corollary 6.29, printed p. 293: the source says the K-linear Hom comparisons hold for two objects that each satisfy the isoclinic hypothesis of Lemma 6.28; it should be required that the two 𝔭-parts have the same slope at every 𝔭 above p; affects a stated result.
- **Gap** in HLSY23 at Definition 2.2(2), p. 10: the source says the framing is a height-zero O_F-linear quasi-isogeny, with no condition on polarizations; it should be required to carry the framing polarization to an O_{F₀}^×-multiple of λ; affects a stated result.

## For the human reviewers

- **Scope.** §9.9 (`README.md:1920`) states that no cited text contains the comparison of Krämer completions and that the transport of the filtration is new; HLSY23 has no uniformization statement (searched "uniformiz").
- **Scope.** The rank-two Krämer regularity of §§5.6 and 7.8 is "the computation given here" (`README.md:1148`); Kraemer03 Theorem 4.5 assumes n≥3.
- **Licence.** RZ96 is read from an author-hosted scan of a Princeton University Press book (`sources.toml`, `licence_class = "author-page"`).
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 was not compared; the cached texts are the arXiv versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "107b660c6d25f5e30fb1bbb94b5e62f157f0c007", "job": "RT-PELModuliPartII~1b", "model": "fable", "worker": "chris-x82"} -->
