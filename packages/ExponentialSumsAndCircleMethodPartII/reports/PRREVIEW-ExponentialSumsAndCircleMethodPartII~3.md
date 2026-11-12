# Review of ExponentialSumsAndCircleMethodPartII (pull request #2138 at 2cb43f3)

**Verdict:** needs changes

Incremental re-review of the 71 lines changed since 08149d5. All of them are in `README.md`; `Suggested.lean` is unchanged. Two P3 findings and no blocking finding. The new algebraic-group Goursat route in §6.5 is mathematically sound. It leaves one input of the pinned Hopf-ideal lemma uncited (R01). The description does not mention the two suppliers that the route adds (R02). The gate passes.

## R01 (P3) — §6.5 uses connectedness of Sp without citing the pinned declaration

**Location.** `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md:47`: "Both hypotheses of smoothness and connectedness are checked on the identity components to which §6.5 applies it." The same gap is in the §6.5 route (line 836, "so its identity component is Sp_(N₂)"), the §6.5 *Needs:* line (line 838) and the Layer 6 Dependencies (line 866).

**Claim.** `TauCeti.HopfIdeal.eq_of_le_of_finrank_quotientLie_le` needs smoothness and connectedness of both groups. On the symplectic side the larger group (ideal `I`) is Sp_(N₂) itself. Sp_(N₂) is an identity component only if Sp is known to be connected. Nothing the README cites says so:
- MordellLawrenceVenkatesh §0.17 states only the centre and the closed normal subgroups.
- OrthogonalTamagawaAndLatticeMass §0.1 covers SO only.
- Cartier's theorem gives smoothness, not connectedness.

The later steps "p₂(G)=Sp_(N₂)" and "G₂ is Sp_(N₂) or lies in {±1}" also use G₂° = Sp.

**Witness.** The pinned lemma at `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Smooth/Dimension.lean:65` has the hypothesis `hI_connected : ConnectedSpace (PrimeSpectrum (H ⧸ I.toIdeal))`, and its docstring says that `I ≤ J` means the `I`-group contains the `J`-group. The pin also has `TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` (`TauCeti/Algebra/AlgebraicGroup/Symplectic/Connected.lean:125`), which states that Sp_{2m} is geometrically connected over every field.

**Repair.**
- In the Tau Ceti contract (line 47), add: "and `TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` in `TauCeti/Algebra/AlgebraicGroup/Symplectic/Connected.lean:125`: Sp_{2m} is geometrically connected over every field."
- Replace the last sentence of that paragraph with: "§6.5 applies it to the identity component of the monodromy closure inside Sp_(N₂), respectively SO_(N₁). Both groups are smooth by Cartier's theorem. Sp_(N₂) is connected by the symplectic declaration above, and SO_(N₁) by OrthogonalTamagawaAndLatticeMass §0.1."
- Add the declaration to the §6.5 *Needs:* line and to the Layer 6 Dependencies.

**Test.** The smallest case is (k,n)=(4,3), with N₂=6. The lemma is applied to the inclusion of the closure's identity component in Sp₆, and `hI_connected` is the pinned statement at m=3. The cup-product form on primitive H¹ of a plane quartic becomes standard over an algebraic closure of E, so the pinned standard-form group applies.

## R02 (P3) — The description does not mention the two suppliers added by this head

**Location.** The prose of the pull-request description: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite." The dependency list before that sentence ends with "#1694 (AlgebraicTopologyPartII)".

