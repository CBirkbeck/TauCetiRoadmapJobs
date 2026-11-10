# Review of ExponentialSumsAndCircleMethodPartII (pull request #2138 at 08149d5)

**Verdict:** accepted

:robot: AI review (claude-fable-5-2). Incremental re-review of the 128 lines changed since d01cb8f. No finding: all five previous findings are repaired, the repairs introduce no new problem, and the gate passes. Accepted conditional on the declared supplier gaps (gap:sf-fibre-strata, gap:lpv-universal-monodromy), as in the previous report.

## Previous findings

- R01 — repaired: `Suggested.lean:163–223` adds Layer 11 with `finitePoint`, `pointNearInfinity`, `PrescribedGerm`, `Hco`, `fermatCubic`, `fermatCubicClosure`, `fermatLeadingVector` and `compactOpen_germ_obstruction`; README lines 7, 1363, 1382, 1452, 1550 name them; the docstring keeps only §13.2 and §§12.5, 13.3 as not statable.
- R02 — repaired: the description now says "the 'Part II' … does not refer to a Part I … that rename is left to a maintainer, and this pull request keeps the present name", the alternative the previous repair allowed.
- R03 — repaired: `README.md:453` "(BS20, §2, Lemma 2.4(3), p.903, BS20 line 469; applied in §5, proof of Proposition 2.6, p.934, BS20 line 1845, where the printed floor ⌊kd/2⌋ has to be replaced by the ceiling, see §9.3.)"
- R04 — repaired: `README.md:860` "(STACKS, Homology, §12.24 (012K), Lemma 12.24.13 (0BK5).)"; the line numbers into an unrecorded chapter are gone.
- R05 — repaired: headings are now "11.12 The compact-open germ space is not homotopy equivalent to Ω²X", "10.3 Comparison in the sharp range under the sharp minor-arc hypothesis", "13.2 Trace perfection fails for the compact-open germ space in the Fermat example"; 9.3, 10.10, 12.3 and 13.1 were renamed in the same spirit.

## Verified sound

