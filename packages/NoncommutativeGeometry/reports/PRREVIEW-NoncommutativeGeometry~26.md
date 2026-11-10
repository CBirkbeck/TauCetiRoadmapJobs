# Review of NoncommutativeGeometry (pull request #1143 at c19d9aa)

**Verdict:** needs changes

Incremental re-review of the 18 lines changed since 6509d68, all in the Carey–Rennie–Sukochev–Zanin (CRSZ) reference bullet of `TauCetiRoadmap/NoncommutativeGeometry/README.md` (1874–1890). `Suggested.lean` and every file outside the folder are unchanged.

- The change repairs r25 R03 and is correct, including its new remark on the sign of CRSZ Definition 15 (values below). It introduces no new defect.
- The two findings carried from r25 remain. Neither can be repaired in the folder: one is repaired in OperatorKTheory #866, the other in the pull-request description. The README needs no further edit.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r25 R01 (r24 R01, r23 R02, r22 R01, r21 R01, r20 R01); not repaired.

**Location.**
- README 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- README 1831: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ.

**Witness.** OperatorKTheory #866 is still at 1377338a. Its `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1783–1784 defines `A_θ` and "the canonical trace `τ=HaarIntegral∘E` using D2's expectation";
- 2326 consumes "K7's rotation algebras with their K-groups".

**Repair.** Unchanged. This roadmap is on main, so it is earlier than #866 and may not cite it; the README already takes the only admissible direction.
- State in the description that this pull request merges before #866.
- #866 replaces 1783–1784, and the presentation bullet after them, by a citation of NoncommutativeGeometry N6, and rewrites 2324–2326 as consumption of N6.
- **Test:** afterwards `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P3) — The description describes an earlier head and states no merge order

Carried from r25 R02 (r24 R02, r23 R04, r22 R02, r21 R03, r20 R03). The description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "which merge first: #864";
- a build report for head 84190a1e.

**Witness.**
- `git diff --stat origin/main...HEAD` lists `Suggested.lean`.
- README writes `x⊠_u y` and `x⊠_s y`; no *Needs:* line names AlgebraicKTheory.
- #864 is not open.
- #1187 conflicts with this pull request in this folder's `Suggested.lean` (overlap check).

**Repair.** Rewrite the description for this head.

Contents:
- N1.Tensor consumes the pinned Banach and locally convex projective tensors.
- N1.Cyclic consumes the pinned bounded coboundary, currying and dual actions.
- N3–N4 consume NoncommutativeIntegration and VonNeumannAlgebras V4.Core.
- N4 proves additivity of `dixmierTrace` on positive operators and builds the linear Dixmier trace for dilation-invariant ω.
- N5's Hochschild-class theorem holds for every dilation-invariant ω (Connes IV.2 Theorem 8; CRSZ Theorem 16).
- N6 builds `A_θ` on Tau Ceti's full crossed product.
- N7 consumes HilbertModules H1–H3.
- `Suggested.lean` states only `bijective_matrixExtension`.

Merge order:
- #866 merges after this pull request (R01).
- #1187 rebases after it.

Drop the #864 line and the build report for 84190a1e.

## Previous findings

- R01 — not repaired: README 50–56 still reads "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ`"; #866 is unchanged at 1377338a with `τ=HaarIntegral∘E` at 1784 and "K7's rotation algebras" at 2326. Carried as R01.
- R02 — not repaired: the description still reads "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged" and "which merge first: #864". Carried as R02.
- R03 — repaired: README 1874–1877 now reads "for an integer p≥1, a smooth (QC∞) spectral triple whose parity is that of p, graded by γ when p is even and ungraded with γ=1 when p is odd (Definitions 12–13, p. 8)".

## Verified sound

**Gate, dependency check, build.**
- The gate, rerun at c19d9aa against `origin/main`: every scanner 0, `OK`; the worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty. `git diff --stat 6509d68 HEAD` touches only the README (14 insertions, 4 deletions).
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0; the only warning is `declaration uses sorry` at 64:8. The file is unchanged since r25, so its signature comparison, headline list and one-tactic probe stand as in r25.

**Sources (4 locators of the changed passage, all read in carey-rennie-sukochev-zanin, arXiv v1).**
- Definitions 12–13, p. 8: lines 444–453. QC∞; even means a self-adjoint involution Γ commuting with the algebra and anticommuting with D; odd sets Γ=1; the two summability classes. ✓
- Definition 15, p. 9: lines 460–473. The operator is F, then Γ, then the p+1 commutators; the character is half its trace. ✓ as the bullet describes it.
- Theorem 16, p. 9: lines 503–509. p a natural number; parity of the triple that of p; (a) weak trace class, every normalised trace; (b) logarithmic ideal, every Dixmier trace. ✓
- Definition 2 and Example, p. 4: lines 168–188, as in r25. ✓

The seeded sample has no other target in the changed passage; its remaining targets are in untouched text verified in r23–r25.

