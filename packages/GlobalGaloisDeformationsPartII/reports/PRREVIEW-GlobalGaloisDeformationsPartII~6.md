# Review of GlobalGaloisDeformationsPartII (pull request #1837 at 837c272)

**Verdict:** needs changes

Incremental re-review of the 15 lines changed since bffca34 (README §§4.4, 7.5, 7.6, the finite-image semisimplification contract, two References entries; the docstring of `uniformTorsion_H1`). Nothing changed outside the folder.

## R01 (P3) — The generator lemma is cited at a file that does not exist at the pin

**Location.** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:64`: "because every canonical generator does (`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`)".

**Claim.** The lemma that every canonical generator of U(𝔤) lies in the augmentation Hopf ideal is in that file at the pinned Tau Ceti.

**Witness.** The pin of this pull request's `lake-manifest.json` is Tau Ceti 358314d, and the gate builds against it. There the directory `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/` does not exist; the theorem is `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean:82`. The path on line 64 is the one at main's newer pin 2fd255d9, where the file was split and the theorem sits at `Augmentation/Basic.lean:82`. Line 64 has not changed since the r4 and r5 reviews raised this, and no repair report marks it not actionable.

**Repair.** Either of the following, tested at the respective pin:

- Keep the branch's manifest and on line 64 replace `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean` with `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean`; at 358314d line 82 of that file states `UniversalEnvelopingAlgebra.ι R x ∈ HopfIdeal.augmentation R U` under `[CommRing R] [LieRing L] [LieAlgebra R L]`, which is what the sentence uses (sl₂ Casimir Ω=(ef+fe)/4+h²/8 has counit 0 and lies in the ideal).
- Or bring the branch's `lake-manifest.json` to main's pin 2fd255d9 (by merging main), where the current path is right; then the gate must pass against that pin before the next review.

Whichever is chosen, say in the pull-request description which pin the README's file paths follow.

## Previous findings

- R01 — not repaired: line 64 still reads "`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`"; the diff since bffca34 does not touch it. Carried as R01 above.
- R02 — repaired: §7.6 now reads "H⁰(Γ_F,Lie(Gᵈᵉʳ)⊗k)=z(m)∩g^der and H⁰(Γ_F,(Lie(Gᵈᵉʳ)⊗k)*)=0. Here Lie(Gᵈᵉʳ)⊗k with Ad∘ρ̄ action is the derived adjoint module written M in the Conventions … in this section the letter M denotes the Levi." This matches FKP22 Corollary 6.6 (line 1333: H⁰(Γ_{F,S},ρ̄(g^der))=z(M)∩g^der, H⁰ of its twisted dual zero). The added GL₂ Check computes correctly (table below). §7.5 gained the matching sentence that its M is the adjoint module, not the Levi of §§7.1 and 7.3; both of those sections do use M for the Levi of P=MU. The repair introduced no new problem.
- R03 — repaired: §4.4 now cites "Lazard65, III Proposition (3.1.3), pp.91–92, and Theorem (3.1.7), part (3.1.7.4), p.94; V (2.2.2.3), p.165, (2.2.3.1), p.166, and Theorem (2.4.10), pp.178–179", and the docstring of `uniformTorsion_H1` reads "Lazard65 V (2.2.2.3), (2.2.3.1) and Theorem (2.4.10)". Each label and page agrees with the text (Lazard65 lines 3305, 3401, 3415, 6093, 6113, 6597; printed page = extraction page + 3). The "Lazard V" key is gone.

## Verified sound

**Gate.** The worker's gate at 837c272 passes. I reran it on this head with the build:

```
gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

`git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check** (`gate --depcheck … --movable`) on this head:

```
depcheck: 229 roadmaps, 2316 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Elaboration.** `lake env lean TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean` exits 0 in 16 s with the single diagnostic `declaration uses sorry` at 113:8. The header is `module` / `public import Mathlib` / `public import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`, which exists at the pin. No `set_option`, no sorry'd data. The worker's signature extraction reports "line 128: unexpected token 'in'" and a phantom declaration named `in`; that is an artifact of its parser on the `module` header, not of the file, which elaborates cleanly.

