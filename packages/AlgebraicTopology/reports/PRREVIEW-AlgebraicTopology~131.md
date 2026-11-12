# Review of AlgebraicTopology (pull request #1807 at 9979497)

**Verdict:** needs changes

## R01 (P3) — §5.4 cites Künneth and the cohomology ring for the homology Pontryagin ring of the torus

**Location.** README 2323–2325 (§5.4): "The homology of a finite product of circles as the exterior powers of its first homology, by the Pontryagin product over every commutative ring … (supplier contracts; Hatcher, Theorem 3B.6, p.275, and Example 3.16, p.216)."

**Claim.** Neither locator states the cited fact. Theorem 3B.6 is the Künneth sequence over a PID, and Example 3.16 is the cohomology cup ring.

**Witness.** hatcher line 11898: Theorem 3B.6 assumes CW complexes and R a PID. Line 9388: Example 3.16 is the cohomology ring. The statement that the Pontryagin ring H_*(Tⁿ;ℤ) is an exterior algebra is §3.C, Exercise 11, p.292 (line 12759).

**Repair.** Replace the parenthesis with: "(supplier contracts; Hatcher, §3.C, Exercise 11, p.292, for the integral Pontryagin ring, and Example 3.16, p.216, for the cohomology ring over every commutative ring; the homology form over every commutative ring is Tau Ceti's)".

## R02 (P3) — §4.10 cites Hatcher 4.21 for local-coefficient invariance, which it does not state

**Location.** README 2066–2071: "induces isomorphisms on singular homology with coefficients in any ring and with any local coefficient system on the target (`…isIso_singularHomologyMap`, `…isIso_twistedHomologyMap`, Hatcher Proposition 4.21), on arbitrary spaces."

**Claim.** Hatcher's Proposition 4.21 covers constant coefficient groups only. The local-system half has no source.

**Witness.** hatcher lines 15508–15510 (p.356) give isomorphisms "for all n and all coefficient groups G". §3.H (lines 14499–14701) states no weak-equivalence invariance with local coefficients.

**Repair.** Write: "induces isomorphisms on singular homology with coefficients in any ring (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`; Hatcher, Proposition 4.21, p.356, for coefficient groups) and with any local coefficient system on the target (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap`), on arbitrary spaces."

## R03 (P3) — §2.3 owns no target: every statement is at the Tau Ceti pin, and none is named

**Location.** README 1134–1138 (§2.3): "Consume the native short exact sequence of chain complexes for a pair and its natural long exact sequence, with its connecting morphism, … and naturality square … Do the same for triples".

**Claim.** The section restates pinned results without naming them and owns nothing. The house shape deletes such a section and records it as a deferral, as this README already does for Stage 2 item 2 (README 986–988).

**Witness.** Tau Ceti at the pin has:

- `TopPair.singularHomologyδ` and `TopPair.singularHomologyδ_naturality` (`Singular/Relative.lean` 441, 497);
- `TauCeti.TopTriple.shortExact_singularChainComplexShortComplex`, `TauCeti.TopTriple.singularHomologyδ` and `TauCeti.TopTriple.singularHomologyδ_naturality` (`Singular/Triple.lean` 152, 171, 237).

**Repair.**

- Delete §2.3.
- In the item map at README 986, write: "Stage 2 items 1 and 4–6 are §§2.1 and 2.4–2.6; Stage 2 item 3, the pair and triple sequences with their connecting maps and their naturality, is Tau Ceti's `TopPair.singularHomologyδ_naturality` and `TauCeti.TopTriple.singularHomologyδ_naturality` (supplier contracts)".
- Name the five declarations in the contract bullet at README 388–392.
- Repoint "§2.3" in the *Needs:* lines of §§3.3, 5.2 and 8.4 to that contract bullet.
- HeegaardFloer's citation "AlgebraicTopology Stages 2.3" (main, README 3459) then resolves through the item map.

## R04 (P3) — The description credits this roadmap with two Tau Ceti results and drops §8.16's fibre hypothesis

**Location.** Description, "Ownership moves": "AlgebraicTopology owns … the connected-map homology comparison, weak-equivalence invariance and CW approximation (§4.10), the spectral sequence of a filtered complex (§5.0)". Also: "the essential map T³→S² for any Serre fibration S³→S² (§8.16)".

