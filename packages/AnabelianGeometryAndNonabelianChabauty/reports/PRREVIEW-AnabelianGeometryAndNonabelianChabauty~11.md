# Review of AnabelianGeometryAndNonabelianChabauty (pull request #3027 at 71bbefa)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the last review, and nothing changed elsewhere in the pull request breaks a citation here. AlgebraicModuliForArithmeticGeometry moved its Layer 9 pairs material to Part II, but this roadmap cites only that roadmap's §2.1 (Hom and Isom schemes) and §§7.3–7.6, and both are unchanged. The three small corrections of the last review are not yet repaired and are repeated below; there is one new format note. One fact about §2.0a is left to the human reviewers.

## C01 — Three locators point to the wrong subsection, tag or page

A reader who follows these locators lands next to the cited material, not on it.

- **§6.3, "Twisted height module" (line 7983).** The text cites "[Balakrishnan and Dogra] §3.1, pp. 12–14" for the twisting construction. In that paper §3.1 is mixed extensions. The twisting construction is §3.2, "Twisting and mixed extensions", which starts on p. 12 (bdii line 551).
- **§7.3 (line 8654).** "Lemma 59.97.9 (Tag 0F13)": Tag 0F13 is Section 59.97 of the Stacks project, and the lemma is Tag 0F1P.
- **§0.31 (line 2730).** "Section 1, twisting and nonabelian exactness, printed pp. 4–6": the exact sequence of pointed sets for a subgroup is on p. 9 (kim2005 lines 403–409).

The fixes are "§3.2, pp. 12–13", "Lemma 59.97.9 (Tag 0F1P)" and "printed pp. 4–6 and 9".

## C02 — The hypothesis line of §0.31 cannot be parsed

Line 2722 reads "Parent action, orbit-fibre equivalence and kernel homeomorphisms embedded i retains its given topology f surjective." A reader cannot tell which standing hypotheses apply. One possible rewording: "Standing hypotheses (H22) for the named kernel and (H25) for an embedded kernel i, which keeps its given topology; f is surjective."

## C03 — The scope and Layer 2 dependency paragraphs do not record §2.0a

BaseChangeAndGaloisRepresentationsForUnitaryGroups names this roadmap as the owner of Radford's theorem: its README cites §2.0a at lines 728, 1360, 1362 and 1469. Here, however, two paragraphs leave §2.0a out:

- "Scope and ownership" (line 8960) does not mention the shuffle algebra, Lyndon words or Radford's theorem.
- The Layer 2 `### Dependencies` paragraph (line 5387) does not mention Mathlib's `FreeMonoid`, `MvPolynomial` or `Algebra.TensorProduct`, although §2.0a's *Needs:* line names them.

Adding one clause to each paragraph would record them.

## N01 — Two code spans in §4.6 and in the supplier contracts take in prose words

On line 6698 the code spans read "`subgroup H¹_g(G_F,V)`", "`H¹_g at`" and "`ℚ_p⊆B_cris^(φ=1)⊆B_cris⊆B_dR:`". Line 9028 has "`subgroup H¹_g`". Moving "subgroup", "at" and the colon outside the backticks fixes them.

## Previous findings

The previous report had no findings. Its three small corrections are accounted for here:

- C01 — not repaired: line 7983 still cites "§3.1, pp. 12–14", line 8654 still has "Lemma 59.97.9 (Tag 0F13)", and line 2730 still has "printed pp. 4–6".
- C02 — not repaired: line 2722 still reads "kernel homeomorphisms embedded i retains its given topology f surjective."
- C03 — not repaired: line 8960 mentions neither Lyndon words nor Radford's theorem, and line 5387 does not name `FreeMonoid`, `MvPolynomial` or `Algebra.TensorProduct`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §3.9 dominant Hom locus (cites AlgebraicModuliForArithmeticGeometry §2.1) | X=Y genus 2; g_X=3, g_Y=2; a constant map; an elliptic curve E | Riemann–Hurwitz bound `(2·2−2)/(2·2−2)=1`, and `4/2=2`; `deg f*T_Y=1·(2−4)=−2<0`, so `H⁰=0`; constant map: trivial bundle, `h⁰=1`; translations of E give a 1-dimensional `Hom^dom` | Holds |
| §3.9 locators | m96 Lemma 8.3; m99 paragraph after Lemma 15.2 | m96 lines 1358–1363 are on printed pp. 610–611; m99 lines 3066–3074 are on p. 76 (finite, unramified, Hurwitz bound, shrink M) | Hold |
| Supplier citation AlgebraicModuliForArithmeticGeometry §2.1 at this head | Hypotheses of `homAndIsomSchemes` (supplier README line 913) against proper smooth curves of genus ≥2 | It needs a locally Noetherian base, a projective flat source and a quasi-projective target. `ω^{⊗3}` has degree `6g−6 ≥ 2g+1` for g≥2, so it is relatively very ample and both curves are projective | Holds; the citation resolves |
| Supplier ids the revision moved (old 9.10a–9.13) | grep of this README for AlgebraicModuliForArithmeticGeometry | Eight citations, at lines 3935, 4359, 6241, 6273, 6327, 6433, 6473 and 9054: all are Layer 2 §2.1 or §§7.3–7.6 (supplier lines 890, 8888–9329), and none is to Layer 9 | No broken citation |
| §4.6 Bloch–Kato Checks | `V=ℚ_p(1)` and `V=ℚ_p` over `ℚ_p`, p odd | `ℚ_p(1)`: `dim H¹=2`, `H¹_f=1`, `H¹_g=1+dim D_cris(ℚ_p)^{φ=1}=2`, `H¹_e=1−0=1`. `ℚ_p`: `dim H¹=2` (ord, log), `H¹_f=1+0=1`, `H¹_e=1−1=0` | Holds; N01 is about form only |
| Headline `anabelian_isom` | X=Y=P¹; X=Y of genus 2 with e=id; direction of `f.inv` | genus 0: all of `PGL₂(K)` works, so `∃!` fails, and `hX`, `hY` exclude it; genus 2: only id; pullback along `f.inv : Y ⟶ X` sends covers of X to covers of Y, like `e.functor` | Holds; elaborated type identical to the last round |