**`#check` binder comparison.** The only Lean change is the docstring of `uniformTorsion_H1`; the elaborated types of the 5 declarations (`ModPow`, `modPowSub`, `modPowRep`, the `ContinuousSMul` instance, `uniformTorsion_H1`) are identical to those compared with README §4.4 in r5. `uniformTorsion_H1` carries every hypothesis explicitly: compact `ℚ_p`-analytic group, semisimple `GroupLieAlgebra`, DVR `O` finite over `ℤ_p`, irreducible ϖ, finite free `V`, continuity on every `ModPow`. No binder dropped.

**Changed passages, read at their locators.**

- Contract (README line 111) "(Ser05 Propositions 3.2 and 3.3, p.207; BMR05 Theorem 5.8, p.24)": Ser05 lines 470 and 480 are both on extraction page 13, whose running head reads printed 207, so the change from "pp.206–207" to "p.207" is right. Serre's §3.2.1 (line 439) takes Γ⊂G(k) over the field k of the exposé, with no perfectness or characteristic hypothesis; Proposition 3.2 is the Levi equivalence and 3.3(a),(b) the L-irreducibility, G-complete reducibility and G(k)-conjugacy of the projection, as the contract states. BMR05 line 1056, arXiv v2 page 24: Theorem 5.8 for an extension of perfect fields k′/k and a k-subgroup H, as the contract and the References entry say.
- References "Ser05": numdam item SB_2003-2004__46__195_0 is the cache's source (line 2); Séminaire Bourbaki exposé 932, Astérisque 299 (2005), pp.195–217 agree with the running heads (line 457 "ASTÉRISQUE 299", line 459 "(932) COMPLÈTE RÉDUCTIBILITÉ 207"). "BMR05": arXiv math/0408109v2 is the cache's source (line 5); Invent. Math. 161 (2005), 177–218 is the published locator; the entry says the page is at arXiv numbering, which is correct. Both keys are recorded in the board's `sources.toml` (lines 206 and 222).
- §4.4 locators: see R03 above. FKP22 Lemma 6.5 at line 1315 and Corollary 6.6 at line 1331, p.30, as §§7.5–7.6 cite.
- §7.6 new Check: computed in the table.
- §7.5 added sentence: consistent with the Conventions (line 29, M=Lie(Gᵈᵉʳ)⊗k, M*=Hom_k(M,k)(1)) and with §7.7, whose dual condition "excludes κ̄⁻¹ from the toral and root constituents" is equivalent to the new Check's κ̄≠1 and χ₁/χ₂∉{κ̄,κ̄⁻¹}, because the root constituents of a toral ρ̄ come in inverse pairs.

**Seeded sample.** None of the 15 sampled targets (0.2, 1.2, 1.5, 2.1, 2.7, 3.6, 4.5, 5.2, 6.1, 6.5, 7.7, 7.8, 8.5, 8.9, 9.3) is in the diff; §7.7 and §7.8 are adjacent to the changed §7.6 and I re-read §7.7 for consistency (above). Their locator checks and table rows stand as in r5.

**Headline theorems and padding.** Unchanged since r5: the only headline statable at the pins is §4.4's degree-one uniform torsion, stated as `uniformTorsion_H1`; the docstring names the other headlines (§§3.6, 5.4, 6.3–6.6, 7.6, 8.5, 8.10, 8.11, 9.2–9.5, 10.1–10.3) and the carrier each lacks. The r5 one-tactic probe (`simp`, `infer_instance`, `rfl`, two explicit witnesses, `aesop`, all failing) applies to the same statement.

**Ownership, overlaps, gaps, cross-roadmap citations.** No change: the overlaps tool reports no other pull request changing this roadmap, no dropped id and no id defined only by an open revision; the citations tool finds every cross-roadmap citation and Lean name. The 26 declared gaps and the 26 README contracts are as in r5; the one contract the diff touches (finite-image semisimplification) only corrected a page number. Suppliers are unchanged and all earlier in the merge order (depcheck above).

