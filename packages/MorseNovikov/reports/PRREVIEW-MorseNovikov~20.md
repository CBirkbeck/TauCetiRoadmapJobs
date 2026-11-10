# Review of MorseNovikov (pull request #1161 at 5da7b0d)

**Verdict:** accepted

Incremental re-review of the 4 lines changed since e3dc9d3 (`TauCetiRoadmap/MorseNovikov/README.md:737` and `:755`). No finding: the previous report's single finding is repaired, the repair introduces no new problem, and the gate passes.

## Previous findings

- R01 — repaired: `README.md:737` now reads "Q(Nov)=F×F with F the fraction field of ℤ((t)) … followed by §4.3's embedding F⊂ℚ((t)). F is neither ℚ((t)) nor ℚ⊗ℤ((t))", with exp(t) and 1/(2−t) as witnesses.

## Verified sound

### The two changed passages

**§4.2 Check, `README.md:737`.** Recomputed in full:

- With t=e^(−1,0) (N(t)=1) and g=e^(0,1), the ring is ℤ((t))[g]/(g²−1). 2 is a nonzero divisor, so the idempotents (1±g)/2 exist in the total quotient and split it as F×F, F=Frac(ℤ((t))).
- Q(ℤ[H])=ℚ(t)×ℚ(t) by the same idempotents, and ℚ(t)→F is the inclusion of fraction fields induced by ℤ[t,t⁻¹]⊂ℤ((t)).
- If h has lowest nonzero coefficient c at t^k, then h=c·t^k·(1+u) with u of positive order and coefficients in ℤ[1/c], so h⁻¹∈ℤ[1/c]((t)) and f/h∈ℤ[1/c]((t)). The coefficient 1/p! of exp(t) is not in ℤ[1/c] for a prime p not dividing c. So exp(t)∉F and F≠ℚ((t)).
- 1/(2−t)=(1/2)·Σ(t/2)ⁿ=Σtⁿ/2ⁿ⁺¹ is in F (2−t is a nonzero element of ℤ((t))); its denominators are unbounded, while every element of ℚ⊗ℤ((t)) has a common denominator. So F≠ℚ⊗ℤ((t)).
- The splitting with free generator (1,1): t′=tg, and ℤ((t′))[g]/(g²−1) has the same idempotents (1±g)/2, so the same two minimal ideals.