**Gate, build and dependencies.** The push gate re-run on this head: every scanner 0, result OK (the worker's record also has build=0). `lake env lean` on `Suggested.lean` gives exactly three `sorry` warnings (lines 115, 141, 217) and nothing else. The dependency check prints `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`: no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean form of the new block.** No `set_option`, no sorry'd data; the seven new definitions have real bodies and each is used by the one new headline (`finitePoint`, `pointNearInfinity` → `PrescribedGerm` → `Hco`; the three Fermat definitions → the theorem). `#check @` on all 10 affected declarations: `PrescribedGerm : {n : ℕ} → Set (ℙ ℂ (Fin (n+1) → ℂ)) → ℕ → (Fin n → ℂ) → C(ℙ ℂ (Fin 2 → ℂ), ↑Y) → Prop`, `Hco : … → Type`, and the theorem elaborates as `∀ ζ, ζ^3 = -1 → ∀ x₀ : ↑fermatCubic, (∃ g φ, Surjective φ) ∧ ¬Nonempty (HomotopyEquiv (Hco fermatCubicClosure 2 (fermatLeadingVector ζ)) ↑(GenLoop (Fin 2) ↑fermatCubic x₀))`. No binder is lost; these agree with README §§11.1, 11.2, 11.6 and 11.12 (generality "any subset Y⊂Pⁿ(C)" in both; weak equivalence explicitly left out of the Lean in both). `Hco` is an `abbrev`, so the subtype topology is found without a hand-written instance.

**Padding probe.** On scratch copies, `simp`, `rfl`, `infer_instance`, `exact ⟨by simp, by simp⟩` and `constructor <;> simp [Hco, PrescribedGerm]` all fail on `compactOpen_germ_obstruction` (both conjuncts stay open after unfolding). Not padding. The two earlier theorems are untouched (previous report).

**Library declarations opened at the pin (7 new, all at the cited line).** `Projectivization.instTopologicalSpace` Topology/Algebra/Projectivization.lean:44; `Projectivization.continuous_mk` :61; `Projectivization.rep` LinearAlgebra/Projectivization/Basic.lean:91; `Asymptotics.IsBigO` Analysis/Asymptotics/Defs.lean:87; `FundamentalGroup` AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:34; `GenLoop` Topology/Homotopy/HomotopyGroup.lean:98 (a `Set C(I^N, X)`, so compact-open subspace topology, boundary to the basepoint); `ContinuousMap.HomotopyEquiv` Topology/Homotopy/Equiv.lean:43. Neither pin has a prescribed-germ condition, a germ mapping space or a Fermat hypersurface (grep by object; `library-matches.md` has no same-name hit for the 8 new declarations).

**Cross-roadmap citations in the changed passages (resolved at the AlgebraicTopologyPartII head ed88288).** §5.4 *Fermat double-loop simple connectivity* exists (README line 813) and states π₂X=π₃X=0 for n≥5 and all exponents ≥1; §§4.1–4.2 exist (lines 621, 644; μ=(k−1)ⁿ at line 660). The new sentence "`fermatCubic` is the Fermat fibre of AlgebraicTopologyPartII §5.4 with forty exponents all equal to 3" is correct: that roadmap's `fermatFiber k` is `{z : Fin n → ℂ // ∑ i, z i ^ k i = 1}`, and its acceptance theorem uses the same `GenLoop` model with index `Fin 2` at every basepoint. The names differ (`fermatFiber` versus `fermatCubic`) and live in different namespaces, so there is no clash of fully qualified names. No other roadmap cites this folder's renamed headings (`roadmaps grep`), and the README itself has no reference to the old heading texts. Overlaps: none listed; no other open pull request changes this folder.

**Seeded sample.** Of the fifteen sampled targets only §11.12 lies in a changed passage. Its heading matches the sample; its locator points at BS20 line 2142 (the p. 940 page marker, where §7's germ definition and Lemma 7.2 begin), unchanged from the previous head. The changed §4.3 locators were read: BS20 line 469 is Lemma 2.4(3) on p. 903 (page marker at line 453), BS20 line 1845 is the m₀=⌊kd/2⌋−1 line on p. 934 (page marker at line 1815). The other fourteen sampled targets are untouched text and were not re-read.

**Adversarial table.** Rows for the statements the diff leaves untouched are carried from the previous report (PRREVIEW-ExponentialSumsAndCircleMethodPartII~1, "Adversarial table", 33 rows: §§1.3–1.5, 2.1–2.2, 3.3–3.4, 4.1/4.3, 4.4, 5.1, 5.4, 5.14, 6.3, 6.5, 7.1, 7.4, 8.5, 8.7, 8.9 `minor_arc_polar_count` with its four rows, 8.10, 9.4, 10.2/10.5, 10.6, 10.8 `mapping_geometrically_irreducible` with its three rows, 10.9, 11.7, 11.10, 12.2, 12.3); none of those statements changed. New rows, with coordinate 0 the homogenizing one as in the Lean:

| Statement | Instances | Values | Result |
|---|---|---|---|
| `finitePoint`, `pointNearInfinity` | z≠0; z=0; nonvanishing proofs | ![1,z]=z·![1/z,1], so [1:z]=[1/z:1]; z=0 gives [1:0]=∞; second entry of ![T,1] and first of ![1,z] are 1≠0 | as documented |
| `fermatCubicClosure` | rescaling the representative by λ≠0; [1:y]; [0:1:ζ:0:…] | both sides scale by λ³; Σy_j³=1, the equation of `fermatCubic`; 1+ζ³=0=0³ | well defined; closure of X; contains P |
| `fermatLeadingVector` | ζ=−1; ζ=1 | cube sum 1+ζ³ = 0; = 2 | on the leading cone iff ζ³=−1 |
| `PrescribedGerm`, positive example | g=(T²,ζT²,1,0,…), n=40, d=2 | F([1:z])=[z²:1:ζ:z²:0:…]; w₀−z²=0; w_j−x_j=(0,0,z²,0,…)=O(z); finite T has coordinate 0 equal to 1≠0; Σ=T⁶+ζ³T⁶+1=1 | satisfied |
| `PrescribedGerm`, wrong models | normal coordinate 2z^d; z^(d+1); d=0 | any lift is λ(z)·w with λ=1+O(z) (forced by w₁→x₁=1); λ·2z²−z²=z²(1+O(z))≠O(z³); λ·z³−z²≠O(z³); d=0 gives F(∞)=[1:x], a finite point | first two excluded; d=0 is outside the README's d≥1 and unused by the headline |
| `PrescribedGerm` forces F(∞)=P | z→0 | w(z)→(0,x), x≠0, `mk` continuous at nonzero vectors, F∘[1:z] continuous | F(∞)=[0:x], as README line 1363 says |
| `Hco`, the escaping loop of §11.7 is in it | fixed s>0; s=0; s=1 | r(T)<s/2 for large T so h=1, σ=1: F_s=g on a tail; h=0, σ=1; h=min(1,(1−r)/r)=1 as r≤1/4 | each member satisfies the pointwise germ; based loop at g |
| `compactOpen_germ_obstruction`, first conjunct | v=w₀/w₁ on the tail; r=1/4 | v(F_s(R))=1/a_s(R)≠0 by the finite-point clause; ratio to g is σ⁻¹; phases at s=0, 3/8, 1 are 1, −1, 1; lift difference +1, so winding −1 | π₁(Hco,g)→ℤ onto |
| same, hypothesis ζ³=−1 | ζ=1 | P=[0:1:1:0:…], 1+1=2≠0, P∉closure, so Hco=∅ and the first conjunct fails | hypothesis needed |
| same, second conjunct | X≃∨S³⁹ (2⁴⁰ spheres), any x₀ | π₀(Ω²X)=π₂X=0, π₁(Ω²X)=π₃X=0 at every basepoint; an equivalence would give π₁(Hco,g)≅0, against the surjection onto ℤ | holds for every x₀ |
| same, vacuity | Hco=∅ | second conjunct alone would hold for an empty space; the first conjunct supplies a point | not vacuous |
| §4.3 locator | L=9, b₅=1 | H₄ is the 5×5 anti-identity, rank 5>4; printed m₀=⌊9/2⌋−1=3 misses m=4 | README and locator now agree |

**Description.** "states the three headline theorems that are statable at the pins" agrees with the head (three theorems, 13 definitions).

Remark (untouched text, no change asked): BS20 line 469 extracts the threshold of Lemma 2.4(3) as "m>kd/2"; the previous report read the sign as ⩾ from a page render, which is what §4.3 uses.

## Not verifiable

- Lee's thesis, Lemma 3.3.5 (cited only through BS20 for §1.3): not read, as in the previous report; untouched text.
- Ownership was checked against the open roadmap pull requests whose heads the brief supplies and with `roadmaps grep` over the index of 438.

## Source issues

- none (no new source mistake in the passages read this round; the eight BS20 items of the previous report stand).