**Adversarial table.** Rows for untouched statements are carried from the r5 report; the last six rows are computed for this head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.4 trivial primes (carried, r5) | p=3, norms 7 and 5; residual diag(1,2) at norm 7 | 7≡1 and 5≡2 mod 3; rank(diag(1,2)−I)=1; a trivial prime splits in K⊃μ_{p^D}, so q≡1 mod p^D | holds | none |
| §0.5 strong disjointness (carried, r5) | three quadratic subfields of a C₂² extension; k=𝔽₉, p=3 | product of degrees 8, compositum degree 4; prime-field image has 3 elements | holds | none |
| §1.11 GSp₄ D(1,1,4) (carried, r5) | scalar Levi point (cI,c²); κ̄ of order 5 | χ=1; ord(χ^aκ̄)=5 for a∈{−2,…,2}; for χ=κ̄, a=−1 gives order 1 | holds | none |
| §1.11 equal blocks, zero exponents (carried, r5) | n=1, nonsplit (κ̄⁻¹ ∗; 0 1), χ=κ̄⁻¹ | ±1 tests pass; D(1,1,N) at (0,1) compares 1 with χκ̄=1 and fails; C3 fails | zero-exponent clause needed | none |
| §1.12 Borel criteria (carried, r5) | SL₂ quadratic χ; sl₃(𝔽₁₁), N=E₁₂+E₂₃ | χ²=1; invariants 3; Ad(diag(2,6,1))N=4E₁₂+6E₂₃; [·,N]=−2E₁₃≠0 | holds | none |
| §2.6 prescribed vector (carried, r5) | k=𝔽₉ | 2 allowed inertia values against 8 | holds | none |
| §2.7 marked dual classes (carried, r5) | one and two indices | η_b(τ_w)=e_b*; matrix at (t₁,t₂) is I₂ | holds | none |
| §2.9 refutation of Lemma 3.7 (carried, r5) | trivial SL₂ over ℚ, p≥5 | ζ_w=ζ_{w′}; compositum degree ≤p³<p⁴ | conditional design justified | none |
| §3.2 density estimate (carried, r5) | ε=1/2, s=4; ε=1; s=0 | 1/16<1/10; 0; 1 | holds | none |
| §3.3 trivial-prime pairing (carried, r5) | u,t basis; σ↦στ^c | inv(u∪t)=−1, inv(t∪u)=+1; change −c+c=0 | holds | none |
| §3.6 controlled tower (carried, r5) | e=2, D=1; depth 6 | last central level 2, first noncentral 3 | holds | none |
| §4.3 balanced images (carried, r5) | orders 81,27; 81,81 kernels 27,9 | 3 vs 3; 3 vs 9; Greenberg–Wiles product 1 | holds | none |
| §4.4 and `uniformTorsion_H1` (carried, r5) | finite G; Γ=ℤ₃ trivial action; r=0; unit ϖ; SL₂(ℤ₃) | zero Lie algebra semisimple, H¹ killed by p^{v_p\|G\|}; ℤ₃ gives H¹=ℤ/3ʳ unbounded but excluded; ModPow 0=0; unit ϖ excluded by `Irreducible`; sl₂ simple | holds, not padding | none |
| §4.4 degree 0 (carried, r5) | V^U=0 rationally | H⁰(U,V/ϖʳ)≅H¹(U,V)[ϖʳ], killed by ϖ^{a₁} | holds | none |
| §4.6 Q_N (carried, r5) | O=ℤ₃, M=2, N=8; norms 19, 109; Gₘ | v₃(18)=2 passes, v₃(108)=3 fails; Gₘ gives empty Q_N | holds | none |
| §4.7 root condition (carried, r5) | SL₂, r=2 over ℤ₃ | \|L^α\|=729=\|H⁰\|; unramified part 81; cokernel O/9 | holds | none |
| §5.1 finite splitting field (carried, r5) | M=0; residual dual invariant line | both H¹ of order 1; Hom(𝔽₃,M*) dimension 1 | holds | none |
| §5.2 simultaneous root position (carried, r5) | sl₂(𝔽₃), A=h, B=ev at E₁₂ | dα(h)=2≠0, B(E₁₂)=1; Gram determinant −2≡1 mod 3, 0 in char 2 | holds | none |
| §6.4 sl₂ at p=3 (carried, r5) | p=3, p=2 | coefficients −1≡2, 2 nonzero; dα(H)=1; at p=2 dα(h)=0 | holds for p≥3 | none |
| §6.6 irreducible theorem (carried, r5) | Thm 6.11 hypotheses; dihedral restriction | Cor. A.7 gives C1–C4; invariant lines 0 then 2 | holds | none |
| §7.7 torus criterion (carried, r5) | SL₂ with image {±I} | α(−I)=1, H⁰=sl₂ dimension 3 ≠ 1 | README right, Remark 6.7 wrong | none |
| §7.8 Siegel weights (carried, r5) | a=2, w∈{2,0,−1,−2} | {0,−1,2,3} distinct; pairing sums w | holds | none |
| §1.7 joint determinant field (carried, r5) | κ̄, ψ of order 10 | residual degrees 10, 10, 5; compositum 1 | holds | none |
| Conventions B_G (carried, r5) | type A₃ over 𝔽₃, 𝔽₇ | no regular toral element over 𝔽₃; 120 trace-zero tuples over 𝔽₇ | holds | none |
| §8.10 bound (carried, r5) | K_f=ℚ(√5), p=11 | 1+2·2=5=2[K_f:ℚ]+1 | holds | none |
| §8.11 fixed set (carried, r5) | p=5, S={5}, S′={5,11} | dimensions 1 and 2; 11≡1 mod 5 | holds | none |
| §9.3 non-uniformity (carried, r5) | q≡−1 mod p, induced ρ̄ | M* contains 1; C2, C3 fail | README right | none |
| §10.1 oddness (carried, r5) | GSp_{2n} involution; identity | fixed space gl_n, n²; GSp₄: 4 vs 10 | holds | none |
| Line 64 Casimir (carried, r5) | sl₂ Killing form; trivial module | ε(Ω)=0; scalar 3/8 on standard, 0 on trivial | mathematics holds; file path wrong at pin | R01 |
| §7.6 hypotheses (changed) | GL₂, P upper Borel, M=T, ρ̄=diag(χ₁,χ₂) | Ad(diag(χ₁,χ₂)) on sl₂: h↦h, e↦(χ₁/χ₂)e, f↦(χ₂/χ₁)f; invariants kh (dim 1) when χ₁≠χ₂, equal to z(t)∩sl₂=kh; all of sl₂ (dim 3) when χ₁=χ₂; FKP22 line 1333 states the same equality | holds; matches Cor. 6.6 | R02 repaired |
| §7.6 wrong-reading control (changed) | same ρ̄, module Lie(T)⊗k | invariants t, dim 2 ≠ dim z(t)∩sl₂ = 1 for every χ₁,χ₂ | the Levi reading never holds, as the Check says | none |
| §7.6 twisted dual (changed) | same ρ̄, M*=M^∨(1) | characters 1·κ̄, (χ₂/χ₁)κ̄, (χ₁/χ₂)κ̄; H⁰=0 iff κ̄≠1, χ₁/χ₂≠κ̄, χ₁/χ₂≠κ̄⁻¹; §7.7's "κ̄⁻¹ excluded from toral and root constituents" gives the same set since {χ₁/χ₂, χ₂/χ₁} is inverse-closed | holds, agrees with §7.7 | none |
| §7.5 clarifying sentence (changed) | §7.1 (line 1185), §7.3 (line 1211) | both use M for the Levi of P=MU; §7.5's z(m) is the Levi centre; the H⁰ module is Lie(Gᵈᵉʳ)⊗k as FKP22 Lemma 6.5/Cor. 6.6 (lines 1315, 1333) | consistent | none |
| §4.4 and docstring locators (changed) | Lazard65 text | III (3.1.3) "Proposition" line 3305 on extraction p.88 = printed 91; (3.1.7) "Théorème" line 3401, (3.1.7.4) line 3415 on extraction p.91 = printed 94; V (2.2.2.3) line 6093 p.165, (2.2.3.1) line 6113 p.166, (2.4.10) "Théorème" line 6597 p.178 | labels and pages right | R03 repaired |
| Contract line 111 and References (changed) | Ser05, BMR05 texts | Props 3.2/3.3 lines 470/480 on printed 207 (running head line 459); Thm 5.8 line 1056 on arXiv p.24 (footer line 1066); Invent. Math. 161 (2005) 177–218; Astérisque 299, exposé 932 | locators right | none |

## Not verifiable

- Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9, and BC14 Lemma 10 and Propositions 11 and 32 are settled as uncertified and cited by locator only; not read.
- Locators of BLGGT14, BLGHT11, ANT20, LP11 and Ribet10 are outside the diff and were not re-read this round; they were read in earlier rounds and the texts are in the cache.

## Source issues

- **Gap** in FKP22 at Corollary 6.6, p.30: the source says the number-field case holds for any continuous ρ̄ with image in M(k) under the listed local and H⁰ conditions; it should also assume F totally real and ρ̄ odd, since its proof applies Theorem 5.2; affects a stated result.

The seven other source issues of the r5 report (FKP22 Lemma 3.7, Example A.17, proof of Corollary 6.6, Remark 6.7, Example 6.8, Remark 8.2; FKP19 Lemma B.1 proof) concern passages the diff does not touch and stand as registered there.
