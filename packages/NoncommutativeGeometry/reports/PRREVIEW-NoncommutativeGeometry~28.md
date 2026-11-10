# Review of NoncommutativeGeometry (pull request #1143 at ae7c72a)

**Verdict:** needs changes

This is an incremental re-review of the 42 lines of `TauCetiRoadmap/NoncommutativeGeometry/README.md` changed since c19d9aa. `Suggested.lean` is unchanged.

There are three findings: one P2 and two P3.
- R01 (P2) is carried: ownership of `A_θ` is still shared with OperatorKTheory #866.
- R02 (P3) is carried: the pull-request description still describes an earlier head.
- R03 (P3) is new: N5's new summability step re-derives a bound the Tau Ceti pin already proves, without citing it.

The N5 hypothesis repair (r27 R02) and the N4 rounding repair (r27 R04) are correct.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r27 R01 (first raised in r20). Not repaired. The repair report answered it with no change and left the merge-order sentence to the description. The description is unchanged.

**Location.**
- README 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- README 1853: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ.

**Witness.** OperatorKTheory #866 is still at 1377338a. Its `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1782–1784 defines `A_θ=C(𝕋)⋊_αℤ` and "the canonical trace `τ=HaarIntegral∘E`";
- 1796–1798 proves the universal presentation and that τ is faithful;
- 2324–2326 says NoncommutativeGeometry consumes "K7's rotation algebras with their K-groups".

**Repair.** This roadmap is on main, so #866 must cite it, never the reverse. The README side is already correct.
- In the description's merge-order block (`<!-- merge-order -->`), state that #866 merges after this pull request.
- #866 replaces 1782–1784 and 1796–1798 with a citation of NoncommutativeGeometry N6, and rewrites 2324–2326 as consumption of N6.
- **Test:** afterwards, `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` both return nothing.

## R02 (P3) — The description still describes an earlier head

Carried from r27 R03 (first raised in r20). Not repaired: the description is word for word the one r27 read.

**Location.** The pull-request description, outside the generated block.

**Claim.** The description still says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- that N1.Tensor is the "sole early supplier" of these tensors, "including their universal property";
- "GitHub build passed for submitted head `84190a1e…`".

**Witness.**
- `git diff --stat origin/main...HEAD` lists `Suggested.lean` with 147 changed lines. Main's file has 4 top-level declarations; this head has only `bijective_matrixExtension` (line 64).
- The README contains no "K5". N7 writes `x⊠_u y` and `x⊠_s y` (1686–1700).
- No *Needs:* line names AlgebraicKTheory. The only mention is README 111, as the owner of further theory.
- README 104–106: SmoothBanachRepresentations Layer 8's "generic inverse closure is not an input here".
- README 494 and 576 consume the pinned `CompletedProjectiveTensorProduct.liftEquiv`.

**Repair.** Rewrite these sentences for this head:
- `Suggested.lean` states only `bijective_matrixExtension`;
- N7 has the two reductions x⊠_u y and x⊠_s y;
- N2 consumes the pinned `ExactK0` and `AlgebraicK1` and no AlgebraicKTheory section;
- N6 consumes nothing from SmoothBanachRepresentations Layer 8;
- N1.Tensor consumes Tau Ceti's completed tensor and its universal property.

Drop the build report for 84190a1e and add the #866 order from R01. One sentence on N5 would also help readers: its Hochschild-class theorem now assumes `|D|⁻ⁿ` in the logarithmic ideal.

## R03 (P3) — N5's summability step re-derives a pinned bound instead of citing it

New. It is in the passage this round added.

**Location.** README 1384–1386: "Prove finite summability in every larger exponent: `μ_j(|D|⁻ⁿ)≤σ_(j+1)(|D|⁻ⁿ)/(j+1)=O(log(2+j)/(j+1))`, so |D|⁻¹∈S_q for every q>n". Also N5's *Needs:* line, README 1462.

**Claim.** The route itself proves that membership in `L^(1,∞)` gives `μ_j=O(log(2+j)/(j+1))`.

