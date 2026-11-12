# Review of ReductiveGroupsPartIII (pull request #2131 at b10dfae)

**Verdict:** accepted

Incremental re-review of the 102 lines changed since a77c7a9. No finding. All four findings of the
previous review are repaired, the repairs introduce no new problem, and the gate passes.

## Previous findings

- R01 — repaired: the Scope paragraph (`README.md` lines 53–67) owns §§2.0, 2.1a, 4.3, 5.3a and 5.7a, each with the point where its supplier stops; the plan's `gaps` list is empty and the README has no `gap:` line, so each interface has one owner.
- R02 — repaired: lines 225–237 cite `locallyCompactSpace_of_finiteType`, `instLocallyCompactSpaceWithConv`, `isClosedEmbedding_comap_of_surjective`, `Padic.instProperSpace` and the adic-completion local-field instance; §3.2 `*Needs:*` and the Layer 3 Dependencies no longer name RG2.0.1–RG2.0.2.
- R03 — repaired: §2.1a (lines 807–813) locates the openness step at Harder66, proof of Lemma 5.5.3, printed p.407, lines 527–532, and keeps Borovoi98/KMPS22 as locators of the consumer §2.2 only. `Harder66` is in the references and the manifest.
- R04 — repaired: line 1775 reads "§0.6, §§1.3–1.6 and §2.2 of this roadmap. ArithmeticGaloisRepresentations §1.11."; ", and §5.3a" is gone from the ReductiveGroupsPartII list; §5.5 `*Needs:*` lists §1.4; §5.4 `*Needs:*` lists §5.3a among its own targets.

## Verified sound

**Gate, dependency check, build.** Re-run at b10dfae: every gate check is 0, OK; the worktree is clean;
`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroupsPartIII'` is empty. The dependency
check prints `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line).
`lake env lean` on `Suggested.lean`: six `sorry` warnings (lines 96, 113, 130, 143, 225, 237), nothing else.

**Lean.** The diff changes one docstring only (it adds "Harder66 Lemma 5.5.3" to `exists_isMaximalTorus_conjugate`).
The 12 elaborated types in the regenerated signatures file are those compared with the README in the
previous review; none lost a binder and nothing changed. The one-tactic probe of the previous review
stands, since no statement changed. Headlines stated and headlines named as not statable are as before.

**Pinned declarations opened for the changed passages (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b), 6**, each also
confirmed by `#check` in a scratch probe:

