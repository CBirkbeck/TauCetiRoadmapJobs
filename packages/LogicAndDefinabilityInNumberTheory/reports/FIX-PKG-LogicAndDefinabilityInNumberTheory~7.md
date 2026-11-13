# FIX-PKG-LogicAndDefinabilityInNumberTheory~7

## F01 (P2) — applied differently

The finding is correct. `integrability_of_oscillatory_functions_on_local_fields_transfer_p` Theorem 3.3.2 (lines 670–681) prepares ℤ-valued functions and says nothing about the regularity of centres. Proposition 3.3.5 (lines 707–715) is a one-variable statement. The cached text has no dimension theory at all (grep "dimension": no hit in §3). README §2.2 had no dimension theory either. `cluckers_loeser_2008`'s proof of Theorem 3.2.1 (lines 678–696) defers to Denef–van den Dries.

Old → new: the regime (i) route (CL proof scheme, CGH 3.3.2/3.3.5) is replaced by:

- CCL analytic cells (Definition 1.4.1, Theorem 1.4.2) on each coordinate graph of f and f⁻¹, giving open analytic loci U, V;
- Z=U∩f⁻¹(V), Df invertible by the chain rule;
- complements bounded by the dimension laws.

§2.2 gains a fixed-F dimension target with four Checks. Regime (i) also asserts bianalyticity.

Why the reviewer's repair was changed:

- **Theorem 4.2.5 not used.** CCL Theorem 4.2.5 (lines 935–941) is stated for a *continuous* f:X→S with S⊆K. The stratification is asserted only in the first sentence of its proof, with no reference. A coordinate of a definable bijection need not be continuous.
- **Theorem 1.4.2 is enough.** It states that the centres are analytic on the base (lines 213–216, 221–227). This gives generic analyticity directly: a graph has one-point fibres, so every cell of the graph is a 0-cell in the value coordinate.
- **Dimension theory from an open source.** It is taken from Cubides-Kovacsics–Darnière–Leenknegt, which is open on arXiv: Definition 2.2 and the remark after it (lines 157–165), (HM1) (line 168), additivity Lemma 2.3 (lines 191–198). van den Dries–Scowcroft is paywalled; the sources service returned `uncertified` for van den Dries 1989, and I removed that trial entry.
- **CGH Proposition 3.3.5 dropped from §2.5.** No target consumes a fixed-F ball-to-ball property. Its locator was also dropped from the manifest.

Pattern repairs:

- In regime (ii), "a definable bijection preserves dimension" now cites CL Theorem 3.3.1(i),(iii) (line 587, p.15) and states both complement inclusions.
- In regime (iii), "dimension less than n" is made explicit as a covering by finitely many definable graphs. This is the sentence that is transferred; dimension theory in positive characteristic is not assumed.
- I searched the README for every other use of "dimension theory of §2.2", "Proposition 3.3.5" and "regime (i)". The only remaining use, §2.4 line 413, stays valid as written.

The source the reviewer says was "recorded in `sources.toml` as `cluckers_comte_loeser_2012`" was not in this checkout. I fetched it through the sources service under the same key (arXiv 0910.0799v1, certified).

## F02 (P3) — applied

Old → new: "a fixed sentence in the coefficient-free Denef–Pas language" becomes a fixed sentence θ of L_O, defined as follows:

- k is a number field and O its ring of integers;
- residue coefficients come from k and valued-field coefficients from O[[t]];
- θ is read in allowed local fields with t↦ϖ_K and ac(ϖ_K)=1.

§1.5 now has two parts:

- **(a)** Two allowed fields of large residue characteristic whose residue fields are isomorphic *as O-algebras* give the same truth value.
- **(b)** If θ holds in κ((t)) for every field κ⊇k of characteristic zero, it holds in all allowed fields of residue characteristic >N. Regime (iii) uses this form.

The source for this is `cluckers_loeser_exp` lines 1580–1617 (Notation 9.1.1, L_O and the map λ_O,K) and lines 1750–1763 (Proposition 9.2.1). §1.5 now has three Checks.

One hypothesis was added beyond the review. Isomorphism of the residue fields as fields is not enough once O≠ℤ, and I added this as a negative-control Check:

- Take O=ℤ[i] and write ι for the residue constant i. Consider the residue sentence "1+ι is a square".
- At p=5 the completions at 2−i and 2+i give ι=2 and ι=3, so 1+ι is 3 (not a square mod 5) or 4 (a square).
- For every p≡5 mod 8 the product (1+ι)(1−ι)=2 is a non-square, so exactly one of the two completions satisfies the sentence. For p=13, 1+ι is 6 (non-square) or 9 (square).

The same pattern was already handled correctly elsewhere. §3.10 and §5.2 already say "compatibly isomorphic residue field", and regime (iii) of §2.5(b) now cites §1.5(b). §3.9's citation "Definition 9.1.1" was corrected to "Notation 9.1.1" (`cluckers_loeser_exp` line 1580).

In `Suggested.lean` only docstrings changed. `ax_kochen_ring` now says it is the coefficient-free ℤ case of §1.5(a). The module docstring now lists the coefficient form of the transfer as not statable: it lacks three-sorted ac-valued structures.