**Mathematics of the change.**
- `Tr′(γa₀[F,a₁]⋯[F,a_p])=½Tr(γF[F,a₀]⋯[F,a_p])`, by hand from `Tr′(T)=½Tr(F(FT+TF))` (README 1076). Even p: `FT=−γFa₀X`, `TF=γa₀FX`, so `F(FT+TF)=−Fγ[F,a₀]X=γF[F,a₀]X`. Odd p, γ=1: `FT+TF=[F,a₀]X`. This is README 1081's τ_p without λ_p, so the bullet agrees with N3 and N5.
- For even p, `Fγ=−γF`, so the printed order of Definition 15 gives the negative. The odd case is unaffected, which is why r25's circle row (`½Tr(F[F,z⁻¹][F,z])=2`) did not see it.
- The torus witness: the cycle is closed (both terms have boundary `z₂⁻¹⊗z₂−z₁⁻¹z₂⁻¹⊗z₁z₂+z₁⁻¹⊗z₁`); `[D,z_j]=z_jσ_j`, so `Ω(c)=σ₃(σ₁σ₂−σ₂σ₁)=2i`; the rest is in the table.
- No other passage cites Definition 15; N5 (1392–1393) cites only Theorem 16, and its statement uses the README's own τ_n.

**Ownership and overlaps.** The overlap check lists no dropped or revision-only id; the citation check lists nothing missing. The change adds no object, so the r25 ownership reading (SpectralManifolds, CompactQuantumMetricSpaces) stands. #1187 is covered by R02.

**Adversarial pass.** The changed rows were computed in a pure-Python scratch script; the others are carried from the r25 report, whose statements this diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Bullet: Dixmier side on the 2-torus (1888–1889) | spectrum `1/(1+(m+½)²+(n+½)²)`, multiplicity 2, R=1000 | partial sum 86.76 against `2π·log(1+R²)`=86.81, so `Tr_ω((1+D²)⁻¹)=2π`; times `Ω(c)=2i` gives 4πi | true | none |
| Bullet: `½Tr(γF[F,a₀][F,a₁][F,a₂])` on the volume cycle (1890) | lattice sum over the disc of radius R=50, 200, 600 | 12.565743i, 12.566331i, 12.566366i; `4π`=12.566371 | true | none |
| Bullet: printed order `½Tr(Fγ…)` (1886–1890) | same sums, `Fσ₃=−σ₃F` | −12.566366i at R=600, against the Dixmier side +4πi | true: the printed sign fails for p=2 | none (Source issues) |
| Bullet: `Tr′` identity (1884) | even p with γ; odd p with γ=1 | both sides `½Tr(γF[F,a₀]X)`; odd-p circle value 2 on both (r25) | true | none |
| Bullet: hypotheses of Theorem 16 (1874–1883) | carey-rennie-sukochev-zanin 449–453, 503–509 | parity, Γ=1, (a) and (b) all present | true | R03 repaired |
| `A_θ` ownership (50–56) | #866 at 1377338a | 1784 `τ=HaarIntegral∘E`; 2326 "K7's rotation algebras" | two owners | R01 |
| N4 linear Dixmier trace and Checks (r25) | T=−diag(1/(j+1)); T⊕(−T), M=10³…10⁶ | linear −1 against pinned 1; pinned 1.9695, 1.9810, 1.9840 → 2, linear 0 | true | none |
| N5 ω-hypothesis and CRSZ route (r25) | k=2, 3; circle D=diag(k+½) | `|M(θ_(1/2)f)−M(f)|`=0.1061, 0.0601; 2.0=2; trace-class difference 2.544387 | true | none |
| N5 absolute-value and circle Checks (r25) | N, M=10³…10⁶ | 1.284, 1.171, 1.142 → 1; 2.334, 2.208, 2.175 → 2 | true | none |
| N7 ω-hypothesis (r25) | lattice | 0.14616, 0.14853 → `1/(2π)` | true | none |
| `bijective_matrixExtension` (r25) | ℚ against M₂(ℚ), n=0, 1; ι=∅ | `HC⁰` 1 vs 1; `HC¹` 0 vs 0; ι=∅ gives 0≠1 | true | none |
| N3 and N4 rows, torus conventions and the remaining r25 rows (r25) | as in r25 | `λ₁=−0.886227(1+i)`, pairing −1; `2H_N=28.7855`; `U₂U₁=𝐞(θ)U₁U₂`; 16.981582i; 0.801154i; ζ(1.1)=10.5844 | true | none |

## Not verifiable

- None. Every locator of the changed passage was read in the cached arXiv v1 text. The published version (J. Spectral Theory 6) was not read; the bullet cites the v1 numbering it uses.

## Source issues

- **Error** in carey-rennie-sukochev-zanin at Definition 15 (with Theorem 16), p. 9: the source says the character is half the trace of F, then Γ, then the commutators; it should have Γ before F, since the printed order gives −4πi against the Dixmier side 4πi on the 2-torus for p=2; affects a stated result.
- **Misprint** in carey-rennie-sukochev-zanin at Definition 2, p. 4: the source says a dilation-invariant extended limit is a state on l∞ invariant under every σ_k; it should also require vanishing on c₀, which excludes evaluation at index 0; affects nothing.