The rows for the statements not touched here stand as in the previous review, of `8d0b573`.

- The folder is unchanged since `8d0b573`: the diff is 0 lines. Against the merge base `aecb53a` there are 29 insertions and no deletions, and all 8 layers are present with their titles, so nothing is removed or renumbered. `Suggested.lean` is unchanged.
- Source locators checked against the text: 6. They are m96 Lemma 8.3 (pp. 610–611), m99 p. 76, bdii §3.2 (line 551), kim2005 p. 9 (lines 403–409), and stacks Tags 0F13 and 0F1P.
- Cross-roadmap citations resolved at this head: AlgebraicModuliForArithmeticGeometry §2.1 and §§7.3–7.6. The other side was checked too: BaseChangeAndGaloisRepresentationsForUnitaryGroups cites §2.0a; EffectiveDiophantineMethods (main) cites §5.10 and §§6.1–6.8 (here at lines 7510 and 7645 onwards); GaloisSectionsPadicPeriodMaps cites §7.1 (line 8438).
- Automatic checks: the worker's run passed every check. In my own gate run every check passed except the one for files outside the folder: it listed 115 files, all in folders this pull request owns. `git diff --name-only origin/main...HEAD` lists nothing outside `TauCetiRoadmap/`. Since `8d0b573` the files under `.github/`, `umbrellas/` and `ComplexCurveModuli/` changed only through the merge of main.
- Dependency check: `depcheck: 128 roadmaps, 1429 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (61:8). A `#check @name` probe of all three declarations returns the same types as in the last round: `anabelian_isom` keeps `hfg`, both genus bounds and both finite-dimensionality instances, and the bodies of `finiteEtale` and its instance are real.
- Pull request text: the description says that the additions to general roadmaps mention neither the family nor the formal proof, and that this `Suggested.lean` is not among the six it changes. This head agrees with both: no "formal proof" or Riemann hypothesis occurs in the README, and `Suggested.lean` has no diff. No other open pull request changes this folder.

Overlap check: searched FunctionFieldArithmeticPartII, GaloisSectionsPadicPeriodMaps and MordellLawrenceVenkateshPartII (open, closest by vocabulary), and PadicDifferentialEquationsAndRigidCohomology, EffectiveDiophantineMethods and InverseGaloisAndArithmeticFundamentalGroups (main, closest by vocabulary), at their current heads. The search covered the objects owned here (Selmer varieties, Chabauty–Kim loci, section classes, nonabelian H¹, unipotent fundamental groups, Isom theorems, Lyndon words) and citations of this roadmap; the list by results is empty. Three objects are shared, as in the last round:

- Section classes are owned here (§7.1) and cited by GaloisSectionsPadicPeriodMaps.
- The Chabauty–Kim height data are owned here (§§6.1–6.8) and cited by EffectiveDiophantineMethods §6.14.
- Lyndon words and Radford's theorem are owned here (§2.0a), and BaseChangeAndGaloisRepresentationsForUnitaryGroups cites them. The open CombinatoricsOfWords (Layer 2.1) also defines Lyndon words. This roadmap is on main and so is the owner, as the last round found; that roadmap was not re-read this round.

FunctionFieldArithmeticPartII mentions the section conjecture only as Bresciani's birational form, which it states for itself.

Source independence: changed passages only. No passage changed, so nothing new was compared. Re-reading §3.9 against m99 p. 76 and m96 Lemma 8.3 shows only forced phrases ("finite étale over M", "Hurwitz formula") in common. The largest share of locators is still kim2005, 136 of 522, and the arrangement was not compared again because no layer was added, removed or reordered.

Research link: Layers 2 and 4–6 develop the unipotent path torsors, Selmer varieties and quadratic Chabauty equations of Kim (2005, 2009), Balakrishnan–Dogra (2018) and Balakrishnan–Dogra–Müller–Tuitman–Vonk (2019). Layer 3 is the Isom theorems of Tamagawa (1997) and Mochizuki (1996, 1999). §2.0a is Radford's 1979 theorem as stated by Hoffman (2000). This line rests on the README and the sources read.

## Not verifiable

- The items listed in the previous review still stand, and no passage citing them changed:
  - Radford 1979 (paywalled);
  - the sign in Tamagawa 1997, Lemma 4.7(c);
  - Labute 1967 (the cache holds only the catalogue page);
  - Huber–Wildeshaus, Hadian's thesis, Serre Chapter V, Stix 2013 and Olsson.

Automatic checks set aside as false positives: in my own gate run, the check for files outside the folder listed 115 files. All of them lie in the other roadmap folders this pull request changes, which are its own.

## Source issues

- none

## For the human reviewers

- §2.0a (the definition of Lyndon words and Radford's theorem) is used by no other section of this roadmap. It is the general statement that BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.0a cites. The open CombinatoricsOfWords (Layer 2.1) also defines Lyndon words.