**Claim.** The head takes weak-equivalence invariance and the filtered-complex spectral sequence from Tau Ceti. It states §8.16 only for fibrations whose fibres have vanishing H₃.

**Witness.** README 159–163: "Layer 4.10 consumes the native weak-equivalence invariance … Layer 5.0 consumes the native spectral sequence of a filtered complex and owns its homological regrading". README 5232–5233: "every fibre of which has vanishing third integral homology".

**Repair.** Make two replacements in the description:

- For the first sentence, write: "… the connected-map homology comparison and CW approximation of arbitrary spaces and of pairs (§4.10), the homological regrading, decreasing reindexing and complete convergence of Tau Ceti's filtered-complex spectral sequence (§5.0) …".
- For the second, write: "the essential map T³→S² for every Serre fibration S³→S² whose fibres have vanishing third integral homology (§8.16)".

## R05 (P3) — The description omits the retitled §§8.14–8.15 and StableHomotopyKTheory's restatements of §8.8d

**Location.** Description: "Open pull requests stating objects these roadmaps own are to cite them: HigherToposTheory (#1901) … HomotopySpheres (#1287) 3B → F6.2 and 3C.3 → F4.1." No sentence names the new headings of §§8.14 and 8.15.

**Claim.** The description leaves out two changes that a reader needs:

