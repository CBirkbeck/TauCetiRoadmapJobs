# Review of InertAnticyclotomicCMMainConjecture (pull request #2435 at 09efa59)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "shows that the quotient of the adjoint by γ⁺−1 and the torsion submodule of the quotient of the relaxed dual by γ⁺−1 have the same characteristic ideal over Λ_R. That theorem carries no involution" (`README.md:583`).
- R02 — repaired: "Reduce this comparison modulo γ⁺−1. … so γ⁺−1 has finite kernel and finite cokernel on every subquotient of them, and the reduced map is a pseudo-isomorphism over Λ_R (BIL86, proof of Theorem 3.24, p.364" (`README.md:583`).
- R03 — repaired: "The inflation–restriction argument of §3.2 identifies those parts with the modules over K∞ and K̃∞, for W′ as for W and at the finite layers of K̃∞ as at the K_n" (`README.md:583`).

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| §4.3 Theorem 3.22 step (R01) | M=Λ_(2)/(γ⁻−1−a), K=ℚ(i), p=7, R=O=ℤ₄₉ (unramified over ℤ₇), a=7 | quotient of adjoint and (M/(γ⁺−1)M)_tors have the same ideal, no involution | Ext¹(M,Λ_(2))≅M; both sides (T−7); BIL86 Theorem 3.22, p.363, has no twist | holds |
| §4.3 net involution | same M; ι(T−a) | one involution, from the comparison with the adjoint | BIL86 p.364: f(Σ(L∞))=f^·((S(L∞))_tors), f^·(T)=f(1/(1+T)−1); a′=1/8−1=−7/8≠7 | holds |
| §4.3 error terms mod γ⁺−1 (R02) | T_p, dual of E[p^∞], duals of local points; γ⁺ acting by u=φ_p(γ⁺) | γ⁺−1 has finite kernel and cokernel on every subquotient | u≠1 and c(u)≠1, E[p^∞] being faithful over K₀K̃∞; P(γ⁺)=0, P(1)≠0 kills both; T[u−1]=0, T/(u−1)T≅R/(u−1) | holds |
| §4.3 reduced map (R02) | the two sequences of BIL86 Proposition 3.17, snake lemma on image I | pseudo-isomorphism over Λ_R | kernel and cokernel are subquotients of I[γ⁺−1], A/(γ⁺−1)A, B[γ⁺−1], B/(γ⁺−1)B, all finite; BIL86 lines 622–626 | holds |
| §4.3 Check: reduction is a separate step | A=(ϖ_R,γ⁺−1)⊂Λ_(2) | a Λ_(2) pseudo-isomorphism need not reduce to one | cokernel Λ_(2)/(ϖ_R,γ⁺−1), dimension 1 of 3; reduced cokernel Λ_R/(ϖ_R), characteristic ideal (ϖ_R)≠Λ_R | holds |
| §4.3 total ramification | K=ℚ(√−23), p=5 | places of K₀ above p totally ramified in K₀K̃∞ | Gal(K̃∞/K)≅U¹(ℚ₂₅)≅ℤ₅², all inertia (h_K=3); inertia over K₀ has index prime to 5, hence all | holds |
| §4.3 descent at layers of K̃∞ (R03) | K=ℚ(√−23), p=5, [L:K]=5^k | K₀∩L=K and Gal(K₀L/L)≃G | [K₀∩L:K] divides gcd(72,5^k)=1; #G=3·24=72 | holds |
| ArithmeticGaloisDuality §R02.2.2 (new *Needs:*) | its README at its open head, heading R02.2.2 | inflation–restriction for W′ and the layers of K̃∞ | five-term sequence; outer H¹, H² of G on 5-primary coefficients killed by 72, hence zero | holds |

The rows for statements this change does not touch stand as in the previous review, of 4e14b57.

- Source locators checked against the text: BIL86 6 (Proposition 3.17, p.361; Lemmas 3.18–3.21, pp.362–363; Theorem 3.22, p.363; proof of Theorem 3.24, p.364, lines 622–627; remark after it, p.365, lines 641–643). Formulas read from page images of the cached Numdam scan.
- Cross-roadmap citations resolved: ArithmeticGaloisDuality §R02.2.2 (five-term sequence) and SelmerIwasawaCohomology §§3.11–3.12 at their open heads. The new §4.3 edge goes to a supplier that §3.2 and the supplier contract (`README.md:93`) already cite.
- Gate rerun at 09efa59 with the targeted build: every check 0, `build=0`, OK. Dependency check: "depcheck: 255 roadmaps, 2431 edges, 0 problem(s)". The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- `lake env lean` on Suggested.lean: exit 0, no message. The file is unchanged since 920db3f and declares nothing, so there are no `#check` signatures to compare.
- Pull-request text against the head: the Suppliers sentence ("the inflation–restriction argument of §3.2") matches line 579. The change adds no supplier, section, heading or declaration. No finding.
- Overlap check: grepped all open heads and main for Billot, the Iwasawa adjoint and reduction modulo γ⁺: owned only here. Read SelmerIwasawaCohomology §§3.11–3.12 and ArithmeticGaloisDuality §R02.2.2. The change adds no object. The previous review read the scope of ModularIwasawaMainConjecturesPartII, AnticyclotomicLocalUnits and NonordinaryCMSpecialValues; their shared objects stand as it found them (D01).
- Source independence: changed passages only. 6 passages compared with 1 source (BIL86 pp.361–365). Nothing is shared beyond forced terms; the longest overlap is the translated phrase "reduction modulo γ−1 … pseudo-isomorphism over Λ₂" (4 words). Largest share BKO21, 32 of 96 locators. The contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- BRU67, pp.121–124: waived in the manifest, cited by locator, not read.
- Inputs of the §4.3 route outside BIL86: Lemmas 3.19–3.20 are Perrin-Riou's thesis [6] (BIL86 pp.362–363), and the absence of pseudo-null submodules is Greenberg [3], Proposition 5 (BIL86 pp.359, 366); neither was read.

## Source issues

- **Misprint** in BIL86 at proof of Theorem 3.24, p.364: the first displayed identity of the proof writes the strict Selmer module over a lower-case f∞; it should be F∞, the ℤ_p²-extension F(E_(p^∞)); affects nothing.

## For the human reviewers

- BKO21 was read from an operator-held local PDF that carries JSTOR download terms (BKO21 line 375). README line 859 links a Caltech institutional copy instead.