## Checks

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean`, run from the content checkout, exited 0. It produced exactly twelve `declaration uses sorry` warnings (lines 38, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169, 185) and nothing else. The line numbers moved by two because the docstrings are longer. No `TauCeti.*` build was needed.
- **Signatures.** A scratch copy of the file with `#check @name` for all 18 declarations elaborated with exit 0. All 18 elaborated types are identical to those in `signatures.md` and to their README statements. The file has no `variable` block, so no binder is lost.
- **Dependency check.** Output: `depcheck: 56 roadmaps, 644 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citations and no Lean names found nowhere. The previous lead, `Diophantine.mrdp`, is now resolved.
- **Manifest.**
  - `sources.toml` parses with 41 entries. Two are new, both cited for 2.2 and 2.5: `cluckers_comte_loeser_2012` and `cubides_darniere_leenknegt_2017`. Both are certified, from arXiv, and the README uses arXiv numbering.
  - The CGH locator no longer lists Proposition 3.3.5.
  - `needs-references.toml` was not created: no text is missing.
- **Greps.** README, Lean and manifest contain no LaTeX delimiters, no machine paths and no process words. Every Lean name occurs in the README, and no new backticked own name was added.
- **Gate failures listed in the brief.** None.
- **Ownership.** `roadmaps grep` searched main and the 367 open heads for "P-minimal", "Macintyre", "p-adic cell decomposition" and "subanalytic". Nothing owns p-adic definable dimension theory. StratifiedSpacesAndTameTopology owns real o-minimal cells only. This roadmap already owns the fixed-F Macintyre cells of §2.2, so it owns the new dimension target. `design/plan.json` is unchanged, since no new supplier gap was needed.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.5(a) | ∃x x²+1=0 at p=2,3,5 | ℚ₂: no (−1≡7 mod 8). 𝔽₂((t)): yes (x=1). p=3: no/no. p=5: yes/yes (2²≡−1) | Holds with N≥2. |
| §1.5(a), O-algebra hypothesis | O=ℤ[i], "1+ι square", p=5 and p=13 | 3 vs 4 mod 5 and 6 vs 9 mod 13: non-square vs square | Without the hypothesis the statement is false. The hypothesis was added and the instance is a Check. |
| §1.5(b) | ∃x x²=1+t | κ((t)): yes (binomial series). Odd residue characteristic: yes (Hensel). ℚ₂ with ϖ=2: 3≢1 mod 8, no. 𝔽₂((t)): squares lie in 𝔽₂((t²)), no | Holds with N≥2. N depends on the coefficients. |
| §1.5, coefficient agreement | a=5∈ℤ[[t]]; a=1+t | ord λ(5)=0 for p≠5 but 1 in ℚ₅. λ(1+t)=1+ϖ: ord 0, ac 1 in every field | The norm condition is needed and stated. |
| §2.2 analytic cells, open/empty-interior dichotomy | ℚ_p-cell {t: t∈P₂}; graph t=c(x) | P₂ is open by Hensel. A graph has one-point vertical fibres, so no interior | Holds. |
| §2.2 dimension laws | graph of x²; p^ℤ; digit interleaving ℤ_p→ℤ_p²; algebraic numbers in ℚ_p and their complement | dim 1, Haar 0. p^ℤ is infinite with empty interior, so it is not definable. The interleaving is a homeomorphism from dim 1 to dim 2, so it is not definable. Two sets with empty interior have union ℚ_p | Each law needs definability. Added as Checks. |
| §2.2 nullity | {(x,0)}; F⁰ with m=0 | Product Haar measure 0. dim F⁰=0 is not <0, so F⁰ is not null (mass 1) | Holds. Strict inequality is required. |
| §2.5(b)(i) route | f=x³ on ℚ₃ (injective: ζ₃∉ℚ₃) | U contains ℚ₃ minus finitely many points. 0∉V⊆int(Y). Z⊆ℚ₃∖{0}, so Df=3x²≠0 on Z. Discarded set finite, Haar 0 | Holds. A singular point can never enter Z, since the chain rule forbids it. |
| §2.5(b)(i) route | f(x)=1/x on F×, f(0)=0 | U=V=F×, Z=F×, Df=−x⁻², complement {0} | Holds. |
| §2.5(b)(i), n=0 | X=Y=point | No coordinates, so U=X and Z=X. The empty derivative matrix is invertible | Holds. |
| §2.5(b)(ii) complements | f=x³ on ℚ((t)) | Z_f=X, Z_(f⁻¹)=Y∖{0}, Z=X∖{0}, dim{0}=0<1 (CL 3.3.1(i),(iii)) | Holds. |
| §2.5(b)(iii) | "Z open" with coefficient t; s on 𝔽₂((t)) | Now covered by §1.5(b). s: difference quotients t and t⁻¹, char 2 | Covered. The negative control is unchanged. |
| Change-of-variables Checks | x=πu at q=3; diag(π,π²); x↦tx at q=2 | 1/3, 1/27, 1/2 | Unchanged. They depend only on (a). |

## Notes for the maintainer

- No Lean name changed, was added or was deleted. Other roadmaps cite no name of this roadmap that changed.
- §1.5 now defines "allowed local field" and L_O. §§3.9–3.10 and 5.2 already use these words in the same sense.
- Ownership against the open pull requests named in the brief was checked through `roadmaps grep` over their heads. The later roadmaps the reviewer could not read (TopologicalMirrorSymmetryForHitchinSystems, LogicAndDefinabilityInNumberTheoryPartII) were not checked.
- The review contained no instructions to run commands or change process, so nothing suspicious is quoted.