- The headings of §§8.14 and 8.15 are renamed, and so are their anchors.
- StableHomotopyKTheory (#1227) restates §8.8d's theorems on DGFloer Layer 1 item 4, which this change retires in favour of §8.8d.

**Witness.** StableHomotopyKTheory at #1227: README 1401 ("Use DGFloer Layer 1 item 4's Serre-class carrier"), 1415 (homology of K(A,n) lies in the class) and 1423 (the Hurewicz map modulo C). This roadmap owns both at README 4457–4462.

**Repair.**

- Add to that list: "StableHomotopyKTheory (#1227) §§3.34–3.36, which are to cite AlgebraicTopology §8.8d for Serre classes, the homology of K(A,n) in a class and Hurewicz modulo a class".
- Add the sentence: "AlgebraicTopology retitles §8.14 'Finite-dimensional Whitehead, maps out of (n−1)-connected complexes, aspherical surfaces' and §8.15 'Classifying spaces of finite groups and free actions'; no roadmap cites their former anchors."

## R06 (P3) — "HA" is used three times and never defined

**Location.**

- README 200: "with no ordinary representability, Eilenberg–MacLane family or HA input".
- README 2026–2027: the same phrase.
- README 4597: "precedes HA and ordinary representability".

**Claim.** "HA" (the Eilenberg–MacLane spectrum) is not defined in the README, and spectra are outside its scope.

**Witness.** A search of the README for `\bHA\b` finds only these three lines. README 58–60 says the scope "does not include generalized cohomology theories, spectra, bordism, or surgery obstruction groups".

**Repair.**

- At 200 and 2026–2027, write "with no ordinary representability or Eilenberg–MacLane input".
- At 4597, write "precedes ordinary representability".

## Verified sound

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| Prev R01 `IsCIso`/`IsCEpi` | Lean 393–396; README 4448–4452, 781–787 | Mathlib's `C.isoModSerre`/`C.epiModSerre` used; both definitions deleted; contracts cite the Mathlib file | repaired | none |
| Prev R02 Serre SS docstring | Lean 55–61 | names the missing carrier: `TauCeti.fiberLocalSystem` exists only for Hurewicz fibrations with a lifting function | repaired | none |
| Prev R03 locators | README 1661–1670, 1769–1770, 934, 4172–4179; Lean 290, 301 | Brown 7.4.2 Addendum, Vogt, Prop. 2.22, Ex. 8(b), GeometricTopology §11.3 all present and correct | repaired | none |
| Prev R04 π₁-action | contracts 509–519; §8.9 4507–4519; §8.14 5157–5158 | `homotopyGroupMulAction` (136), `homotopyGroupTransportQuotient` (90), `homotopyGroupEquivOfPath` (BasepointChange 352) exist | repaired | none |
| Prev R05 vocabulary | regex AT, DG, GT, acceptance, provider, lane, milestone, M_AT | 0 hits; headings retitled; `M_right`, `c_right` used | repaired | "HA" remains (R06) |
| 2.3 pair/triple | (X,A,∅); (X,X,A) | triple sequence = pair sequence; outer term 0; hatcher 5142 (p.117), 5186–5191 (p.118), 5560 (p.127), 5584 (p.128) | locators hold; all at pin | R03 |
| 2.5 coordinate classes | n=0,1,2; S⁰ | ∂[t↦t]=[1]−[0], reversed −; square ∂=right−left−top+bottom; [q]−[−q] aug 0 vs [q]+[−q] aug 2 | holds; 3B.1 p.269, p.276, Lemma 3.27 p.236 | none |
| 2.6 local systems | sign system u=−1 on (S¹,{p},∅) | ∂(cσ)=(u−1)c=−2c, H₀=ℤ/2; ignoring transport gives ℤ; §3.H p.333 (14565–14571) | holds | none |
| 3.1 subdivision | σ=[v₀,v₁]; 0-simplex | Sdσ=[b,v₁]−[b,v₀]; ∂Tσ+T∂σ=σ−Sdσ; dropping degenerate terms leaves +[v₁,v₁]−[v₀,v₀]; pp.121–122 (5314, 5336) | holds | none |
| 4.1 lifted cells | S¹→S¹⊔S² inclusion | Mathlib covering, empty fibres; lifted dimension 1 vs base 2; App. Ex. 1 p.529 (22952) | holds | none |
| 4.4 cube quotient sign | n=1,2,general n | det(−e_n,e₀…e_{n−1})=(−1)^{n+1}=det A, product +1; n=1 native +1, n=2 native −1 | holds; 2.22 p.124, 3B.1, 3.11 p.210 | none |
| 4.5 one-sided inverse | X=A=X′=A′=S¹, H₀ rotation | π₁(Map(S¹,S¹)_id)=ℤ: K₀ const gives −1+0+1=0≠1; Vogt K₀=H₀ gives −1+1+1=1 | holds; brown 11027–11043, vogt1972 28 | none |
| 4.5 pushout, cofibration | S⁰→pt; degree-m cell | S¹, χ=0; m=0 H₂(S¹∨S²)=ℤ, m=2 H₁(RP²)=ℤ/2; 4.8 p.349, A.3 p.522, A.6 p.524, strom1972 181 (p.135) | holds | none |
| 5.4 torus matrices | diag(2,1); swap; A=0 | det 2 = permanent 2; det −1 vs permanent +1; 0 on H_{k≥1} | math holds; locators miss the statement | R01 |
| 7.1 Euler–Poincaré | point; circle; Möbius system | 1; 1−1=2−2=0; over ℚ d₁=±2, H₀=H₁=0, χ=0=1·0; Thm 2.44 p.146 (6380) | holds | none |
| 7.2 product/bundle | S²×S²; Klein bottle; S³→S² | 1+2+1=4=2·2; 𝔽₂ 1−2+1=0, ℚ 1−1+0=0; 0=2·0; Ex. 20 p.157 (6854), kmr2023 48 | holds | none |
| 8.1 relative homotopy | (D²,S¹); (RP²,RP¹) | π₂=ℤ, π₁ one point; (RP²,RP¹) 1-connected, ℤ→ℤ/2 onto, not injective; §4.1 pp.343–345, Cor. 4.12 p.351 | holds | none |
| 8.3 absolute Hurewicz | S¹ loop of degree k; S¹∨S¹; S² antipode | k[S¹]; commutator ↦0; −[S²]; 4.37 p.371 (16124), 4.32 p.366 (15961), 2A.1 p.166 | holds | none |
| 8.7 CW type, recognition | ℕ discrete; [0,1]; n=0 | H₀ infinite rank, not finite type; χ=2−1=1; hypotheses force contractible vs S⁰ two points; Cor. 4.33 p.367 | holds; GeometricTopology §11.3 on main 7887 | none |
| 8.8c EM models | A=0; 2:ℤ→ℤ; ℤ[1/2] | a point; ×2 on π_n; colim(z²) indiscrete (open sets invariant under dense ℤ[1/2]/ℤ), H₁=0 vs ℤ[1/2] | holds; 4.30, 4.31 p.366 | none |
| 8.15 C_p×C_p | S⁰; S¹; Sⁿ, n>1 | p²≥4>2; cyclic deck group; dim H^{n+1}≤1 < n+2; Ex. 26, 28 p.391 (16974, 16980) | holds | none |
| `exists_cwApproximation` | ∅; Warsaw circle; two points | ∅; a point; two points (one model per path component) | holds | none |
| `relHomotopyGroup_map_bijective_of_mem_serreFibrations` | ℝ→S¹, n=0; [0,1]→S¹ | ℤ↔ℤ; two-element π₁([0,1],{0,1}) vs ℤ, not Serre; Thm 4.41 p.376 (16327) | hypothesis needed | none |
| `lsCupLength_add_one_le_categoryCount` | point; T² over ℤ; ∅; zero ring | 0+1≤1; 2+1≤count; count 0 on ∅; 0+1≤count | Nonempty needed | none |
| `poincareDuality_of_isFundamentalClass` | S¹ with μ, 2μ; two points over ℤ | ℤ≅ℤ; ×2, 2μ not fundamental; (u₁,u₂) units bijective, (1,0) not fundamental | holds | none |
| `poincareDuality_twoTorsionCoefficients` | RP² over 𝔽₂; over ℤ/4 | Betti 1,1,1 match; local image 2 not a unit, H⁰=ℤ/4 vs H₂=ℤ/2 | 2=0 needed | none |
| `productBallImages_intersect` | p=0; p=q=0 | g₂ fixing S_q hits z, else radial retraction; both points (0,0) | holds | none |
| `finsum_finrank_singularHomology_fiberBundle` | empty base; Klein bottle; S³→S² | 0=0·χ(F); 0=0·0 over 𝔽₂ and ℚ; 0=2·0 | holds | none |
| `hurewicz_bijective` | S², n=0 | π₂=ℤ→H₂=ℤ, generator to generator; native version is `Type`-only (Absolute.lean 157) | holds | none |
| `relativeHurewicz_bijective` | (D³,S²), n=1; (D²,S¹∨S¹) | ℤ→ℤ; F₂ vs ℤ², excluded since π₁(A)≠1 | holds | none |
| `homologicalWhitehead` | point; Poincaré sphere→S³ | identity; homology isomorphism, π₁ of order 120, not an equivalence | simple connectivity needed | none |
| `compactManifoldFiniteCWType` | S²; discrete ℕ | finite model; H₀ infinite rank (noncompact, excluded) | holds | none |
| `compactManifoldWithBoundaryFiniteCWType` | [0,1]; D² (half-space model) | two 0-cells, one 1-cell, χ=1; χ=1, contractible | holds | none |
| `nonempty_homotopyEquiv_sphere_of_homologySphere` | n=0; n=1; Sⁿ | contractible vs two points; H₁=ℤ contradicts simple connectivity; identity | 2≤n needed | none |
| `finiteSourceMappingCWType` | X=∅; Y=∅; βℕ→S⁰ | a point; ∅; discrete with 2^ℵ₀ 0-cells | holds | none |
| `groupClassifyingSpace_isEMOne` | 1; ℤ; S₃ | a point; π₁=ℤ, edge 1↦+1; (12)(23)=(123)≠(132)=(23)(12) | holds | none |
| `hurewicz_isCIso` | C=0, n=0, S²; C torsion, n=1, S³ | H₁=0, h₂ iso, h₃:ℤ→0 onto; H₁=H₂=0, h₃ iso, h₄:ℤ/2→0 cokernel 0 | holds | none |
| `ordinaryEMRepresentability` | K=S¹, n=0; K=S¹⊔{p}; Warsaw source | degree map onto ℤ; π₀ fails, excluded; q:W→S¹ essential with H¹(W)=0, outside CW type | hypotheses needed | none |
| `properStrongDeformationRetract_of_inverse` | A=X; ([0,∞),{0}); (ℝ,{0}) | r=id; constant inverse not proper; preimage of {0} is ℝ, hypothesis fails | holds | none |
| `exists_transverse_circle_classifying_map` | M=∅; dim 0; S¹ with a=2·gen | empty map; f≡−1, f⁻¹(1)=∅; z↦z², derivative 2≠0 | holds | none |
| `elementaryAbelianPair_sphere_action_has_stabilizer` | p=2, n=0; n=1 | 4 > 2 points; quotient circle has cyclic deck group | holds | none |
| R02 target (4.10) | Hatcher 4.21 text | "all coefficient groups G" (15508–15510); no local-system statement in §3.H | locator overreach | R02 |
| R04 target (8.16) | fibre F with H₃(F)≠0 | the endpoint factorization H₃(T³)→H₃(F)→H₃(S³) is the identity, so H₃(F)=0 gives the contradiction | hypothesis used | R04 |
| R05 target (8.8d vs #1227) | #1227 §3.35 | proves H̃_*(K(A,n))∈C for three classes, which is §8.8d's statement (README 4457–4459) for every class with Serre's axioms | duplicate on a retired supplier | R05 |

### Counts and checks

- **Source locators.** 50 checked against the cached texts: hatcher 45, brown 2, and one each in vogt1972, strom1972 and kmr2023. All hold except §5.4's two (R01) and §4.10's Proposition 4.21 (R02).
- **Library declarations.** 34 Tau Ceti declarations opened at the pin, including:
  - `Singular/Relative.lean` 441, 497 and `Singular/Triple.lean` 152, 171, 237;
  - `FundamentalGroupAction.lean` 90, 136, 166, 340 and `BasepointChange.lean` 352, 478;
  - `HomotopyGroup/Product.lean` 176, 200 and `Triangulable/FiniteCWType.lean` 41;
  - `Hurewicz/Absolute.lean` 157–161 (stated for `Type` only).

  Mathlib's `isoModSerre` and `epiModSerre` elaborate in Lean 393–396.
- **Cross-roadmap citations.** 7 resolved:
  - GeometricTopology §11.3 (main 7887);
  - DGFloer Layer 1 item 4 (main 659), which #1798 repoints to §8.8d (its line 174);
  - StableHomotopyKTheory #1227, lines 1401, 1415 and 1423;
  - AlgebraicTopologyPartII #1694, line 13;
  - HeegaardFloer "Stages 2.3" (main 3459).

  `overlaps.md` reports no dropped id and no revision-only id.
- **Gate.** The worker's gate passes every check. My rerun, given no list of the pull request's folders, reports `outside-folder=24`; every path is in the 12 folders this brief names as the pull request's own. The diff outside the 13 folders is empty.
- **Dependency check.** `depcheck: 223 roadmaps, 2009 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives only the 20 `sorry` warnings. A scratch file of `#check @name` for all 23 declarations shows every binder of the README statements present, and none lost.
- **Padding probe.** No theorem closes in one tactic. A grep of the pinned Tau Ceti finds no statement of:
  - Poincaré duality;
  - the nerve as a K(G,1);
  - the relative bijection for Serre fibrations;
  - homological Whitehead;
  - CW approximation of a non-path-connected space;
  - CW type of mapping spaces.
- **Ownership.** DGFloer's ownership of Hurewicz modulo a class moves to §8.8d through #1798, which the description names. The other merge-order checks of this roadmap's suppliers find no upward edge. Ownership was searched with `roadmaps grep` across all open heads.

## Not verifiable

- These are uncertified in the manifest, so their locators were taken as given:
  - Weibel 5.5.1 and 5.5.10;
  - tom Dieck 9.5.1;
  - Serre 1953, Chapter III, Theorem 1;
  - Milnor, *Morse Theory*, Lemmas 3.6–3.7;
  - Lee, Theorems 6.26–6.36;
  - Thom 1954, Chapter II;
  - Freedman–Quinn §7.7;
  - Dowker 1952.
- These have no manifest key and no cached text, and no locator in the sample depends on them:
  - Conway–Friedl–Herrmann;
  - Eilenberg–Steenrod;
  - G. W. Whitehead;
  - Dold;
  - McCleary;
  - K. Brown, *Cohomology of Groups*;
  - Serre 1951.
- Munkres, Theorems 10.5–10.6, which GeometricTopology §11.3 cites for the boundary case of smooth triangulation: not cached, so not read.

## Source issues

- **Misprint** in hatcher at §4.2, Exercise 26, p.391: the source says X and X̃×K(π₁X,1) are not homotopy equivalent when π₁(X) contains elements of finite order; it should say nontrivial elements of finite order, since for trivial π₁ the two spaces coincide; affects nothing.