**Witness.**
- Tau Ceti `TauCeti.OperatorIdealFamily.mul_singularValue_le_gauge_logarithmic_mul` (`TauCeti/Analysis/OperatorIdeal/Family/Logarithmic.lean`:239, in a `public section`) proves `(N+1)·a_N(T) ≤ ‖T‖_(1,∞)·log(N+2)`.
- No README line names it, and README 1462 lists neither it nor `OperatorIdealFamily.logarithmic`.

**Repair.**
- In 1384–1386, take the bound from the pin: "by the pinned `TauCeti.OperatorIdealFamily.mul_singularValue_le_gauge_logarithmic_mul`, `(j+1)μ_j(|D|⁻ⁿ)≤‖|D|⁻ⁿ‖_(1,∞)log(2+j)`, so |D|⁻¹∈S_q for every q>n".
- Add that name and `OperatorIdealFamily.logarithmic` to N5's *Needs:* line.
- **Test:** the bound is attained, not just satisfied:
  - circle n=1: `‖|D|⁻¹‖_(1,∞)=4/log 3=3.6410`, and at j=1 both sides are 4;
  - the n=2 witness: `‖T‖_(1,∞)=2.4853`, and at j=3 both sides are 4.
- The gate's readme-ids check resolves the name at the pin.

## Previous findings

- R01 — not repaired: README 50–56 still reads "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ`", and #866 is unchanged at 1377338a ("τ=HaarIntegral∘E" at 1784, "K7's rotation algebras" at 2326). Carried as R01.
- R02 — repaired: README 1379–1384 "assume `|D|⁻ⁿ∈L^(1,∞)`, N4's logarithmic ideal … For n=1 this is D⁻¹∈L^(1,∞); for n≥2 it is strictly weaker than D⁻¹∈L^(n,∞)".
  - r27's n=1 witness did not separate the two hypotheses, because this README's `L^(1,∞)` is already the logarithmic ideal. The repair rightly separates them at n=2 (new Check 1436–1447).
  - It introduced no new problem, apart from R03.
- R03 — not repaired: the description still reads "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged". Carried as R02.
- R04 — repaired: README 1242 "at N=10⁶ the first is 28.785 and `σ_N(S+T)` is 27.399"; 2H_N=28.785453.

## Verified sound

**Gate, dependency check and build.**
- The gate, rerun at ae7c72a with `--base origin/main`, reports every scanner 0 and `OK`, exit 0. The worker's run adds `build=0`.
- The dependency check (`--movable`, `--pr 1143`) prints `depcheck: 234 roadmaps, 2267 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0. The only warning is `declaration uses sorry` at 64:8.
- `Suggested.lean` is a `module`, so its theorem is private to importers. I appended `#check @TauCetiRoadmap.NoncommutativeGeometry.bijective_matrixExtension` to a scratch copy and elaborated it. The type is:
  - `R` with `[CommRing R] [Algebra ℚ R]`;
  - `A` with `[Ring A] [Algebra R A]`;
  - `M` with `[AddCommGroup M] [Module R M]`;
  - `ι` with `[Fintype ι] [DecidableEq ι] [Nonempty ι]`;
  - conclusion `Function.Bijective (matrixExtension M ι n)`.

  This is README 691–696 exactly, with no binder lost. Its docstring's N5 bullet names no summability hypothesis, so the README and the Lean still agree.

**The changed passages, claim by claim.** Values are in the table below.
- **Equivalence of the two hypotheses for invertible D.** `|D|⁻ⁿ` and `(1+D²)^(−n/2)` differ by the factor `(|D|²/(1+D²))^(n/2)`. Since |D| is bounded below, that factor is bounded with a bounded inverse.
- **n=1.** D⁻¹ and |D|⁻¹ have the same singular values, so the new hypothesis is the old one.
- **n≥2.** N4 (README 1178) gives `T∈L^(n,∞) ⇒ |T|ⁿ∈L^(1,∞)`, so the new hypothesis is implied by the old. It is strictly weaker:
  - for n=2, the new Check is a witness;
  - for general n, `D=diag(μ_j(T)^(−1/n))` (tensored with σ₁ in even parity) gives `(j+1)μ_j(D⁻¹)ⁿ=2k` at `j=2N_k−1`.