- `TauCeti.PointTopology.locallyCompactSpace_of_finiteType` (`TauCeti/Topology/Algebra/PointTopology/Basic.lean:261`): needs `IsTopologicalSemiring R`, `T1Space R`, `LocallyCompactSpace R`, `Algebra.FiniteType k A`; it gives no compactness and no separation of the point space.
- `TauCeti.PointTopology.instLocallyCompactSpaceWithConv` (`…/PointTopology/Separation.lean:113`), same hypotheses, on `WithConv (A →ₐ[k] R)`.
- `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (`…/PointTopology/Functoriality.lean:110`): `T1Space R` and a surjective `φ : B →ₐ[k] A`.
- `Padic.instProperSpace` (`Mathlib/NumberTheory/Padics/ProperSpace.lean:67`); `LocallyCompactSpace ℚ_[p]` is found by instance search.
- `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion` (`TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean:242`): needs `Finite (R ⧸ v.asIdeal)`, which holds for the ring of integers of a number field.
- `IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean:46`) extends `LocallyCompactSpace K`; instance search confirms it.

**Cross-roadmap citations resolved for the changed passages, 11.**

- ReductiveGroupsPartII (main): §RG2.0.2 (line 590) with the paragraph *smooth-group-analytic-charts* (line 640), which has charts and no openness of centralizer loci; §RG2.2.3 (line 3128: *building-field-extension-embedding*, *weil-restriction-building*, *building-functoriality-central-extensions*, *building-products-and-levis*); §RG2.2.4 (line 3408; the toral embedding into `B(GL(V),K)` at line 3506); §RG2.3.3 (4151) and §RG2.3.4 (4530), neither with an intersection along a closed immersion with equal derived groups.
- ShimuraVarieties §P.5 (its open head, line 223): the regular semisimple open of `Lie(G)` and local conjugacy of real tori near a regular element, which is the `F=ℝ` case of §2.1a.
- EndoscopicTransferAndUnitaryTraceComparison (its open head): §1.2 (line 202), §1.6 (line 355), §1.15 (line 577, "the case stated here is `G₀ = G`").
- Within the README: §1.4 (line 654), §3.4 (line 1076), §5.3a (line 1500) exist as cited by the new `*Needs:*` entries. `grep 'RG2.0.1' README.md` is empty, so no stale citation remains.

**Sources, the seeded sample where it falls in the changed passages.**

- 2.1a: Harder66 lines 527–532 (printed p.407, page marker at line 503). The proof takes regular `X_i` in the local Cartan subalgebras with pairwise distinct root values, a rational regular `X` close to them, and says without argument that the centralizer of `X` has the required property. The README describes exactly this, in its own words.
- 2.2: Harder66 lines 524–526 state Lemma 5.5.3; KMPS22 lines 625–629 and Borovoi98 lines 1448–1451 as in the previous review. Harder phrases the conclusion as equality of inner splitting classes over each completion; the rational-conjugacy formulation of the target is the one KMPS22 states, and the README cites Harder's lemma together with its proof, so nothing needs changing.
- 5.4: only its `*Needs:*` order changed; the KZ25 locators are as confirmed in the previous review.
- The other sampled targets (0.7, 2.0, 2.1, 2.3, 2.4, 3.3, 3.4, 3.5, 4.1, 4.5, 5.7, 5.8) lie outside the diff. The README flags no locator as unverified.

**Ownership and overlaps.** The overlaps file lists no other pull request changing this roadmap and no dropped
id. The five interfaces the Scope now owns were searched by object in the previous review (neither supplier
states any of them at its head); the suppliers' sections were re-read at their heads above and still stop
where the Scope says.

**Remark on untouched text (no change requested).** The citations file flags `Neat.IsNeatAut` (README line 301)
as absent from the pins; it is a declaration of AdelicAlgebraicGroups' `Suggested.lean`, as the previous
review recorded.

**Adversarial table.** The first four rows are the statements the diff touches, with values computed in this
review; the remaining rows are carried from the review at a77c7a9.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1a openness (statement changed: `F=ℂ` or `p`-adic proved here, `F=ℝ` from ShimuraVarieties §P.5) | `GL₂`, `X=diag(1,2)`; `X=1`; `GL₂(ℚ_p)`, `p` odd, `X` with `X²=u`, `u` a non-square unit; `SL₂(ℂ)` | `[E₁₂,X]=E₁₂`, `[E₂₁,X]=−E₂₁`, differential determinant `1·(−1)·1·1=−1≠0`; at `X=1` both factors `0`; nearby discriminants lie in `4u(1+pℤ_p)⊂4u·(ℚ_p^×)²`, so the centralizer stays `ℚ_p(√u)^×`; over `ℂ` one conjugacy class of tori, locus = `disc≠0` | open at regular points only; the three field cases are each covered | none |
| 2.2 Harder (Lean; locator and docstring changed, statement not) | `S=S′=∅`; `GL₂/ℚ`, `S={∞,p}`; Harder66 lines 524–532 | reduces to `exists_isMaximalTorus`; `Res_{E/ℚ}G_m` with `p` split in `E`; Harder's `X` near the `X_i` has centralizer of the local types, the step §2.1a proves | consistent; elaborated type identical to the one at a77c7a9 | none |
| 3.2 `IsPrimeUnit` (topology contract changed) | `G_m/ℚ_3`, `γ=2`, `l=2`; `γ=6`; `F=ℚ(i)`, `v=(1+i)` | `{2ⁿ}⊂ℤ_3^×`, closed in `{xy=1}⊂ℚ_3²`, compact; `|6^{−n}|_3=3ⁿ` unbounded; residue field `𝔽₂` finite, so the pinned adic-completion instance applies and `H(F_v)` is locally compact by `instLocallyCompactSpaceWithConv` | true; false; the pinned hypotheses (T1, locally compact, finite type) all hold | none |
| 3.7 density (Lean; `*Needs:*` gains §3.4) | `G_m`, `l=3`, `γ=−3`, `m=2` | `γ` has modulus `3^{2/2}`, weight `2`; `γ²=9` has modulus `3^{4/2}`, weight `4`, and `9` and `3²·9⁻¹=1` are integral: a `3`-Weil point | powers of Weil points are Weil points, as §3.4 is cited for | none |
| 0.1 `classFunctions` | `GL₂/ℚ`, `x=diag(2,3)`, `g`=swap; `G_m` | `(gxg⁻¹)₁₁=3`, `x₁₁=2`; trace `5=5`; `c*(t)=1⊗t` | `x₁₁` out, trace and `t` in | untouched; carried from the review at a77c7a9 |
| 0.3 Chevalley | `SL₂→PGL₂`, `α=a²` | `α+α⁻¹=s²−2`; `s=±5/2↦17/4`; char 2: `s↦s²` | as stated | untouched; carried from the review at a77c7a9 |
| 0.5 `isConj_iff_trace_eq` | `G_m`: `2` vs `1/2`; `[[1,1],[0,1]]` vs `1` | trace on `t`: `2≠1/2`; on `t⊕t⁻¹`: `5/2=5/2`; unipotent: all traces equal | iff true; `hx,hy` exclude unipotents | untouched; carried from the review at a77c7a9 |
| 0.6 `finite_classFunctions_map` | `G_m→GL₂`, `t↦diag(t,t⁻¹)`; `G=1` | `s↦t+t⁻¹`, `d↦1`; `t` root of `X²−sX+1`: rank 2 | finite, not injective | untouched; carried from the review at a77c7a9 |
| 0.7 `Out′` | `SO(8)`, `t` with 8 distinct eigenvalues | centralizer in `O(8)` = torus in `SO(8)`; reflection conjugate not `SO(8)`-conjugate | `Conj` differs, `Conj′` agrees | untouched; carried from the review at a77c7a9 |
| 1.1 Jordan | `S₃`, `Δ=⟨(12)⟩`; `Q₈`, `⟨i⟩` | Burnside `3+3·1+2·0=6= | S₃ | ·1`; misses 3-cycles; misses `±j` | holds; finiteness needed (`GL₂(ℂ)`, Borel) | untouched; carried from the review at a77c7a9 |
| 1.2(a) Lean | `K=ℚ(i)`; `K=ℚ(∛2)` | no embedding for `ℓ≡3 mod 4`; none for `ℓ≡1 mod 3` with `2` a non-cube | hypothesis fails for every finite `S` | untouched; carried from the review at a77c7a9 |
| 1.4 inner forms | `D^×` vs `GL₂`; `U(1)` vs `G_m` | `(trd,nrd)↦(s,d)`; units `ℚ^×` vs `ℚ^×t^ℤ` | identified; outer form excluded | untouched; carried from the review at a77c7a9 |
| 1.6 central product | `SL₂`, `T=G_m⊃μ₂` | `(g,t)↦tg`, kernel `(z,z⁻¹)`; `s↦(s,1)`; via `PGL₂` `±5/2↦17/4` | injective; torus needed | untouched; carried from the review at a77c7a9 |
| 2.0 localization | norm-one torus of `ℚ(i)` | `(X_*)_Γ,tors=ℤ/2`; `inv_∞+inv_3=1+1=0`; `inv_∞` alone `1≠0` | lifts / does not | untouched; carried from the review at a77c7a9 |
| 2.1 | same torus | Frobenius at inert `3` equals `c` in `Gal(ℚ(i)/ℚ)` | auxiliary `ℓ` inert | untouched; carried from the review at a77c7a9 |
| 2.3 | `G_m`; `Res_{ℚ(i)/ℚ}SL₂` | `G_m/G_m=1` elliptic; `SL₂(ℂ)` finite centre, no compact Cartan | hypothesis needed | untouched; carried from the review at a77c7a9 |
| 2.4 | `n=diag(i,−i)∈SL₂(ℂ)` | `c(n)=n⁻¹`, `n⁻¹c(n)=n⁻²=−1`; cocycles `ℝ^×`, coboundaries `ℝ_{>0}` | nontrivial class | untouched; carried from the review at a77c7a9 |
| 2.4 | `GL₃(ℝ)`, torus `ℂ^×ℝ^×`, `c=(12)`, `w=(13)` | `cwc=(23)`, `w⁻¹·cwc=(13)(23)≠1` | not in torus; anisotropy needed | untouched; carried from the review at a77c7a9 |
| 2.5 | route | `c(u)=c(g)c(t)⁻¹c(n)⁻¹=gt⁻¹n⁻¹=u`; `Int(u)(wμ)=Int(g)μ` | matches `g⁻¹σ(g)` | untouched; carried from the review at a77c7a9 |
| 3.1 `IsSerreTorus` | `G_m`; norm-one `ℚ(i)`; norm-one `ℚ(√3)`; CM `Res`, degree 4 | `J=⊥` minimal; augmentation minimal (`U(1)` has no split subtorus); over `ℝ`, `⊥ <` augmentation; ranks `1` vs `2` | true, true, false, false | untouched; carried from the review at a77c7a9 |
| 3.3 `IsPrimeWeilNumber` | `(3+4i)/5,l=5`; `3,l=2`; `0` | minpoly `X²−(6/5)X+1`, roots of modulus `1=5⁰`, `5α=3+4i`, `5α⁻¹=3−4i`; `2ⁿ/3∉ℤ̄`; root `0` has modulus `0≠l^{w/2}` | true; false; excluded | untouched; carried from the review at a77c7a9 |
| 3.4 `IsPrimeWeilPoint` | `diag(l,1)`; upper unipotent; `q∈G_m` | weights `2,0`; eigenvalue `1` weight `0`; `q` not a unit at `q` | true; true; false | untouched; carried from the review at a77c7a9 |
| 3.5 `IsNeatPoint` | `−1∈G_m`; `diag(2,4)`; `√2` in `Res` | `{±1}` torsion; `⟨2⟩≅ℤ`; `±√2` generate `−1` | false; true; false | untouched; carried from the review at a77c7a9 |
| 3.6 iff (Lean) | `G_m`, `γ=−8`, `l=2`; norm-one `ℚ(√3)`, `2+√3` | ` | −8 | _v=1` for `v≠2`; ` | (−8)^k | =2^{3k}`, `w=6k`; moduli `3.73`, `0.27` | both true; unit but not Weil, excluded by `hS` | untouched; carried from the review at a77c7a9 |
| 3.7 density (Lean) | `G_m`, `l=3`; norm-one `ℚ(i)`, `l=3` inert; `l=5` | Weil `±3ⁿ`, squares `3^{2n}`, a Laurent polynomial with infinitely many roots is `0`; `m=1` fails (`−1`); inert: Weil `={±1,±i}`, `t−1≠0` vanishes on 4th powers `{1}` | true; false without `hl`; dense | untouched; carried from the review at a77c7a9 |
| 3.8 rigidity | `k[ε]/ε²`, `ε↦2ε`; doubled origin | fixes the only point, not identity; swap fixes punctured line | reduced, separated needed | untouched; carried from the review at a77c7a9 |
| 4.3 | `D^×`, split torus `G_m²` | a rational embedding puts `ℚ×ℚ` (zero divisors) in `D` | quasi-split needed | untouched; carried from the review at a77c7a9 |
| 4.5 | `I_ℝ=SL₂(ℝ)` | `SO(2)` compact Cartan; split torus image not anisotropic | (d) needed | untouched; carried from the review at a77c7a9 |
| 4.6 | `d=3` real place; `F⁺=ℚ` | `(ℝ^×)³/((ℝ_{>0})³ℝ^×)` has 4 elements; `T₁=Res_{E/ℚ}G_m`, `ker¹=0` | consistent | untouched; carried from the review at a77c7a9 |
| 5.3a | `G_m→G_m²` diagonal; `SL₂→GL₂` | `K^×∩(O^×)²=O^×`; `GL₂(O)∩SL₂(K)=SL₂(O)` | as stated | untouched; carried from the review at a77c7a9 |
| 5.4 | `G=GL₂`, `F` quadratic | `dim H′=8`, `dim H=7`, derived `6` | `H≠H′` | untouched; carried from the review at a77c7a9 |
| 5.5 | `G_m→GL₂` | fibre over `(5/2,1)` is `{2,1/2}`, two geometric points | injectivity needed | statement untouched (`*Needs:*` now lists §1.4); carried from the review at a77c7a9 |
| 5.6/5.7 | `G_m`, `ν=t²`; `GL₂`, `a=1,q=5` | `x²=r²`, ` | x | =r ⇒ ±r`; discriminant `1−20=−19<0` | real elliptic | untouched; carried from the review at a77c7a9 |
| 5.7a | `SL₂` elliptic centralizer | `(−1)(−1)=1`; a single `−1` | product formula | untouched; carried from the review at a77c7a9 |
| 5.9 | `q=4`, `a=4` | scalar `2` semisimple; companion of `(X−2)²` has a nilpotent part | scalar chosen | untouched; carried from the review at a77c7a9 |

## Not verifiable

- Noot09 (§§0.7, 4.5) and Kottwitz82 (§4.3): settled as waived; cited by locator, not read.
- Harder66 is an OCR of an image-only scan; Harder's definition of the inner splitting class is in Teil I (I.2.3.3), which is not in the manifest and was not read. Nothing in the README depends on it.
- The Bruhat–Tits content of §§5.3a–5.4, §4.6 for a general CM field and the Deligne82 locators: as in the previous review, outside the changed passages.

## Source issues

- **Gap** in Harder66 at proof of Lemma 5.5.3, printed p.407: the source says the centralizer of a rational regular element close to the chosen local ones has the required local class, with no argument; it should give the openness of the local conjugacy locus (inverse function theorem); affects the proof.