The Check now agrees with §4.3 (`README.md:744–747`, which embeds each component in a Novikov field over the fraction field of the kernel group algebra's component; here that field is ℚ((t))) and with the pinned docstring of `TauCeti/RingTheory/NovikovSeries/TotalQuotient.lean` quoted in the previous report.

**§4.3 source sentence, `README.md:755`.** Read against the text:

- rt3 lines 615–625 (file page 12, printed page 220) do say that, by (A.3), each field F_j is identified with the tensor product of Nov(G/Ker N, N) with a field. The locator "§2.1, p. 220" is right.
- rt3 (A.3) itself, lines 1912–1924 (printed page 240), gives the components as L_j⊗Q(Nov(F,N)) for a free complement F, with the total quotient ring of Nov(F,N), not Nov itself.
- On the §4.2 instance, G/Ker N=ℤ and the tensor product is ℚ⊗ℤ((t)), in which 2−t has no inverse; it is not a field and is a proper subring of the component F. So the README's "only the embedding above holds" is correct, and defining O(C) through the embedding into ℚ((t)) gives the order of a Laurent series, which is well defined on F.
- The locators of §4.2 that the sample covers: rt3 Lemma A.4 and proof, lines 1900–1931, and the minimal-ideal characterisation, lines 1896–1898, both on file page 32 = printed page 240. They agree.

Nothing else cites or depends on the changed text: a grep of the folder for `ℚ((t))`, "fraction field" and `Frac` finds only `README.md:721`, `:737` and `:746`, and `Suggested.lean` is unchanged.

### Gate, dependency check, elaboration

- **Gate, own run:** `gate MorseNovikov: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate adds `build=0`.
- **Dependency check:** `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0; the only diagnostics are "declaration uses `sorry`" at lines 102 and 149. The file is byte-identical to the one the previous review read, so its signature comparison and one-tactic probe stand (8 declarations, no lost binder, no padding).
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseNovikov'` is empty.
- **Description:** no sentence of it is made wrong by the change; it lists §4.2 among the sections with Checks.
- **Overlaps:** unchanged. #1854 is the only other open pull request touching this folder, and the generated merge-order block orders this pull request first. No id is dropped or defined only by a revision.

### Adversarial table

Rows for the changed statements, computed this round:

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2 Check, Q(Nov)=F×F for H=ℤ⊕ℤ/2 | exp(t); 1/(2−t); 2−t | exp(t) has 1/p! at t^p, not in ℤ[1/c] for p∤c, so not in F; 1/(2−t)=Σtⁿ/2ⁿ⁺¹∈F with denominators 2ⁿ⁺¹ unbounded, so not in ℚ⊗ℤ((t)) | F⊊ℚ((t)), ℚ⊗ℤ((t))⊊F, as stated | none |
| same, map from Q(ℤ[H]) | 1−g; t | 1−g↦(0,2) in both rings; t↦(t,t) | compatible with the components | none |
| same, second splitting | t′=tg | (1±g)/2 unchanged; t′↦(t,−t) | same two minimal ideals | none |
| §4.3 sentence on rt3 §2.1 | G=ℤ⊕ℤ/2 | Ker N=ℤ/2, G/Ker N=ℤ; ℚ⊗ℤ((t)) lacks (2−t)⁻¹, so it is not the field F | "only the embedding holds" is right | none |
| §4.3 order through the embedding | (2+t^m)⁻¹−1/2 | −t^m/4+…, order m in ℚ((t)) | agrees with the first Check of §4.3 | none |

Rows carried forward from the previous report (PRREVIEW-MorseNovikov~19, at e3dc9d3; the statements are untouched):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `lefschetz_fixed_point_formula` | T², A=[[2,1],[1,1]] | det(1−A)=−1, LHS −1; RHS 1−3+1=−1 | equal | none |
| same | S² antipodal; S¹ z↦z̄; S¹ z↦z²; ℝP² rotation | 0=1−1; 2=1−(−1); −1=1−2; 1=1 | equal, including nonorientable | none |
| same | E=0, three points with two swapped | LHS 1, permutation trace 1 | equal | none |
| same | identity of S¹; translation of ℝ | `hnd` fails; 0 against 1, excluded by `CompactSpace` | hypotheses needed | none |
| wrong model det(df−1) | S¹ reflection | −2≠2 | excluded by the Check | none |
| `poincare_hopf` | S³ nonvanishing field; T² constant field; S² height gradient; E=0, two points | 0=0; 0=0; 2=2; 2=b₀ | equal | none |
| `zeroDet` with `fst` | T² Morse gradient | det 1 everywhere gives 4≠0 | `snd` needed | none |
| §7.1/§7.3 sign | ∇f against −∇f, index i | (−1)^i against (−1)^(n−i) | as stated | none |
| `rationalBetti` | S¹; ℝP²; infinite discrete | (1,1); (1,0,0); `finrank` 0 | Checks discriminate | none |
| §1.1 | H=0; N=0 on ℤ; zero ring | Nov=R; Σt^k not finite below 1; both rings 0 | as claimed, "nontrivial R" needed | none |
| §1.2 | ℤ²→ℤ; ℤ⊕ℤ/2→ℤ | 1+e^(0,1)↦2; pullback of 1 is 1+g, (1+g)²=2+2g | as claimed | none |
| §1.3 | N(k)=−k; Π(1−tⁿ)⁻¹ | (1−t)(−t⁻¹Σt^(−k))=1; t⁴ coefficient 5 | as claimed | none |
| §1.5 | one orbit, F(s)=0 | F(e^h s)=−N(h); t²·U₃⊆U₅ | as claimed | none |
| §2.3 | A(s,y)=(s+1,−y), B(s,y)=(s,y+1) | AB≡BA mod 2; [a,b]=b⁻² | as claimed | none |
| §2.4 / §3.1 | circle, α=(c+sin θ)dθ | ∂p̃=±(1−t)q̃ | as claimed | none |
| §3.2 | change of lift by t² | [t²][t⁻²]=[1] | as claimed | none |
| §3.3 | (sin θ−C⁻¹)∂θ | C=2: zeros π/6, 5π/6; C=1/2: none | as claimed | none |
| §3.4 | T² with dx; Klein bottle with ds | 1−t a unit, H₂^Nov=0; 1±e^A a unit | as claimed | none |
| §4.1 | ℚ→ℚ by 2; A₀=3, A₁=5 | τ=1/2; 3/10=(1/2)·3·5⁻¹ | as claimed | none |
| §4.4 | ℤ→ℤ/2, s=t² | det[[1,cs],[c,1]]=1−c²s | as claimed | none |
| §5.1 | P=2x, h=3x | det(1−2)=−1 in both sections | as claimed | none |
| §5.2 | x+x³∓εx | indices +1, −1, −1, total −1; 0 alone −1 | as claimed | none |
| §5.3 | λ=1/2, 2, −2; Klein bottle f(θ)=−θ+ε sin θ | factors (1−t)⁻¹, 1−t, 1+t; Σ L(f^k)t^k/k=log((1+t)/(1−t)) | as claimed | none |
| §6.1 | V_t=(x₁²+(t−t₀),−x₂,…) | zeros ∓√(t₀−t), indices i and i−1 | matches rt3 (3.13) | none |
| §6.2 | H=ℤ⊕ℤ/2, h=(2,1) | d=2 in H/T; μ(h)=1 mod 3; ν(nh)=0 iff n even | as claimed | none |
| §6.4 | trefoil V=[[−1,1],[0,−1]] | det(tV−Vᵀ)=t²−t+1 | as claimed | none |
| §7.3 Checks | V=(−x,y), conjugated by (x,y)↦(−x,y) | det −1 before and after | as claimed | none |

### Sources: the seeded sample

Only “4.2 Abelian total quotient components” falls in the changed passages; its locators are checked above. The other sampled targets (1.2, 1.3, 1.5, 2.3, 3.2, 3.3, 3.4, 4.6, 5.2, 5.3, 6.2, 6.4, 6.5, 7.3) are untouched; the previous report's table carries their locator checks. The README flags no locator as unverified.

### Carried from the previous report, unchanged at this head

The supplier citations resolved on main (MorseTheory, HeegaardFloer, DifferentialGeometry, AlgebraicTopology, DGFloer, UniversalCovers, GeometricTopology), the pinned declarations opened, the headline list and the ownership audit against the open pull requests are those of PRREVIEW-MorseNovikov~19. The citation resolver again finds no unresolved citation or Lean name.

## Not verifiable

- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35; Dold, *Lectures on Algebraic Topology*, Chapter VII, §6; Turaev (1990, 2001) and Pajitnov (2006); Milnor, Whitehead torsion, §3. As in the previous report: published texts with no legal open copy in the cache, cited by locator. None is touched by the change.

## Source issues

- **Error** in rt3 at §2.1, printed page 220: the source says each field component of the total quotient of the Novikov ring is the tensor product of Nov(G/Ker N, N) with a field; it should say the component embeds in a Novikov field over that field (for G=ℤ⊕ℤ/2, ℚ⊗ℤ((t)) lacks an inverse of 2−t); affects nothing.
- **Error** in rt2 at equation (2), printed page 371: the source says each irreducible orbit contributes the exponent −(−1)^{i₀} on a closed oriented n-manifold; it should be (−1)^{n−i₀}, which agrees only for odd n; affects a stated result.
- **Error** in rt3 at the proofs of Lemmas 3.7 and 3.10, printed pages 229–230: the source takes d as the divisibility of h in H and asserts cyclic quotients that fail for H=ℤ⊕ℤ/2, h=(2,1); it should take the divisibility of h's image in H modulo torsion; affects the proof.
- **Misprint** in rt3 at §1.2, printed page 211: the source says the inclusion of the group ring into the Novikov ring is the identity exactly when N vanishes; it should say the inclusion is onto exactly when N vanishes; affects nothing.
- **Gap** in rt3 at equation (1.5), printed page 215, and Remark 4.3, page 237: the source states the Euler-refined equality but supports it only by Example 1.8's sketch; it should give a rigorous triangulation-adapted Morse model; affects a stated result.