- **The commutator identity.** `[F,π(a)]=([D,π(a)]−Fδ(π(a)))|D|⁻¹` follows from D=F|D|. It is the identity in the proof of CRSZ Lemma 30 (carey-rennie-sukochev-zanin line 962, p. 17).
- **The character.** With q∈(n,n+1], N3's character needs `n+1≥p` (README 1079), and that holds. Continuity in a uses N5's regularity with continuous maps (1374–1375).
- **The new Check.**
  - The grading `1⊗σ₃` anticommutes with `Λ⊗σ₁`.
  - μ_j(T)≤1, so |D|≥1.
  - D⁻¹ has the values `μ_j(T)^(1/2)`, each twice, so `μ_(2j+1)(D⁻¹)²=μ_j(T)`.
  - N7's Fourier triple, off its kernel, has `(j+1)μ_j(D⁻¹)²→1/(2π)`, so it lies in L^(2,∞).
- **The circle Check's** change from D⁻¹ to |D|⁻¹ is correct, and the value 2 recomputes.

**Locators in the changed passages: 3, each read in the cached texts.**
1. Connes IV.2, Theorem 8, p. 315 (connes94 lines 11865–11873): it assumes `D⁻¹∈L^(n,∞)`, Sign D=F, and that a and [D,a] lie in every δ-domain. The README's "under D⁻¹∈L^(n,∞)" is exact.
2. Carey–Rennie–Sukochev–Zanin (CRSZ), Theorem 16(b), p. 9 (carey-rennie-sukochev-zanin line 508; page 9 begins at 458): the M^(p)_(1,∞)-summable case, for every Dixmier trace. Lines 429–431 identify Dixmier traces with `ξ_ω` for dilation-invariant ω.
3. CRSZ, Definition 13(d), p. 8 (line 453): `(1+D²)^(−p/2)∈M_(1,∞)`, against 13(c) (line 452) for the weak ideal.

I also read CRSZ lines 53–55 and 131–133: `M^(p)_(1,∞)` strictly contains `L_(p,∞)`, the improvement the new Check exhibits. Case 4 (line 1179) of the proof covers (b).

The seeded sample of 15 locators verified in r27 is carried; none of them falls in the changed lines.

**Library declarations opened at the pin (Tau Ceti 2fd255d).**
- `TauCeti.OperatorIdealFamily.logarithmic` (`Analysis/OperatorIdeal/Family/Logarithmic.lean`:163): gauge `sup_N K_(N+1)(T)/log(N+2)`, which is N4's `L^(1,∞)`.
- `mul_singularValue_le_gauge_logarithmic_mul` (same file, 239; R03) and `kyFanGauge_le_gauge_logarithmic_mul` (232).
- A grep found no pinned inclusion of `L^(1,∞)` into a Schatten class, so the S_q step is this roadmap's to prove.

**Consumers and ownership of the changed theorem.**
- The widened hypothesis only enlarges the theorem's reach.
- SpectralManifolds #1158 at b1e8fb72 consumes N5's triples, δ-calculus and regularity (README 7, 21, 70, 75). CompactQuantumMetricSpaces #1155 cites N5's triples (README 80, 288, 938–951, 999). Neither cites the old D⁻¹∈L^(n,∞).
- `roadmaps grep -i 'Hochschild class|Hochschild-class|Carey.{0,5}Rennie'` finds no other owner of the spectral-triple Hochschild-class theorem. The #1187 hits are main's copy of this README, and the description orders #1187 after this pull request.
- The overlap check lists no dropped id and no revision-only id.

**Remark (untouched text, no change requested).** N4's additivity route (README 1206) uses the same bound `μ_N≤σ_N/N` without the pinned citation that R03 asks for in N5.