**Claim.** This head makes two roadmaps suppliers of §6.5 (README lines 85–91 and 838):
- MordellLawrenceVenkatesh §0.17 (pull request #1231, head 3756140);
- OrthogonalTamagawaAndLatticeMass §0.1 (pull request #1222 by another author, head d4f1571).

Neither roadmap is on main (`TauCetiRoadmap/` on main has neither folder), and neither is a consumer. The description's dependency list does not name them, so the quoted sentence is now false. The generated `depends-on` and `merge-order` blocks do not list them either.

**Witness.** `roadmaps list` shows `#1231 MordellLawrenceVenkatesh (new)` and `#1222 OrthogonalTamagawaAndLatticeMass (new)`. README line 838 is the §6.5 *Needs:* line: "…MordellLawrenceVenkatesh §0.17, *Centre and geometric normal subgroups of the symplectic group*; OrthogonalTamagawaAndLatticeMass §0.1, *Algebraic orthogonal and Spin groups*…".

**Repair.**
- Add "#1231 (MordellLawrenceVenkatesh)" to "In open pull requests of ours".
- Name #1222 (OrthogonalTamagawaAndLatticeMass) as another author's prerequisite.
- Add one sentence: "§6.5 identifies the two-factor monodromy closure with O_(N₁)×Sp_(N₂) by an algebraic-group Goursat and dimension argument, consuming MordellLawrenceVenkatesh §0.17 and OrthogonalTamagawaAndLatticeMass §0.1."
- Regenerate the `depends-on` and `merge-order` blocks so that both pull requests come before this one. They are at merge-order lines 160 and 149, and this roadmap is at line 396.

## Previous findings

- The previous report (PRREVIEW-ExponentialSumsAndCircleMethodPartII~2, at 08149d5) raised no finding. It accepted the folder after the five findings of PRREVIEW~1 were repaired. There is nothing to carry forward.

## Verified sound

**Gate, build, dependencies, scope of the change.**
- `gate … --base origin/main` re-run on 2cb43f3: every scanner reports 0, result `OK`. The worker's record also has build=0.
- `lake env lean` on `Suggested.lean` gives exactly three warnings, all `declaration uses 'sorry'` (lines 115, 141 and 217).
- Dependency check (`--movable --pr 2138`): `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `git diff --stat 08149d5 HEAD` shows only `README.md` (42+/29−).
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean signatures.** I appended `#check @` for all 16 declarations to a scratch copy of the file and elaborated it once. All 16 elaborate and none lost a binder. The new hypothesis sentence of §10.8 ("characteristic zero or >k, k≥3, d≥k−1, n>2ᵏ(k−1), f of degree k with X and Z smooth, x≠0 with f₀(x)=0; no condition on a coefficient prime") matches the eleven hypotheses of `mapping_geometrically_irreducible` one for one. The Lean adds `IsAlgClosed K`, and the README says it applies on an algebraically closed K. No padding probe was needed: no declaration changed, so the previous probe results stand.

**Library declarations opened at the pins (4).**
- `Subgroup.goursat`: `Mathlib/GroupTheory/Goursat.lean:131`, inside `namespace Subgroup`. For an arbitrary subgroup of G×H it gives normal M ⊴ G′ and N ⊴ H′ with an isomorphism G′/M ≃ H′/N. `mem_goursatFst` (line 63) is g ∈ goursatFst ↔ (g,1) ∈ I.
- `TauCeti.smoothCommHopfAlgProperty_of_charZero`: `TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean:151`. Its hypotheses are a field of characteristic zero and a finite-type commutative Hopf algebra.
- `TauCeti.HopfIdeal.eq_of_le_of_finrank_quotientLie_le`: `…/HopfIdeal/Smooth/Dimension.lean:65`. It needs both groups smooth and connected and a Lie-dimension inequality (see R01).
- `TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`: `…/Symplectic/Connected.lean:125` (see R01).

The pin has no almost-simplicity statement for Sp or Spin (grep for "almost simple" in `TauCeti/` finds nothing), and `Semisimple/Normal.lean` is only about semisimplicity of smooth connected normal subgroups. Citing the two roadmap sections is therefore not a duplication of the pin.

**Cross-roadmap citations in the changed passages (resolved at the open heads).**
- MordellLawrenceVenkatesh §0.17 at #1231 (3756140): the heading is exactly *Centre and geometric normal subgroups of the symplectic group*. The statement is over an algebraically closed field of characteristic 0 with dim V=2n≥2: the centre is {±1} and every proper Zariski-closed normal subgroup lies in {±1}. This is identical to README line 87.
- OrthogonalTamagawaAndLatticeMass §0.1 at #1222 (d4f1571, `README.md:129`): *Algebraic orthogonal and Spin groups* gives SO geometrically connected, Spin smooth of dimension n(n−1)/2, a central isogeny Spin→SO with kernel μ₂, and Spin absolutely almost simple for n≥3, n≠4. This is identical to README line 91.
- LefschetzPencilsAndVanishingCycles at #873 (306b5f0):
  - §5.7 *Closed subgroups of `Sp(V)(ℚ_ℓ)` and `O(V)(ℚ_ℓ)`* defines 𝔏 by exp(tX)∈H for small t and gives openness when 𝔏 is full. The converse that §6.5 uses (an open subgroup contains exp(tX) for small t) is immediate from continuity of exp.
  - §5.10 states that the reflections in the full transported orbit topologically generate the compact image (via its §5.3), and that the image is open or finite.
  - §5.8 is the symplectic openness used.
- Both new suppliers are new-roadmap pull requests earlier in the merge order, and neither is on the never-cite list.
- `overlaps.md` lists no open pull request that drops an id this README cites, and none that changes this folder.
- `roadmaps grep -i goursat` finds Goursat statements only for PGL₂×PGL₂, Sp×Sp, simple Lie algebras and wreath types. None owns the O×Sp closure, so §6.5 is its single owner.

**Seeded sample.**
- §13.3 is the only sampled target that changed (its Checks). Its locator holds: BS20 line 2402 starts the argument before Theorem 7.7 on p. 945, and Theorem 7.7 is at line 2442 on p. 946.
- Sampled targets cited by the changed passages were re-read:
  - §6.4 (cited by §6.5): BS20 lines 1406–1419 on p. 924 are the smooth-surjection and normality argument.
  - §10.5 (used in the §13.2/§13.3 Checks): BS20 Corollary 1.2 is at line 116 on p. 895, with bands [1−m(n−2), −m(n−3)].
  - §4.2 (needed by §4.5): BS20 Lemma 2.4(1)–(2) is at lines 466–468 on p. 903.
- §6.5's own locator is correct: Lemma 4.3 is at line 1389 on p. 923, and its proof runs over lines 1399–1442 (pp. 924–925).
- BS20 Proposition 2.6 (lines 570–572) assumes only a smooth leading form, p>k and ℓ of even order. This supports the new §9.4 sentence "smoothness of X is not used". Lemma 2.4(4)–(5) (lines 470–479) has α=Σ_{r≤kd} b_r T^(−r) exactly, the error O(T^(−kd−1+m−m′)), and uniqueness for m⩽kd/2, which are the conventions the new §4.4/§4.5 Checks use.
- The other ten sampled targets are untouched text and were not re-read.

**Adversarial table.** Rows for statements the diff leaves untouched are carried forward:
- From PRREVIEW~2, 12 rows: `finitePoint`/`pointNearInfinity`, `fermatCubicClosure`, `fermatLeadingVector`, `PrescribedGerm` positive example, wrong models and F(∞)=P, `Hco`, the four `compactOpen_germ_obstruction` rows, and the §4.3 locator.
- From PRREVIEW~1 (via PRREVIEW~2), the rows for §§1.3–1.5, 2.1–2.2, 3.3–3.4, 4.1/4.3, 5.1, 5.4, 5.14, 6.3, 7.1, 7.4, 8.5, 8.7, 8.9 (four rows), 8.10, 10.2/10.5, 10.6, 10.9, 11.7, 11.10, 12.2 and 12.3.

New rows, for every statement or Check the diff changes:

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §3.2 Check | n=40, k=3, d=2 | dn=80 variables, kd=6 equations, 80−6=74=2·37=d(n−k); isolated point dim 0<74 | componentwise bound excludes it; correct |
| §4.4 Check (1,2,4) | L=3, m=1 | H₁=[[1,2],[2,4]], det 0, rank 1; 1/(T−2)=T⁻¹+2T⁻²+4T⁻³+8T⁻⁴…; error −8T⁻⁴…, allowed exponent −3−1+1−1=−4 | holds; (2,2T−4) non-monic |
| §4.4 Check (0,0,1) | L=3, m=1 | m′=1: c/(T−a) needs c=0, ca=0, ca²=1, impossible; m′=0: error T⁻³, allowed −3, not allowed at −4 | only (0,1); point of A₁ lost under −L−1 |
| §4.4 Check (0,1,0) | L=3, m=1 | det [[0,1],[1,0]]=−1, rank 2; m′=0 leaves T⁻² (−2>−3); m′=1 needs c=0 and ca=1 | no pair, b∉A₁; both directions agree |
| §4.5 Checks (1,2,4), (0,0,1) | L=3, m=1≤1.5 | unique (1,1,T−2); unique (0,0,1) with coefficient 1 at T^(−3−1+1−0)=T⁻³ | matches Lemma 2.4(5) |
| §4.5 Check (1,0,1) | L=3, m=2>1.5 | H₁ rank 2 so b∉A₁; H₂=[1,0,1] rank 1 so b∈A₂; (T+c)/(T²+cT−1)=T⁻¹+T⁻³−cT⁻⁴+(c²+1)T⁻⁵…; h₂=T·h₁−1 so gcd 1; allowed exponent −4 | one triple per c: uniqueness fails above L/2 |
| §4.5 Check (1,0,0,0) | L=4, m=1 | H₀ rank 1, H₁ (3×2) rank 1; c/(T−a): c=1, a=ca=0, allowed −5; m′=0 leaves T⁻¹ | unique (1,1,T) |
| §5.5 Check | l₁=T, l₂=T−1, h₁=h₂=1 | h₁l₂+h₂l₁=2T−1; 1/T+1/(T−1)=(2T−1)/(T²−T) ≠ 1/(T²−T) | correct |
| §5.11 Check | n=40, d=2 | n(d−m)=0 at m=2 gives [0](0); −40 at m=3 | m≤d needed |
| §6.5 ranks | (k,n)=(4,3), (3,5), (5,3), (3,3) | N₁=3·28/4=21, N₂=3·8/4=6; 2·33/3=22, 2·15/3=10; 4·65/5=52, 4·15/5=12; (k,n₁)=(3,3): 6 (excluded) | N₁≥21 and N₂≥6 in range |
| §6.5 dimensions | same | dim SO₂₁=210, Sp₆=21; SO₂₂=231, Sp₁₀=55; SO₃=Sp₂=3, SO₅=Sp₄=10 | equal dims exactly when N₁=N₂+1 |
| §6.5 dimension identity | G₂ finite | G₁°=1 gives N₁(N₁−1)=N₂(N₂+1), so N₁=N₂+1; G₁°=SO gives N₂(N₂+1)=0; N₁−N₂=15 at (4,3), 12 at (3,5); (k−1)A=k forces k−1 to divide 1 | no finite G₂ for k≥3 |
| §6.5 Goursat and Spin step | G₁ ⊴ p₁(G)=O | G₁° is normal in SO; the preimage in Spin has identity component 1 or Spin (almost simple, N₁≥21≠4); a finite connected image is trivial | G₁° ∈ {1, SO}; G=O×Sp |
| §6.5 −Id | N₁=21 and 22 | det(−Id₂₁)=−1 ∉ SO₂₁; det(−Id₂₂)=1 | reflections needed exactly for odd N₁ |
| §6.5 Lie step | open U⊂Sp₆(ℚ_ℓ) | exp(tX)∈U for small t gives X tangent to the closure, so Lie dim ≥21=dim Sp₆; closure° ⊆ Sp₆ both smooth | equality, given Sp connected (R01) |
| §8.4 Check | N=1, G=a | RΓ_c(𝔸¹,L_ψ(a))=0, so cd=−∞; a−b and −y nonzero linear, so −∞; (−∞)+(−∞)=−∞ | identity holds; −∞↦0 would be wrong |
| §9.4 Check | k=3, d=4, n=24 | δ=3−3+1=1, t=2, L=12, strata m=4,5; B(4)=192−24+20=188 (r=0); B(5)=192−24+24=192 (r=1); 2dn+4(k−1)−4tδ=192; sharp 192+4−8=188 | conservative cutoff attained at m=5 |
| §§9.4–9.5 hypotheses | BS20 Prop 2.6 | the source assumes a smooth leading form, p>k and ℓ of even order; δ>0 ⇔ n>2ᵏ(k−1) | "smoothness of X not used" is supported |
| §§10.10, 13.1 parameters | BS20 Conj 1.3, Conj 7.1 | d≥k−1, n>2ᵏ(k−1), range i>−4(tδ−1) (line 192–201) | same parameters as the source |
| §11.8 Check, escaping loop | v=x₀/x₁=1/a_s(T), z=1/T | v/z^d=T^d/(T^dσ)=σ⁻¹; at s=3r/2, h=1/2, σ=−1, so |v/z^d−1|=2; x₁=1 at P | common chart, no common germ bound |
| §11.8 Check, constant family | g=(T^d,ζT^d,1,0,…) | v/z^d=T^d·T^(−d)=1 | both hold |
| §13.2 Checks | k=3, n=40, d=2; n=32 | t=1, δ=5−2=3, D=74, tδ=3>2; at n=32, δ=2 and tδ=2 is not >2; j=1<8=4(3−1); i=−1>−4(3−2)=−4; bands m=1: {−37}, m=2: [−75,−74], so H_c^147=0 | pairing 0 × (≥1) is not perfect |
| §13.3 Checks | 𝔸^D; Fermat cubic n=3, 4, 40 | H_c^(2D)(𝔸^D)=ℚ, H^(2D)=0 (D≥1); 2³=8 copies of S² give π₂=ℤ⁸; 2⁴=16 copies of S³ give π₂=0; n=40: the degree −j+39m lies in [m+1,2m] only if 37m≤j, so dim 1 at j=0 and 0 at j=1; Ω²X is 36-connected | n≥4 needed; diagonal matches b₀=1, b₁=0 |

Remark (untouched text, no change asked): the scope sentence on LefschetzPencilsAndVanishingCycles lists §§5.1, 5.8 and 5.10 and not the §5.7 that the contract now consumes. Scope lists ownership, and §5.7 is consumed as a lemma, so nothing is wrong.

## Not verifiable

- Katz's Theorem 11.4.9, which BS20 cites for the orthogonal and symplectic monodromy, was not read. The README does not cite it; it routes through LefschetzPencilsAndVanishingCycles and gap:lpv-universal-monodromy instead.
- Lee's thesis (`LEE13`, waived) was not read, as in the previous reports; the text that cites it is untouched.
- Ownership against open pull requests was checked through `roadmaps grep`/`show` over the index of 439, and through the sibling checkouts the brief supplies.

## Source issues

- **Misprint** in BS20 at proof of Lemma 4.3, p. 924 (BS20 line 1435): the source lists the exceptional coincidences as (N₁,N₂)=(2,3) or (4,5), with N₁ the orthogonal and N₂ the symplectic rank; it should say (3,2) or (5,4), from 𝔰𝔬₃≅𝔰𝔭₂ and 𝔰𝔬₅≅𝔰𝔭₄; affects nothing.