**Adversarial pass.** Values were computed in pure-Python scratch scripts. Rows marked (r27) are carried from the r27 report for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| N4 additivity Check (1239–1248) | N=10⁶ | 2H_N=28.785453 (README now 28.785); σ_N(S+T)=2H_(5·10⁵)=27.399160; means 2.08356, 1.98322 | true | r27 R04 repaired |
| N5 hypothesis at n=1 (1379–1384) | circle D=diag(k+½); N4's block T as \|D\|⁻¹ | both readings are the logarithmic ideal; circle σ_(2M)/log(1+2M)=2.2082 at M=10⁵, tending to 2; ‖T‖_(1,∞)=2.4853 | the two hypotheses coincide | none |
| N5 hypothesis at n=2 (new Check 1436–1447) | D=diag(μ_j(T)^(−1/2))⊗σ₁, γ=1⊗σ₃, ℂ by scalars | max μ_j(T)=1, so \|D\|≥1; σ₁σ₃+σ₃σ₁=0; \|D\|⁻²=T⊗1 with sup σ_(2N)/log(1+2N)=3.9308 (k≤8); (2j+2)μ_(2j+1)(D⁻¹)²=4, 8, 12, 16 at k=1..4 | new hypothesis strictly weaker; Check true | none |
| \|D\|⁻ⁿ against (1+D²)^(−n/2) | the n=2 witness, \|D\|≥1 | λ²/(1+λ²)=0.500 at λ=1, 0.9901 at λ=10, inside [½,1) | equivalent | none |
| μ_j(\|D\|⁻ⁿ)=O(log(2+j)/(j+1)) | T for j<2¹⁷; circle \|D\|⁻¹ | T: sup (j+1)μ_j/log(2+j)=2.4853, attained at j=3 (4=2.4853·log 5); circle: 4=3.6410·log 3 at j=1 | true, and pinned | R03 |
| [F,π(a)]=([D,π(a)]−Fδ(π(a)))\|D\|⁻¹ | D=diag(3,−1.5,0.7,−4,2.2,−0.3), random complex 6×6 a; circle z | max error 1.3·10⁻¹⁵; the order δ(a)F gives error 19.17; circle: only e₋₁↦2e₀ (entries 0, 2, 0) | true | none |
| \|D\|⁻¹∈S_q exactly for q>n | n=2 witness, q=2, 2.5, 3 | 2Σμ_j(T)^(q/2) to 2¹⁶ / 2¹⁷: 35.19 / 43.19 (2σ_T(N_k)=35.19, 53.19, 75.19, 101.19, 131.19 at k=4..8, diverging); 17.38 / 18.09; 12.40 / 12.46 | true | none |
| τ_n from n<q≤n+1 | n=1, q=2; n=2, q=3 | N3's condition n+1≥p: 2≥2, 3≥3 | true | none |
| Fourier triple in L^(2,∞) off its kernel | lattice up to R=400 | sup (j+1)μ_j(D⁻¹)²=0.2026; tail 0.1591, against 1/(2π)=0.1592 | true | none |
| circle Check, \|D\|⁻¹∈L^(1,∞) (1423–1425) | M=10⁵ | σ_(2M)=26.95287=4(H_(2M)−H_M/2); ratio to log(1+2M) 2.2082, tending to 2 | true | none |
| N5 theorem, degenerate case | finite-dimensional H, n=1, a 1-cycle Σa₀⊗a₁ | φ_ω=0, since Tr_ω kills finite rank; τ₁(c)=Tr(F·Σ(a₁a₀−a₀a₁))=0 | 0=0 | none |
| N5 locators | connes94 11865–11873; carey-rennie-sukochev-zanin 452–453, 504–509 | Connes: D⁻¹∈L^(n,∞), p. 315; CRSZ 16(b) M^(p)_(1,∞), p. 9; 13(d), p. 8 | true | none |
| `bijective_matrixExtension` (r27) | ℚ against M₂(ℚ), n=0, 1; ι=∅; R=0 | HC⁰: 1 vs 1; HC¹: 0 vs 0; ι=∅: HC⁰(A;M)≠0 vs 0, so `Nonempty` is needed; R=0: 0 vs 0 | true | none |
| N1.Tensor: cross norm and Banach comparison (r27) | ℓ¹₂⊗ℓ¹₂, u=e₀⊗e₀+e₀⊗e₁+e₁⊗e₀−e₁⊗e₁ | projective 4; injective 2 over ℝ, 2.828427 over ℂ | true | none |
| N1.Cyclic: S normalization (r27) | shuffles of two pairs; ∏[2k,2] at q=−1 | signs sum 2 (unsigned 6); products 1, 2, 6, 24, 120 = m! | true | none |
| N1.Cyclic: coboundary and currying signs (r27) | M₂(ℂ), e₁₂, e₂₁, φ=a₁₁ | (b Tr)=0; (bφ)=1; opposite actions give −1 | true | none |
| N1.Cyclic: cyclic sign (r27) | ψ on the circle, 4096 points | ψ(z⁻¹,z)=1.0; ψ(z,z⁻¹)=−1.0 | true | none |
| N2: pairing constants (r27) | m=0..5; k=0..4 | c_(2m)(−1)^m(2m)!/m!=1/m!; (1/((1+i)√π))²=−0.159155i=1/(2πi) | true | none |
| N2: Bott class (r27) | z=0.3−0.7i, 1.2+0.5i | 0.8011537i vs 0.8011537i; 0.276392i vs 0.276392i; pairing +1, 1−p gives −1 | true | none |
| N3: Hardy calibration (r27) | ℓ²(ℤ) truncated at ±50 | [F,z]: e₋₁↦2e₀; τ₁=2; pairing −1 = ind(PzP); Connes' printed λ₁ gives +1 | true | none |
| N3: Schatten Checks (r27) | S=diag(2,1), T=[[1,1],[0,1]]; weighted shifts | μ(ST)=(2.9208, 0.6847); Hölder 4≤5; ζ(1.1)=10.5844 | true | none |
| N3: doubling and sine (r27) | F=1/2; F∈{±1, 3} | F′²=I, trace 0; wrong sign 0.866; (F/3)²−1=−0.889 | true | none |
| N4: non-measurable operator (r27) | recursion to k=60 | M alternates 0.743683, 0.756317 = 2/3+(log 2)/9, 5/6−(log 2)/9 | true | none |
| N4: L^(1,∞)∖S_(1,∞) (r27) | k=1..5 | (j+1)μ_j=2k; σ bounds 7, 12, 19, 28, 39 ≤ 9, 16, 25, 36, 49 | true | none |
| N5: bounded transform (r27) | D=diag(0,1,−1) | F_D=(0, 0.707107, −0.707107); 1−F²=(1, 0.5, 0.5) = \|(D−i)⁻¹\|² | true | none |
| N5: absolute value (r27) | D=diag(k+½), M=10⁶ | positive-part mean 1.1421, tending to 1; D⁻¹ gives 1−1=0 | true | none |
| N6: multiplier, trace, rotation (r27) | θ=1/2, θ=1/4 | e(−1/2)=−1 both orders; rotation e(θ)=i vs e(−θ)=−i | true | none |
| N6: projection replacement (r27) | random idempotent in M₃(ℂ) | p²−p=0, p*−p=0, ses⁻¹=p, Tr e=Tr p=2 | true | none |
| N7: Fourier triple (r27) | mode (3,−2); R=200, 800 | D²/4π²=13·I; lattice ratios 0.14616, 0.14853 tending to 0.15915 | true | none |
| N7: Hardy product (r27) | random entries; W=(σ₁−σ₂)/√2 | Tr₂(σ₃[D,a][D,b])=2i(x₁y₂−x₂y₁); ((1+i)√π)²/(2πi)=1 | true | none |
| N7: odd modules and Heisenberg (r27) | θ=0.3137, k=5; s=0.81, θ=0.37 | V₊Se₅=e(θ)SV₊e₅; c₁=1 | true | none |
| CRSZ bullet: 2-torus (r27) | R=60, 150 | ½Tr(γF…)=12.5659i, 12.5663i against 4π; Fγ order gives the negative | true | none |
| `A_θ` ownership | #866 at 1377338a | lines 1782–1784, 1796–1798, 2324–2326 unchanged | two owners | R01 |

## Not verifiable

- None. Every locator in the changed passages was read in the cached texts. The published CRSZ (J. Spectral Theory 6) was not read; the README cites the arXiv v1 numbering it uses.

## Source issues

- **Gap** in carey-rennie-sukochev-zanin at Definition 15 with Theorem 16(b), p. 9: the source defines Ch only for (p,∞)-summable triples, through Proposition 14, yet uses it for M^(p)_(1,∞)-summable ones; it should note that ch(c)=B|D|^(−p−1), with B bounded by Lemma 30 (p. 16), is trace class there; affects nothing.
